// chat_viewmodel.dart
import 'messages_viewmodel.dart';

enum MessageType { text, voice, video, image, file, emoji }

class ChatMessage {
  final MessageType type;
  final bool isMe;
  final String? text;
  final String? emoji;
  final String? imageUrl;
  final int? imageWidth;
  final int? imageHeight;
  final String? videoUrl;
  final int? videoWidth;
  final int? videoHeight;
  final String? videoThumbUrl;
  final String? fileName;
  final String? fileSize;
  final int? voiceDurationSec;
  final String? voiceUrl;
  final ReadMark? status;
  final String? time;
  final String? senderName;
  final MessageType? replyType;
  final String? replyPreview;
  final String? replyThumbUrl;
  final bool isEdited;
  final bool isSelected;
  const ChatMessage({
    required this.type,
    required this.isMe,
    this.text,
    this.emoji,
    this.imageUrl,
    this.imageWidth,
    this.imageHeight,
    this.videoUrl,
    this.videoWidth,
    this.videoHeight,
    this.videoThumbUrl,
    this.fileName,
    this.fileSize,
    this.voiceDurationSec,
    this.voiceUrl,
    this.status,
    this.time,
    this.senderName,
    this.replyType,
    this.replyPreview,
    this.replyThumbUrl,
    this.isEdited = false,
    this.isSelected = false,
  });

  ChatMessage copyWith({
    bool? isSelected,
  }) {
    return ChatMessage(
      type: type,
      isMe: isMe,
      text: text,
      emoji: emoji,
      imageUrl: imageUrl,
      imageWidth: imageWidth,
      imageHeight: imageHeight,
      videoUrl: videoUrl,
      videoWidth: videoWidth,
      videoHeight: videoHeight,
      videoThumbUrl: videoThumbUrl,
      fileName: fileName,
      fileSize: fileSize,
      voiceDurationSec: voiceDurationSec,
      voiceUrl: voiceUrl,
      status: status,
      time: time,
      senderName: senderName,
      replyType: replyType,
      replyPreview: replyPreview,
      replyThumbUrl: replyThumbUrl,
      isEdited: isEdited,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

enum ChatType {
  private, // 私聊
  group,   // 群聊
}

class ChatViewModel {
  final String partnerName;
  final String lastSeen;
  final List<ChatMessage> messages;
  final ChatType chatType; // 聊天类型
  const ChatViewModel({
    required this.partnerName,
    required this.lastSeen,
    required this.messages,
    required this.chatType,
  });

  // 私聊示例
  factory ChatViewModel.privateChat() {
    return ChatViewModel(
      partnerName: "刘锁",
      lastSeen: 'last seen yesterday at 23:10',
      chatType: ChatType.private,
      messages: [
        ChatMessage(type: MessageType.text, text: '嗯', isMe: false, time: '16:10'),
        ChatMessage(type: MessageType.text, text: '目前平台运行情况怎么样？', isMe: true, time: '16:11', status: ReadMark.doubleGreen),
        ChatMessage(type: MessageType.text, text: '还行吧 具体我也不清楚', isMe: false, time: '16:12'),
        ChatMessage(type: MessageType.emoji, emoji: '🙂', isMe: false, time: '16:13'),
        ChatMessage(type: MessageType.image, imageUrl: 'https://www.iiimaster.com/files/4cbdb3035714ab67db6c23421634e3cd.jpg', imageWidth: 1280, imageHeight: 720, isMe: true, time: '16:14', status: ReadMark.singleGrey),
        ChatMessage(type: MessageType.video, videoUrl: 'https://www.iiimaster.com/files/video_1760460657045.mp4', videoThumbUrl: 'https://www.iiimaster.com/files/27ada7ffe0a4d57bbf66b162629fbb11.jpg', videoWidth: 1920, videoHeight: 1080, isMe: false, time: '16:16'),
        ChatMessage(type: MessageType.voice, voiceDurationSec: 12, voiceUrl: 'https://www.iiimaster.com/files/audio_1761748345459.m4a', isMe: true, time: '16:18', status: ReadMark.doubleGreen),
        ChatMessage(type: MessageType.file, fileName: 'report.pdf', fileSize: '1.2 MB', isMe: false, time: '16:20'),
        ChatMessage(type: MessageType.text, text: '收到', isMe: true, time: '16:21', status: ReadMark.doubleGreen),
        ChatMessage(
          type: MessageType.text,
          text: '这张图片不错',
          isMe: true,
          time: '16:22',
          status: ReadMark.doubleGreen,
          replyType: MessageType.image,
          replyPreview: '图片',
          replyThumbUrl: 'https://www.iiimaster.com/files/4cbdb3035714ab67db6c23421634e3cd.jpg',
          isEdited: true,
        ),
        ChatMessage(
          type: MessageType.text,
          text: '同意你的看法',
          isMe: false,
          time: '16:23',
          replyType: MessageType.text,
          replyPreview: '目前平台运行情况怎么样？',
        ),
        ChatMessage(
          type: MessageType.voice,
          voiceDurationSec: 9,
          voiceUrl: 'https://www.iiimaster.com/files/audio_1761748345459.m4a',
          isMe: true,
          time: '16:24',
          status: ReadMark.singleGrey,
          replyType: MessageType.voice,
          replyPreview: '语音 00:12',
        ),
        ChatMessage(
          type: MessageType.emoji,
          emoji: '😂',
          isMe: false,
          time: '16:25',
          replyType: MessageType.emoji,
          replyPreview: '表情',
        ),
        ChatMessage(
          type: MessageType.file,
          fileName: 'notes.txt',
          fileSize: '2 KB',
          isMe: true,
          time: '16:26',
          status: ReadMark.doubleGreen,
          replyType: MessageType.file,
          replyPreview: '文件 report.pdf',
        ),
      ],
    );
  }

  factory ChatViewModel.privateFromName(String name) {
    return ChatViewModel(
      partnerName: name,
      lastSeen: 'last seen recently',
      chatType: ChatType.private,
      messages: [
        ChatMessage(type: MessageType.text, text: '你好', isMe: false, time: '10:00'),
        ChatMessage(type: MessageType.text, text: 'Hi!', isMe: true, time: '10:01', status: ReadMark.singleGrey),
      ],
    );
  }

  // 群聊示例
  factory ChatViewModel.groupChat() {
    return ChatViewModel(
      partnerName: "技术交流群",
      lastSeen: '在线 5人',
      chatType: ChatType.group,
      messages: [
        ChatMessage(type: MessageType.text, text: '大家早上好！', isMe: false, time: '09:00', senderName: '张三'),
        ChatMessage(type: MessageType.emoji, emoji: '😀', isMe: true, time: '09:01', status: ReadMark.doubleGreen),
        ChatMessage(type: MessageType.image, imageUrl: 'https://www.iiimaster.com/files/4cbdb3035714ab67db6c23421634e3cd.jpg', imageWidth: 800, imageHeight: 1200, isMe: false, time: '09:05', senderName: '李四'),
        ChatMessage(type: MessageType.video, videoUrl: 'https://www.iiimaster.com/files/video_1760460657045.mp4', videoThumbUrl: 'https://www.iiimaster.com/files/27ada7ffe0a4d57bbf66b162629fbb11.jpg', videoWidth: 1280, videoHeight: 720, isMe: true, time: '09:10', status: ReadMark.doubleGreen),
        ChatMessage(type: MessageType.text, text: '太好了，期待！', isMe: false, time: '09:11', senderName: '王五'),
        ChatMessage(type: MessageType.voice, voiceDurationSec: 8, voiceUrl: 'https://www.iiimaster.com/files/audio_1761748345459.m4a', isMe: false, time: '09:12', senderName: '赵六'),
        ChatMessage(type: MessageType.file, fileName: 'link.txt', fileSize: '4 KB', isMe: true, time: '09:15', status: ReadMark.singleGrey),
        ChatMessage(type: MessageType.text, text: '收到！', isMe: false, time: '09:16', senderName: '张三'),
        ChatMessage(
          type: MessageType.text,
          text: '这个视频不错',
          isMe: false,
          senderName: '李四',
          time: '09:18',
          replyType: MessageType.video,
          replyPreview: '视频',
          replyThumbUrl: 'https://www.iiimaster.com/files/27ada7ffe0a4d57bbf66b162629fbb11.jpg',
        ),
        ChatMessage(type: MessageType.text, text: '一定参加', isMe: false, time: '09:17', senderName: '李四'),
        ChatMessage(
          type: MessageType.text,
          text: '这条消息请参考',
          isMe: true,
          time: '09:19',
          status: ReadMark.doubleGreen,
          replyType: MessageType.text,
          replyPreview: '大家早上好！',
        ),
        ChatMessage(
          type: MessageType.voice,
          voiceDurationSec: 5,
          voiceUrl: 'https://www.iiimaster.com/files/audio_1761748345459.m4a',
          isMe: false,
          senderName: '王五',
          time: '09:20',
          replyType: MessageType.voice,
          replyPreview: '语音 00:08',
        ),
        ChatMessage(
          type: MessageType.emoji,
          emoji: '👍',
          isMe: true,
          time: '09:21',
          status: ReadMark.doubleGreen,
          replyType: MessageType.emoji,
          replyPreview: '表情',
        ),
        ChatMessage(
          type: MessageType.file,
          fileName: 'agenda.pdf',
          fileSize: '850 KB',
          isMe: false,
          senderName: '赵六',
          time: '09:22',
          replyType: MessageType.file,
          replyPreview: '文件 link.txt',
        ),
      ],
    );
  }

  // 兼容旧代码
  factory ChatViewModel.fromSummary(MessageSummary s) {
    return s.isGroup ? ChatViewModel.groupChat() : ChatViewModel.privateChat();
  }
}
