import 'dart:convert';
import 'dart:ui';


enum MessageType {
  text,
  images,
  videos,
  camera,
  files,
  locations,
  audio,
  system, // 新增：系统特殊消息类型
  voiceCall, // 新增：音频通话记录
  videoCall, // 新增：视频通话记录
}

enum MessageStatus {
  sent,
  delivered,
  read,
  failed,
}

class ChatMessage {
  String? thumbnailPath; // 新增：视频缩略图路径
  late String id;
  late String text;
  late bool isMe;
  late DateTime timestamp;
  late bool isEdited;
  late DateTime? editTime;
  late bool isFavorite;
  late bool isForwarded;
  late String? forwardedFrom;
  late ChatMessage? replyTo;
  late MessageType messageType;
  late List<String>? mediaUrls;
  late String? filePath;
  late String? fileName;
  late String? fileSize;
  late Map<String, double>? location;
  late String? locationName;
  late MessageStatus status;
  late double? sendProgress; // 发送进度 0.0 到 1.0
  late List<Size>? imageSizes; // 图片尺寸列表
  late String? audioUrl;
  late Duration? audioDuration;
  late Duration? videoDuration; // 新增：视频时长
  double? videoAspectRatio; // 新增：视频宽高比
  double? videoBubbleWidth; // 新增：视频气泡宽度
  double? videoBubbleHeight; // 新增：视频气泡高度
  double? imageBubbleWidth; // 新增：图片气泡宽度
  double? imageBubbleHeight; // 新增：图片气泡高度
  late bool isSended; // 新增：是否已发送
  List<Map<String, String>>? bubbleEmoji; // 修改：气泡表情列表，包含用户信息
  late String chatId; // 新增

  ChatMessage copyWith({
    String? id,
    String? text,
    bool? isMe,
    DateTime? timestamp,
    bool? isEdited,
    DateTime? editTime,
    bool? isFavorite,
    bool? isForwarded,
    String? forwardedFrom,
    ChatMessage? replyTo,
    MessageType? messageType,
    List<String>? mediaUrls,
    String? filePath,
    String? fileName,
    String? fileSize,
    Map<String, double>? location,
    String? locationName,
    MessageStatus? status,
    double? sendProgress,
    List<Size>? imageSizes,
    String? audioUrl,
    Duration? audioDuration,
    Duration? videoDuration,
    double? videoAspectRatio,
    double? videoBubbleWidth,
    double? videoBubbleHeight,
    double? imageBubbleWidth,
    double? imageBubbleHeight,
    bool? isSended,
    List<Map<String, String>>? bubbleEmoji,
    String? chatId,
    bool? isGroup,
    String? senderUid,
    String? senderName,
    String? senderAvatar,
    Map<String, String>? mentions,
    bool? isSystemMessage,
    Map<String, dynamic>? systemData,
    Duration? callDuration,
    String? callResult,
    String? callType,
    String? thumbnailPath,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      text: text ?? this.text,
      isMe: isMe ?? this.isMe,
      timestamp: timestamp ?? this.timestamp,
      isEdited: isEdited ?? this.isEdited,
      editTime: editTime ?? this.editTime,
      isFavorite: isFavorite ?? this.isFavorite,
      isForwarded: isForwarded ?? this.isForwarded,
      forwardedFrom: forwardedFrom ?? this.forwardedFrom,
      replyTo: replyTo ?? this.replyTo,
      messageType: messageType ?? this.messageType,
      mediaUrls: mediaUrls ?? this.mediaUrls,
      filePath: filePath ?? this.filePath,
      fileName: fileName ?? this.fileName,
      fileSize: fileSize ?? this.fileSize,
      location: location ?? this.location,
      locationName: locationName ?? this.locationName,
      status: status ?? this.status,
      sendProgress: sendProgress ?? this.sendProgress,
      imageSizes: imageSizes ?? this.imageSizes,
      audioUrl: audioUrl ?? this.audioUrl,
      audioDuration: audioDuration ?? this.audioDuration,
      videoDuration: videoDuration ?? this.videoDuration,
      videoAspectRatio: videoAspectRatio ?? this.videoAspectRatio,
      videoBubbleWidth: videoBubbleWidth ?? this.videoBubbleWidth,
      videoBubbleHeight: videoBubbleHeight ?? this.videoBubbleHeight,
      imageBubbleWidth: imageBubbleWidth ?? this.imageBubbleWidth,
      imageBubbleHeight: imageBubbleHeight ?? this.imageBubbleHeight,
      isSended: isSended ?? this.isSended,
      bubbleEmoji: bubbleEmoji ?? this.bubbleEmoji,
      chatId: chatId ?? this.chatId,
      isGroup: isGroup ?? this.isGroup,
      senderUid: senderUid ?? this.senderUid,
      senderName: senderName ?? this.senderName,
      senderAvatar: senderAvatar ?? this.senderAvatar,
      mentions: mentions ?? this.mentions,
      isSystemMessage: isSystemMessage ?? this.isSystemMessage,
      systemData: systemData ?? this.systemData,
      callDuration: callDuration ?? this.callDuration,
      callResult: callResult ?? this.callResult,
      callType: callType ?? this.callType,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
    );
  }

  // --- Group & Mention specific fields ---
  late bool isGroup;
  late String? senderUid; // 新增：发送者UID
  late String? senderName;
  late String? senderAvatar;
  late Map<String, String>? mentions; // Key: UserID, Value: UserName

  // --- System message fields ---
  late bool isSystemMessage; // 新增：是否为系统消息（不可删除）
  late Map<String, dynamic>? systemData; // 新增：系统消息携带的数据

  // --- Call message fields ---
  late Duration? callDuration; // 新增：通话时长
  late String? callResult; // 新增：通话结果（success, missed, rejected）
  late String? callType; // 新增：通话类型（audio, video）

  ChatMessage({
    this.thumbnailPath,
    required this.id,
    required this.text,
    required this.isMe,
    required this.timestamp,
    this.isEdited = false,
    this.editTime,
    this.isFavorite = false,
    this.isForwarded = false,
    this.forwardedFrom,
    this.replyTo,
    this.messageType = MessageType.text,
    this.mediaUrls,
    this.filePath,
    this.fileName,
    this.fileSize,
    this.location,
    this.locationName,
    this.status = MessageStatus.sent,
    this.sendProgress,
    this.imageSizes,
    this.audioUrl,
    this.audioDuration,
    this.videoDuration,
    this.videoAspectRatio,
    this.videoBubbleWidth,
    this.videoBubbleHeight,
    this.imageBubbleWidth,
    this.imageBubbleHeight,
    this.isSended = false, // 新增：默认未发送
    this.bubbleEmoji,
    // Group props
    this.isGroup = false,
    this.senderUid,
    this.senderName,
    this.senderAvatar,
    this.mentions,
    // System message props
    this.isSystemMessage = false,
    this.systemData,
    // Call message props
    this.callDuration,
    this.callResult,
    this.callType,
    required this.chatId,
  });

  ChatMessage.text({
    this.thumbnailPath,
    required this.id,
    required this.text,
    required this.isMe,
    required this.timestamp,
    this.isEdited = false,
    this.editTime,
    this.isFavorite = false,
    this.isForwarded = false,
    this.forwardedFrom,
    this.replyTo,
    this.status = MessageStatus.sent,
    this.sendProgress,
    this.isSended = false, // 新增
    this.bubbleEmoji,
    // Group props
    this.isGroup = false,
    this.senderUid,
    this.senderName,
    this.senderAvatar,
    this.mentions,
    // System message props
    this.isSystemMessage = false,
    this.systemData,
    required this.chatId,
  })  : messageType = MessageType.text,
        mediaUrls = null,
        filePath = null,
        fileName = null,
        fileSize = null,
        location = null,
        locationName = null,
        imageSizes = null,
        audioUrl = null,
        audioDuration = null,
        videoDuration = null,
        callDuration = null,
        callResult = null,
        callType = null;

  ChatMessage.images({
    required this.id,
    required this.isMe,
    required this.timestamp,
    this.text = '',
    this.isEdited = false,
    this.editTime,
    this.isFavorite = false,
    this.isForwarded = false,
    this.forwardedFrom,
    this.replyTo,
    required this.mediaUrls,
    this.filePath, // 新增：支持本地路径
    this.status = MessageStatus.sent,
    this.sendProgress,
    this.imageSizes,
    this.isSended = false, // 新增
    this.bubbleEmoji,
    // Group props
    this.isGroup = false,
    this.senderUid,
    this.senderName,
    this.senderAvatar,
    // System message props
    this.isSystemMessage = false,
    this.systemData,
    required this.chatId,
  })  : messageType = MessageType.images,
        mentions = null,
        fileName = null,
        fileSize = null,
        location = null,
        locationName = null,
        audioUrl = null,
        audioDuration = null,
        videoDuration = null,
        callDuration = null,
        callResult = null,
        callType = null;

  ChatMessage.videos({
    required this.id,
    required this.isMe,
    required this.timestamp,
    this.text = '',
    this.isEdited = false,
    this.editTime,
    this.isFavorite = false,
    this.isForwarded = false,
    this.forwardedFrom,
    this.replyTo,
    required this.mediaUrls,
    this.filePath, // 新增：支持本地路径
    this.status = MessageStatus.sent,
    this.sendProgress,
    this.videoDuration,
    this.videoAspectRatio,
    this.videoBubbleWidth,
    this.videoBubbleHeight,
    this.isSended = false, // 新增
    this.bubbleEmoji,
    // Group props
    this.isGroup = false,
    this.senderUid,
    this.senderName,
    this.senderAvatar,
    // System message props
    this.isSystemMessage = false,
    this.systemData,
    required this.chatId,
  })  : messageType = MessageType.videos,
        mentions = null,
        fileName = null,
        fileSize = null,
        location = null,
        locationName = null,
        imageSizes = null,
        audioUrl = null,
        audioDuration = null,
        callDuration = null,
        callResult = null,
        callType = null;

  ChatMessage.camera({
    required this.id,
    required this.isMe,
    required this.timestamp,
    this.text = '',
    this.isEdited = false,
    this.editTime,
    this.isFavorite = false,
    this.isForwarded = false,
    this.forwardedFrom,
    this.replyTo,
    required this.mediaUrls,
    this.status = MessageStatus.sent,
    this.sendProgress,
    this.imageSizes,
    this.isSended = false, // 新增
    // Group props
    this.isGroup = false,
    this.senderUid,
    this.senderName,
    this.senderAvatar,
    // System message props
    this.isSystemMessage = false,
    this.systemData,
    required this.chatId,
    this.bubbleEmoji,
  })  : messageType = MessageType.camera,
        mentions = null,
        filePath = null,
        fileName = null,
        fileSize = null,
        location = null,
        locationName = null,
        audioUrl = null,
        audioDuration = null,
        videoDuration = null,
        callDuration = null,
        callResult = null,
        callType = null;

  ChatMessage.files({
    required this.id,
    required this.isMe,
    required this.timestamp,
    this.text = '',
    this.isEdited = false,
    this.editTime,
    this.isFavorite = false,
    this.isForwarded = false,
    this.forwardedFrom,
    this.replyTo,
    required this.filePath,
    required this.fileName,
    required this.fileSize,
    this.mediaUrls, // 新增：支持网络URL
    this.status = MessageStatus.sent,
    this.sendProgress,
    this.isSended = false, // 新增
    // Group props
    this.isGroup = false,
    this.senderUid,
    this.senderName,
    this.senderAvatar,
    // System message props
    this.isSystemMessage = false,
    this.systemData,
    required this.chatId,
    this.bubbleEmoji,
  })  : messageType = MessageType.files,
        mentions = null,
        location = null,
        locationName = null,
        imageSizes = null,
        audioUrl = null,
        audioDuration = null,
        videoDuration = null,
        callDuration = null,
        callResult = null,
        callType = null;

  ChatMessage.locations({
    required this.id,
    required this.isMe,
    required this.timestamp,
    this.text = '',
    this.isEdited = false,
    this.editTime,
    this.isFavorite = false,
    this.isForwarded = false,
    this.forwardedFrom,
    this.replyTo,
    required this.location,
    required this.locationName,
    this.status = MessageStatus.sent,
    this.sendProgress,
    this.isSended = false, // 新增
    // Group props
    this.isGroup = false,
    this.senderUid,
    this.senderName,
    this.senderAvatar,
    // System message props
    this.isSystemMessage = false,
    this.systemData,
    required this.chatId,
    this.bubbleEmoji,
  })  : messageType = MessageType.locations,
        mentions = null,
        mediaUrls = null,
        filePath = null,
        fileName = null,
        fileSize = null,
        imageSizes = null,
        audioUrl = null,
        audioDuration = null,
        videoDuration = null,
        callDuration = null,
        callResult = null,
        callType = null;

  ChatMessage.audio({
    required String id,
    required bool isMe,
    required DateTime timestamp,
    required String audioUrl,
    required Duration audioDuration,
    MessageStatus status = MessageStatus.sent,
    double? sendProgress,
    ChatMessage? replyTo,
    bool isSended = false, // 新增
    // Group props
    bool isGroup = false,
    String? senderUid,
    String? senderName,
    String? senderAvatar,
    // System message props
    bool isSystemMessage = false,
    Map<String, dynamic>? systemData,
    List<Map<String, String>>? bubbleEmoji, // 只声明，不用 this.
    required String chatId,
  }) : this(
          id: id,
          text: '',
          isMe: isMe,
          timestamp: timestamp,
          messageType: MessageType.audio,
          audioUrl: audioUrl,
          audioDuration: audioDuration,
          status: status,
          sendProgress: sendProgress,
          replyTo: replyTo,
          isSended: isSended,
          // 新增
          isGroup: isGroup,
          senderUid: senderUid,
          senderName: senderName,
          senderAvatar: senderAvatar,
          isSystemMessage: isSystemMessage,
          systemData: systemData,
          bubbleEmoji: bubbleEmoji,
          chatId: chatId,
        );

  // 新增：系统消息构造函数
  ChatMessage.system({
    required String id,
    required String text,
    required bool isMe,
    required DateTime timestamp,
    required Map<String, dynamic> systemData,
    MessageStatus status = MessageStatus.sent,
    bool isGroup = false,
    String? senderName,
    String? senderAvatar,
    List<Map<String, String>>? bubbleEmoji,
    required String chatId,
  }) : this(
          id: id,
          text: text,
          isMe: isMe,
          timestamp: timestamp,
          messageType: MessageType.system,
          status: status,
          isSystemMessage: true,
          systemData: systemData,
          isGroup: isGroup,
          senderName: senderName,
          senderAvatar: senderAvatar,
          bubbleEmoji: bubbleEmoji,
          chatId: chatId,
        );

  String get typeDisplayName {
    switch (messageType) {
      case MessageType.text:
        return 'Text';
      case MessageType.images:
        return 'Images';
      case MessageType.videos:
        return 'Videos';
      case MessageType.camera:
        return 'Camera';
      case MessageType.files:
        return 'Files';
      case MessageType.locations:
        return 'Location';
      case MessageType.audio:
        return 'Audio';
      case MessageType.system:
        return 'System';
      case MessageType.voiceCall:
        return 'Voice Call';
      case MessageType.videoCall:
        return 'Video Call';
    }
  }

  String get typeIcon {
    switch (messageType) {
      case MessageType.text:
        return '💬';
      case MessageType.images:
        return '🖼️';
      case MessageType.videos:
        return '🎥';
      case MessageType.camera:
        return '📷';
      case MessageType.files:
        return '📄';
      case MessageType.locations:
        return '📍';
      case MessageType.audio:
        return '🎵';
      case MessageType.system:
        return '🔔';
      case MessageType.voiceCall:
        return '📞';
      case MessageType.videoCall:
        return '📹';
    }
  }

  bool get isMediaMessage {
    return messageType == MessageType.images || messageType == MessageType.videos || messageType == MessageType.camera;
  }

  bool get isFileMessage {
    return messageType == MessageType.files;
  }

  bool get isLocationMessage {
    return messageType == MessageType.locations;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'isMe': isMe,
      'timestamp': timestamp.toIso8601String(),
      'isEdited': isEdited,
      'editTime': editTime?.toIso8601String(),
      'isFavorite': isFavorite,
      'isForwarded': isForwarded,
      'forwardedFrom': forwardedFrom,
      'replyTo': replyTo?.toJson(),
      'messageType': messageType.index,
      'mediaUrls': mediaUrls,
      'filePath': filePath,
      'fileName': fileName,
      'fileSize': fileSize,
      'location': location,
      'locationName': locationName,
      'status': status.index,
      'sendProgress': sendProgress,
      'imageSizes': imageSizes?.map((size) => {'width': size.width, 'height': size.height}).toList(),
      'audioUrl': audioUrl,
      'audioDuration': audioDuration?.inMilliseconds,
      'videoDuration': videoDuration?.inMilliseconds,
      'videoAspectRatio': videoAspectRatio,
      'videoBubbleWidth': videoBubbleWidth,
      'videoBubbleHeight': videoBubbleHeight,
      'isGroup': isGroup,
      'senderUid': senderUid,
      'senderName': senderName,
      'senderAvatar': senderAvatar,
      'mentions': mentions,
      'isSended': isSended,
      'isSystemMessage': isSystemMessage,
      'systemData': systemData,
      'bubbleEmoji': bubbleEmoji,
      'callDuration': callDuration?.inMilliseconds,
      'callResult': callResult,
      'callType': callType,
      'chatId': chatId,
    };
  }

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      text: json['text'],
      isMe: json['isMe'],
      timestamp: DateTime.parse(json['timestamp']),
      isEdited: json['isEdited'] ?? false,
      editTime: json['editTime'] != null ? DateTime.parse(json['editTime']) : null,
      isFavorite: json['isFavorite'] ?? false,
      isForwarded: json['isForwarded'] ?? false,
      forwardedFrom: json['forwardedFrom'],
      replyTo: json['replyTo'] != null ? ChatMessage.fromJson(json['replyTo']) : null,
      messageType: MessageType.values[json['messageType'] ?? 0],
      mediaUrls: json['mediaUrls'] != null ? List<String>.from(json['mediaUrls']) : null,
      filePath: json['filePath'],
      fileName: json['fileName'],
      fileSize: json['fileSize'],
      location: json['location'] != null ? Map<String, double>.from(json['location']) : null,
      locationName: json['locationName'],
      status: MessageStatus.values[json['status'] ?? 1],
      sendProgress: json['sendProgress'],
      imageSizes: json['imageSizes'] != null ? (json['imageSizes'] as List).map((size) => Size(size['width'], size['height'])).toList() : null,
      audioUrl: json['audioUrl'],
      audioDuration: json['audioDuration'] != null ? Duration(milliseconds: json['audioDuration']) : null,
      videoDuration: json['videoDuration'] != null ? Duration(milliseconds: json['videoDuration']) : null,
      videoAspectRatio: json['videoAspectRatio'],
      videoBubbleWidth: json['videoBubbleWidth'],
      videoBubbleHeight: json['videoBubbleHeight'],
      isGroup: json['isGroup'] ?? false,
      senderUid: json['senderUid'],
      senderName: json['senderName'],
      senderAvatar: json['senderAvatar'],
      mentions: json['mentions'] != null ? Map<String, String>.from(json['mentions']) : null,
      isSended: json['isSended'] ?? false,
      isSystemMessage: json['isSystemMessage'] ?? false,
      systemData: json['systemData'],
      bubbleEmoji: json['bubbleEmoji'] != null ? (json['bubbleEmoji'] as List).map((item) => Map<String, String>.from(item)).toList() : null,
      callDuration: json['callDuration'] != null ? Duration(milliseconds: json['callDuration']) : null,
      callResult: json['callResult'],
      callType: json['callType'],
      chatId: json['chatId'] ?? '',
    );
  }

  // SQLite CREATE TABLE 语句
  static String get createTableSQL => '''
    CREATE TABLE IF NOT EXISTS  chat_messages (
      id TEXT PRIMARY KEY,
      text TEXT NOT NULL,
      isMe INTEGER NOT NULL,
      timestamp TEXT NOT NULL,
      isEdited INTEGER NOT NULL DEFAULT 0,
      editTime TEXT,
      isFavorite INTEGER NOT NULL DEFAULT 0,
      isForwarded INTEGER NOT NULL DEFAULT 0,
      forwardedFrom TEXT,
      replyToId TEXT,
      messageType INTEGER NOT NULL DEFAULT 0,
      mediaUrls TEXT,
      filePath TEXT,
      fileName TEXT,
      fileSize TEXT,
      location TEXT,
      locationName TEXT,
      status INTEGER NOT NULL DEFAULT 1,
      sendProgress REAL,
      imageSizes TEXT,
      audioUrl TEXT,
      audioDuration INTEGER,
      videoDuration INTEGER,
      videoAspectRatio REAL,
      videoBubbleWidth REAL,
      videoBubbleHeight REAL,
      isGroup INTEGER NOT NULL DEFAULT 0,
      senderUid TEXT,
      senderName TEXT,
      senderAvatar TEXT,
      mentions TEXT,
      isSended INTEGER NOT NULL DEFAULT 0,
      chatId TEXT NOT NULL,
      createdAt TEXT NOT NULL,
      updatedAt TEXT NOT NULL,
      isSystemMessage INTEGER NOT NULL DEFAULT 0,
      systemData TEXT,
      replyToJson TEXT,
      bubbleEmoji TEXT,
      callDuration INTEGER,
      callResult TEXT,
      callType TEXT
      ,thumbnailPath TEXT -- 新增：视频缩略图路径
    )
  ''';

  // 转换为数据库记录
  Map<String, dynamic> toDatabaseMap() {
    return {
      'id': id,
      'text': text,
      'isMe': isMe ? 1 : 0,
      'timestamp': timestamp.toIso8601String(),
      'isEdited': isEdited ? 1 : 0,
      'editTime': editTime?.toIso8601String(),
      'isFavorite': isFavorite ? 1 : 0,
      'isForwarded': isForwarded ? 1 : 0,
      'forwardedFrom': forwardedFrom,
      'replyToId': replyTo?.id,
      'messageType': messageType.index,
      'mediaUrls': mediaUrls != null ? json.encode(mediaUrls) : null,
      'filePath': filePath,
      'fileName': fileName,
      'fileSize': fileSize,
      'location': location != null ? json.encode(location) : null,
      'locationName': locationName,
      'status': status.index,
      'sendProgress': sendProgress,
      'imageSizes': imageSizes != null ? json.encode(imageSizes!.map((size) => {'width': size.width, 'height': size.height}).toList()) : null,
      'audioUrl': audioUrl,
      'audioDuration': audioDuration?.inMilliseconds,
      'videoDuration': videoDuration?.inMilliseconds,
      'videoAspectRatio': videoAspectRatio,
      'videoBubbleWidth': videoBubbleWidth,
      'videoBubbleHeight': videoBubbleHeight,
      'isGroup': isGroup ? 1 : 0,
      'senderUid': senderUid,
      'senderName': senderName,
      'senderAvatar': senderAvatar,
      'mentions': mentions != null ? json.encode(mentions) : null,
      'chatId': chatId,
      'createdAt': DateTime.now().toIso8601String(),
      'updatedAt': DateTime.now().toIso8601String(),
      'isSended': isSended ? 1 : 0,
      'isSystemMessage': isSystemMessage ? 1 : 0,
      'systemData': systemData != null ? json.encode(systemData) : null,
      'replyToJson': replyTo != null ? json.encode(replyTo!.toJson()) : null,
      'bubbleEmoji': bubbleEmoji != null ? json.encode(bubbleEmoji) : null,
      'callDuration': callDuration?.inMilliseconds,
      'callResult': callResult,
      'callType': callType,
      'thumbnailPath': thumbnailPath,
    };
  }

  // 从数据库记录创建对象
  factory ChatMessage.fromDatabaseMap(Map<String, dynamic> map) {
    return ChatMessage(
      id: map['id'],
      text: map['text'],
      isMe: map['isMe'] == 1,
      timestamp: DateTime.parse(map['timestamp']),
      isEdited: map['isEdited'] == 1,
      editTime: map['editTime'] != null ? DateTime.parse(map['editTime']) : null,
      isFavorite: map['isFavorite'] == 1,
      isForwarded: map['isForwarded'] == 1,
      forwardedFrom: map['forwardedFrom'],
      replyTo: map['replyToJson'] != null ? ChatMessage.fromJson(json.decode(map['replyToJson'])) : null,
      // 需要单独查询
      messageType: MessageType.values[map['messageType'] ?? 0],
      mediaUrls: map['mediaUrls'] != null ? List<String>.from(json.decode(map['mediaUrls'])) : null,
      filePath: map['filePath'],
      fileName: map['fileName'],
      fileSize: map['fileSize'],
      location: map['location'] != null ? Map<String, double>.from(json.decode(map['location'])) : null,
      locationName: map['locationName'],
      status: MessageStatus.values[map['status'] ?? 1],
      sendProgress: map['sendProgress'],
      imageSizes:
          map['imageSizes'] != null ? (json.decode(map['imageSizes']) as List).map((size) => Size(size['width'], size['height'])).toList() : null,
      audioUrl: map['audioUrl'],
      audioDuration: map['audioDuration'] != null ? Duration(milliseconds: map['audioDuration']) : null,
      videoDuration: map['videoDuration'] != null ? Duration(milliseconds: map['videoDuration']) : null,
      videoAspectRatio: map['videoAspectRatio'],
      videoBubbleWidth: map['videoBubbleWidth'],
      videoBubbleHeight: map['videoBubbleHeight'],
      thumbnailPath: map['thumbnailPath'],
      isGroup: map['isGroup'] == 1,
      senderUid: map['senderUid'],
      senderName: map['senderName'],
      senderAvatar: map['senderAvatar'],
      mentions: map['mentions'] != null ? Map<String, String>.from(json.decode(map['mentions'])) : null,
      isSended: map['isSended'] == 1,
      isSystemMessage: map['isSystemMessage'] == 1,
      systemData: map['systemData'] != null ? json.decode(map['systemData']) : null,
      bubbleEmoji: map['bubbleEmoji'] != null ? _parseBubbleEmoji(map['bubbleEmoji']) : null,
      callDuration: map['callDuration'] != null ? Duration(milliseconds: map['callDuration']) : null,
      callResult: map['callResult'],
      callType: map['callType'],
      chatId: map['chatId'] ?? '',
    );
  }

  // 解析 bubbleEmoji 字段，兼容新旧格式
  static List<Map<String, String>>? _parseBubbleEmoji(dynamic bubbleEmojiData) {
    if (bubbleEmojiData == null) return null;

    try {
      final dataStr = bubbleEmojiData.toString();

      // 检查是否是有效的 JSON 数组
      if (dataStr.startsWith('[')) {
        final decodedList = json.decode(dataStr);
        return (decodedList as List).map((item) => Map<String, String>.from(item)).toList();
      } else {
        return null;
      }
    } catch (e) {

      return null;
    }
  }

  // 音频通话消息构造函数
  ChatMessage.audioCall({
    required this.id,
    required this.isMe,
    required this.timestamp,
    required this.callResult,
    this.callDuration,
    this.text = '',
    this.status = MessageStatus.sent,
    this.isSended = false,
    required this.chatId,
  })  : messageType = MessageType.voiceCall,
        callType = 'audio',
        isEdited = false,
        isFavorite = false,
        isForwarded = false,
        mediaUrls = null,
        filePath = null,
        fileName = null,
        fileSize = null,
        location = null,
        locationName = null,
        imageSizes = null,
        audioUrl = null,
        audioDuration = null,
        videoDuration = null,
        videoAspectRatio = null,
        videoBubbleWidth = null,
        videoBubbleHeight = null,
        imageBubbleWidth = null,
        imageBubbleHeight = null,
        bubbleEmoji = null,
        isGroup = false,
        senderUid = null,
        senderName = null,
        senderAvatar = null,
        mentions = null,
        isSystemMessage = false,
        systemData = null,
        replyTo = null,
        forwardedFrom = null,
        editTime = null,
        sendProgress = null;

  // 视频通话消息构造函数
  ChatMessage.videoCall({
    this.thumbnailPath,
    required this.id,
    required this.isMe,
    required this.timestamp,
    required this.callResult,
    this.callDuration,
    this.text = '',
    this.status = MessageStatus.sent,
    this.isSended = false,
    required this.chatId,
  })  : messageType = MessageType.videoCall,
        callType = 'video',
        isEdited = false,
        isFavorite = false,
        isForwarded = false,
        mediaUrls = null,
        filePath = null,
        fileName = null,
        fileSize = null,
        location = null,
        locationName = null,
        imageSizes = null,
        audioUrl = null,
        audioDuration = null,
        videoDuration = null,
        videoAspectRatio = null,
        videoBubbleWidth = null,
        videoBubbleHeight = null,
        imageBubbleWidth = null,
        imageBubbleHeight = null,
        bubbleEmoji = null,
        isGroup = false,
        senderUid = null,
        senderName = null,
        senderAvatar = null,
        mentions = null,
        isSystemMessage = false,
        systemData = null,
        replyTo = null,
        forwardedFrom = null,
        editTime = null,
        sendProgress = null;
}
