// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $MessagesTable extends Messages with TableInfo<$MessagesTable, Message> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isMeMeta = const VerificationMeta('isMe');
  @override
  late final GeneratedColumn<int> isMe = GeneratedColumn<int>(
      'is_me', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<String> timestamp = GeneratedColumn<String>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isEditedMeta =
      const VerificationMeta('isEdited');
  @override
  late final GeneratedColumn<int> isEdited = GeneratedColumn<int>(
      'is_edited', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _editTimeMeta =
      const VerificationMeta('editTime');
  @override
  late final GeneratedColumn<String> editTime = GeneratedColumn<String>(
      'edit_time', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isFavoriteMeta =
      const VerificationMeta('isFavorite');
  @override
  late final GeneratedColumn<int> isFavorite = GeneratedColumn<int>(
      'is_favorite', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isForwardedMeta =
      const VerificationMeta('isForwarded');
  @override
  late final GeneratedColumn<int> isForwarded = GeneratedColumn<int>(
      'is_forwarded', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _forwardedFromMeta =
      const VerificationMeta('forwardedFrom');
  @override
  late final GeneratedColumn<String> forwardedFrom = GeneratedColumn<String>(
      'forwarded_from', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _replyToIdMeta =
      const VerificationMeta('replyToId');
  @override
  late final GeneratedColumn<String> replyToId = GeneratedColumn<String>(
      'reply_to_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _messageTypeMeta =
      const VerificationMeta('messageType');
  @override
  late final GeneratedColumn<int> messageType = GeneratedColumn<int>(
      'message_type', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _mediaUrlsMeta =
      const VerificationMeta('mediaUrls');
  @override
  late final GeneratedColumn<String> mediaUrls = GeneratedColumn<String>(
      'media_urls', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fileNameMeta =
      const VerificationMeta('fileName');
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
      'file_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fileSizeMeta =
      const VerificationMeta('fileSize');
  @override
  late final GeneratedColumn<String> fileSize = GeneratedColumn<String>(
      'file_size', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _locationNameMeta =
      const VerificationMeta('locationName');
  @override
  late final GeneratedColumn<String> locationName = GeneratedColumn<String>(
      'location_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _sendProgressMeta =
      const VerificationMeta('sendProgress');
  @override
  late final GeneratedColumn<double> sendProgress = GeneratedColumn<double>(
      'send_progress', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _imageSizesMeta =
      const VerificationMeta('imageSizes');
  @override
  late final GeneratedColumn<String> imageSizes = GeneratedColumn<String>(
      'image_sizes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _audioUrlMeta =
      const VerificationMeta('audioUrl');
  @override
  late final GeneratedColumn<String> audioUrl = GeneratedColumn<String>(
      'audio_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _audioDurationMeta =
      const VerificationMeta('audioDuration');
  @override
  late final GeneratedColumn<int> audioDuration = GeneratedColumn<int>(
      'audio_duration', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _videoDurationMeta =
      const VerificationMeta('videoDuration');
  @override
  late final GeneratedColumn<int> videoDuration = GeneratedColumn<int>(
      'video_duration', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _videoAspectRatioMeta =
      const VerificationMeta('videoAspectRatio');
  @override
  late final GeneratedColumn<double> videoAspectRatio = GeneratedColumn<double>(
      'video_aspect_ratio', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _videoBubbleWidthMeta =
      const VerificationMeta('videoBubbleWidth');
  @override
  late final GeneratedColumn<double> videoBubbleWidth = GeneratedColumn<double>(
      'video_bubble_width', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _videoBubbleHeightMeta =
      const VerificationMeta('videoBubbleHeight');
  @override
  late final GeneratedColumn<double> videoBubbleHeight =
      GeneratedColumn<double>('video_bubble_height', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _isGroupMeta =
      const VerificationMeta('isGroup');
  @override
  late final GeneratedColumn<int> isGroup = GeneratedColumn<int>(
      'is_group', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _senderUidMeta =
      const VerificationMeta('senderUid');
  @override
  late final GeneratedColumn<String> senderUid = GeneratedColumn<String>(
      'sender_uid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _senderNameMeta =
      const VerificationMeta('senderName');
  @override
  late final GeneratedColumn<String> senderName = GeneratedColumn<String>(
      'sender_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _senderAvatarMeta =
      const VerificationMeta('senderAvatar');
  @override
  late final GeneratedColumn<String> senderAvatar = GeneratedColumn<String>(
      'sender_avatar', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mentionsMeta =
      const VerificationMeta('mentions');
  @override
  late final GeneratedColumn<String> mentions = GeneratedColumn<String>(
      'mentions', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isSendedMeta =
      const VerificationMeta('isSended');
  @override
  late final GeneratedColumn<int> isSended = GeneratedColumn<int>(
      'is_sended', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _chatIdMeta = const VerificationMeta('chatId');
  @override
  late final GeneratedColumn<String> chatId = GeneratedColumn<String>(
      'chat_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSystemMessageMeta =
      const VerificationMeta('isSystemMessage');
  @override
  late final GeneratedColumn<int> isSystemMessage = GeneratedColumn<int>(
      'is_system_message', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _systemDataMeta =
      const VerificationMeta('systemData');
  @override
  late final GeneratedColumn<String> systemData = GeneratedColumn<String>(
      'system_data', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _replyToJsonMeta =
      const VerificationMeta('replyToJson');
  @override
  late final GeneratedColumn<String> replyToJson = GeneratedColumn<String>(
      'reply_to_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bubbleEmojiMeta =
      const VerificationMeta('bubbleEmoji');
  @override
  late final GeneratedColumn<String> bubbleEmoji = GeneratedColumn<String>(
      'bubble_emoji', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _callDurationMeta =
      const VerificationMeta('callDuration');
  @override
  late final GeneratedColumn<int> callDuration = GeneratedColumn<int>(
      'call_duration', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _callResultMeta =
      const VerificationMeta('callResult');
  @override
  late final GeneratedColumn<String> callResult = GeneratedColumn<String>(
      'call_result', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _callTypeMeta =
      const VerificationMeta('callType');
  @override
  late final GeneratedColumn<String> callType = GeneratedColumn<String>(
      'call_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _thumbnailPathMeta =
      const VerificationMeta('thumbnailPath');
  @override
  late final GeneratedColumn<String> thumbnailPath = GeneratedColumn<String>(
      'thumbnail_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        body,
        isMe,
        timestamp,
        isEdited,
        editTime,
        isFavorite,
        isForwarded,
        forwardedFrom,
        replyToId,
        messageType,
        mediaUrls,
        filePath,
        fileName,
        fileSize,
        location,
        locationName,
        status,
        sendProgress,
        imageSizes,
        audioUrl,
        audioDuration,
        videoDuration,
        videoAspectRatio,
        videoBubbleWidth,
        videoBubbleHeight,
        isGroup,
        senderUid,
        senderName,
        senderAvatar,
        mentions,
        isSended,
        chatId,
        createdAt,
        updatedAt,
        isSystemMessage,
        systemData,
        replyToJson,
        bubbleEmoji,
        callDuration,
        callResult,
        callType,
        thumbnailPath
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'messages';
  @override
  VerificationContext validateIntegrity(Insertable<Message> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('text')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['text']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('is_me')) {
      context.handle(
          _isMeMeta, isMe.isAcceptableOrUnknown(data['is_me']!, _isMeMeta));
    } else if (isInserting) {
      context.missing(_isMeMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('is_edited')) {
      context.handle(_isEditedMeta,
          isEdited.isAcceptableOrUnknown(data['is_edited']!, _isEditedMeta));
    }
    if (data.containsKey('edit_time')) {
      context.handle(_editTimeMeta,
          editTime.isAcceptableOrUnknown(data['edit_time']!, _editTimeMeta));
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['is_favorite']!, _isFavoriteMeta));
    }
    if (data.containsKey('is_forwarded')) {
      context.handle(
          _isForwardedMeta,
          isForwarded.isAcceptableOrUnknown(
              data['is_forwarded']!, _isForwardedMeta));
    }
    if (data.containsKey('forwarded_from')) {
      context.handle(
          _forwardedFromMeta,
          forwardedFrom.isAcceptableOrUnknown(
              data['forwarded_from']!, _forwardedFromMeta));
    }
    if (data.containsKey('reply_to_id')) {
      context.handle(
          _replyToIdMeta,
          replyToId.isAcceptableOrUnknown(
              data['reply_to_id']!, _replyToIdMeta));
    }
    if (data.containsKey('message_type')) {
      context.handle(
          _messageTypeMeta,
          messageType.isAcceptableOrUnknown(
              data['message_type']!, _messageTypeMeta));
    }
    if (data.containsKey('media_urls')) {
      context.handle(_mediaUrlsMeta,
          mediaUrls.isAcceptableOrUnknown(data['media_urls']!, _mediaUrlsMeta));
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    }
    if (data.containsKey('file_name')) {
      context.handle(_fileNameMeta,
          fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta));
    }
    if (data.containsKey('file_size')) {
      context.handle(_fileSizeMeta,
          fileSize.isAcceptableOrUnknown(data['file_size']!, _fileSizeMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('location_name')) {
      context.handle(
          _locationNameMeta,
          locationName.isAcceptableOrUnknown(
              data['location_name']!, _locationNameMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('send_progress')) {
      context.handle(
          _sendProgressMeta,
          sendProgress.isAcceptableOrUnknown(
              data['send_progress']!, _sendProgressMeta));
    }
    if (data.containsKey('image_sizes')) {
      context.handle(
          _imageSizesMeta,
          imageSizes.isAcceptableOrUnknown(
              data['image_sizes']!, _imageSizesMeta));
    }
    if (data.containsKey('audio_url')) {
      context.handle(_audioUrlMeta,
          audioUrl.isAcceptableOrUnknown(data['audio_url']!, _audioUrlMeta));
    }
    if (data.containsKey('audio_duration')) {
      context.handle(
          _audioDurationMeta,
          audioDuration.isAcceptableOrUnknown(
              data['audio_duration']!, _audioDurationMeta));
    }
    if (data.containsKey('video_duration')) {
      context.handle(
          _videoDurationMeta,
          videoDuration.isAcceptableOrUnknown(
              data['video_duration']!, _videoDurationMeta));
    }
    if (data.containsKey('video_aspect_ratio')) {
      context.handle(
          _videoAspectRatioMeta,
          videoAspectRatio.isAcceptableOrUnknown(
              data['video_aspect_ratio']!, _videoAspectRatioMeta));
    }
    if (data.containsKey('video_bubble_width')) {
      context.handle(
          _videoBubbleWidthMeta,
          videoBubbleWidth.isAcceptableOrUnknown(
              data['video_bubble_width']!, _videoBubbleWidthMeta));
    }
    if (data.containsKey('video_bubble_height')) {
      context.handle(
          _videoBubbleHeightMeta,
          videoBubbleHeight.isAcceptableOrUnknown(
              data['video_bubble_height']!, _videoBubbleHeightMeta));
    }
    if (data.containsKey('is_group')) {
      context.handle(_isGroupMeta,
          isGroup.isAcceptableOrUnknown(data['is_group']!, _isGroupMeta));
    }
    if (data.containsKey('sender_uid')) {
      context.handle(_senderUidMeta,
          senderUid.isAcceptableOrUnknown(data['sender_uid']!, _senderUidMeta));
    }
    if (data.containsKey('sender_name')) {
      context.handle(
          _senderNameMeta,
          senderName.isAcceptableOrUnknown(
              data['sender_name']!, _senderNameMeta));
    }
    if (data.containsKey('sender_avatar')) {
      context.handle(
          _senderAvatarMeta,
          senderAvatar.isAcceptableOrUnknown(
              data['sender_avatar']!, _senderAvatarMeta));
    }
    if (data.containsKey('mentions')) {
      context.handle(_mentionsMeta,
          mentions.isAcceptableOrUnknown(data['mentions']!, _mentionsMeta));
    }
    if (data.containsKey('is_sended')) {
      context.handle(_isSendedMeta,
          isSended.isAcceptableOrUnknown(data['is_sended']!, _isSendedMeta));
    }
    if (data.containsKey('chat_id')) {
      context.handle(_chatIdMeta,
          chatId.isAcceptableOrUnknown(data['chat_id']!, _chatIdMeta));
    } else if (isInserting) {
      context.missing(_chatIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_system_message')) {
      context.handle(
          _isSystemMessageMeta,
          isSystemMessage.isAcceptableOrUnknown(
              data['is_system_message']!, _isSystemMessageMeta));
    }
    if (data.containsKey('system_data')) {
      context.handle(
          _systemDataMeta,
          systemData.isAcceptableOrUnknown(
              data['system_data']!, _systemDataMeta));
    }
    if (data.containsKey('reply_to_json')) {
      context.handle(
          _replyToJsonMeta,
          replyToJson.isAcceptableOrUnknown(
              data['reply_to_json']!, _replyToJsonMeta));
    }
    if (data.containsKey('bubble_emoji')) {
      context.handle(
          _bubbleEmojiMeta,
          bubbleEmoji.isAcceptableOrUnknown(
              data['bubble_emoji']!, _bubbleEmojiMeta));
    }
    if (data.containsKey('call_duration')) {
      context.handle(
          _callDurationMeta,
          callDuration.isAcceptableOrUnknown(
              data['call_duration']!, _callDurationMeta));
    }
    if (data.containsKey('call_result')) {
      context.handle(
          _callResultMeta,
          callResult.isAcceptableOrUnknown(
              data['call_result']!, _callResultMeta));
    }
    if (data.containsKey('call_type')) {
      context.handle(_callTypeMeta,
          callType.isAcceptableOrUnknown(data['call_type']!, _callTypeMeta));
    }
    if (data.containsKey('thumbnail_path')) {
      context.handle(
          _thumbnailPathMeta,
          thumbnailPath.isAcceptableOrUnknown(
              data['thumbnail_path']!, _thumbnailPathMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Message map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Message(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}text'])!,
      isMe: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_me'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}timestamp'])!,
      isEdited: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_edited'])!,
      editTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}edit_time']),
      isFavorite: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_favorite'])!,
      isForwarded: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_forwarded'])!,
      forwardedFrom: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}forwarded_from']),
      replyToId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reply_to_id']),
      messageType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}message_type'])!,
      mediaUrls: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}media_urls']),
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path']),
      fileName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_name']),
      fileSize: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_size']),
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      locationName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_name']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!,
      sendProgress: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}send_progress']),
      imageSizes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_sizes']),
      audioUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}audio_url']),
      audioDuration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}audio_duration']),
      videoDuration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}video_duration']),
      videoAspectRatio: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}video_aspect_ratio']),
      videoBubbleWidth: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}video_bubble_width']),
      videoBubbleHeight: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}video_bubble_height']),
      isGroup: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_group'])!,
      senderUid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sender_uid']),
      senderName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sender_name']),
      senderAvatar: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sender_avatar']),
      mentions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mentions']),
      isSended: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_sended'])!,
      chatId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}chat_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      isSystemMessage: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_system_message'])!,
      systemData: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}system_data']),
      replyToJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reply_to_json']),
      bubbleEmoji: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bubble_emoji']),
      callDuration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}call_duration']),
      callResult: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}call_result']),
      callType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}call_type']),
      thumbnailPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail_path']),
    );
  }

  @override
  $MessagesTable createAlias(String alias) {
    return $MessagesTable(attachedDatabase, alias);
  }
}

class Message extends DataClass implements Insertable<Message> {
  final String id;
  final String body;
  final int isMe;
  final String timestamp;
  final int isEdited;
  final String? editTime;
  final int isFavorite;
  final int isForwarded;
  final String? forwardedFrom;
  final String? replyToId;
  final int messageType;
  final String? mediaUrls;
  final String? filePath;
  final String? fileName;
  final String? fileSize;
  final String? location;
  final String? locationName;
  final int status;
  final double? sendProgress;
  final String? imageSizes;
  final String? audioUrl;
  final int? audioDuration;
  final int? videoDuration;
  final double? videoAspectRatio;
  final double? videoBubbleWidth;
  final double? videoBubbleHeight;
  final int isGroup;
  final String? senderUid;
  final String? senderName;
  final String? senderAvatar;
  final String? mentions;
  final int isSended;
  final String chatId;
  final String createdAt;
  final String updatedAt;
  final int isSystemMessage;
  final String? systemData;
  final String? replyToJson;
  final String? bubbleEmoji;
  final int? callDuration;
  final String? callResult;
  final String? callType;
  final String? thumbnailPath;
  const Message(
      {required this.id,
      required this.body,
      required this.isMe,
      required this.timestamp,
      required this.isEdited,
      this.editTime,
      required this.isFavorite,
      required this.isForwarded,
      this.forwardedFrom,
      this.replyToId,
      required this.messageType,
      this.mediaUrls,
      this.filePath,
      this.fileName,
      this.fileSize,
      this.location,
      this.locationName,
      required this.status,
      this.sendProgress,
      this.imageSizes,
      this.audioUrl,
      this.audioDuration,
      this.videoDuration,
      this.videoAspectRatio,
      this.videoBubbleWidth,
      this.videoBubbleHeight,
      required this.isGroup,
      this.senderUid,
      this.senderName,
      this.senderAvatar,
      this.mentions,
      required this.isSended,
      required this.chatId,
      required this.createdAt,
      required this.updatedAt,
      required this.isSystemMessage,
      this.systemData,
      this.replyToJson,
      this.bubbleEmoji,
      this.callDuration,
      this.callResult,
      this.callType,
      this.thumbnailPath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['text'] = Variable<String>(body);
    map['is_me'] = Variable<int>(isMe);
    map['timestamp'] = Variable<String>(timestamp);
    map['is_edited'] = Variable<int>(isEdited);
    if (!nullToAbsent || editTime != null) {
      map['edit_time'] = Variable<String>(editTime);
    }
    map['is_favorite'] = Variable<int>(isFavorite);
    map['is_forwarded'] = Variable<int>(isForwarded);
    if (!nullToAbsent || forwardedFrom != null) {
      map['forwarded_from'] = Variable<String>(forwardedFrom);
    }
    if (!nullToAbsent || replyToId != null) {
      map['reply_to_id'] = Variable<String>(replyToId);
    }
    map['message_type'] = Variable<int>(messageType);
    if (!nullToAbsent || mediaUrls != null) {
      map['media_urls'] = Variable<String>(mediaUrls);
    }
    if (!nullToAbsent || filePath != null) {
      map['file_path'] = Variable<String>(filePath);
    }
    if (!nullToAbsent || fileName != null) {
      map['file_name'] = Variable<String>(fileName);
    }
    if (!nullToAbsent || fileSize != null) {
      map['file_size'] = Variable<String>(fileSize);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || locationName != null) {
      map['location_name'] = Variable<String>(locationName);
    }
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || sendProgress != null) {
      map['send_progress'] = Variable<double>(sendProgress);
    }
    if (!nullToAbsent || imageSizes != null) {
      map['image_sizes'] = Variable<String>(imageSizes);
    }
    if (!nullToAbsent || audioUrl != null) {
      map['audio_url'] = Variable<String>(audioUrl);
    }
    if (!nullToAbsent || audioDuration != null) {
      map['audio_duration'] = Variable<int>(audioDuration);
    }
    if (!nullToAbsent || videoDuration != null) {
      map['video_duration'] = Variable<int>(videoDuration);
    }
    if (!nullToAbsent || videoAspectRatio != null) {
      map['video_aspect_ratio'] = Variable<double>(videoAspectRatio);
    }
    if (!nullToAbsent || videoBubbleWidth != null) {
      map['video_bubble_width'] = Variable<double>(videoBubbleWidth);
    }
    if (!nullToAbsent || videoBubbleHeight != null) {
      map['video_bubble_height'] = Variable<double>(videoBubbleHeight);
    }
    map['is_group'] = Variable<int>(isGroup);
    if (!nullToAbsent || senderUid != null) {
      map['sender_uid'] = Variable<String>(senderUid);
    }
    if (!nullToAbsent || senderName != null) {
      map['sender_name'] = Variable<String>(senderName);
    }
    if (!nullToAbsent || senderAvatar != null) {
      map['sender_avatar'] = Variable<String>(senderAvatar);
    }
    if (!nullToAbsent || mentions != null) {
      map['mentions'] = Variable<String>(mentions);
    }
    map['is_sended'] = Variable<int>(isSended);
    map['chat_id'] = Variable<String>(chatId);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    map['is_system_message'] = Variable<int>(isSystemMessage);
    if (!nullToAbsent || systemData != null) {
      map['system_data'] = Variable<String>(systemData);
    }
    if (!nullToAbsent || replyToJson != null) {
      map['reply_to_json'] = Variable<String>(replyToJson);
    }
    if (!nullToAbsent || bubbleEmoji != null) {
      map['bubble_emoji'] = Variable<String>(bubbleEmoji);
    }
    if (!nullToAbsent || callDuration != null) {
      map['call_duration'] = Variable<int>(callDuration);
    }
    if (!nullToAbsent || callResult != null) {
      map['call_result'] = Variable<String>(callResult);
    }
    if (!nullToAbsent || callType != null) {
      map['call_type'] = Variable<String>(callType);
    }
    if (!nullToAbsent || thumbnailPath != null) {
      map['thumbnail_path'] = Variable<String>(thumbnailPath);
    }
    return map;
  }

  MessagesCompanion toCompanion(bool nullToAbsent) {
    return MessagesCompanion(
      id: Value(id),
      body: Value(body),
      isMe: Value(isMe),
      timestamp: Value(timestamp),
      isEdited: Value(isEdited),
      editTime: editTime == null && nullToAbsent
          ? const Value.absent()
          : Value(editTime),
      isFavorite: Value(isFavorite),
      isForwarded: Value(isForwarded),
      forwardedFrom: forwardedFrom == null && nullToAbsent
          ? const Value.absent()
          : Value(forwardedFrom),
      replyToId: replyToId == null && nullToAbsent
          ? const Value.absent()
          : Value(replyToId),
      messageType: Value(messageType),
      mediaUrls: mediaUrls == null && nullToAbsent
          ? const Value.absent()
          : Value(mediaUrls),
      filePath: filePath == null && nullToAbsent
          ? const Value.absent()
          : Value(filePath),
      fileName: fileName == null && nullToAbsent
          ? const Value.absent()
          : Value(fileName),
      fileSize: fileSize == null && nullToAbsent
          ? const Value.absent()
          : Value(fileSize),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      locationName: locationName == null && nullToAbsent
          ? const Value.absent()
          : Value(locationName),
      status: Value(status),
      sendProgress: sendProgress == null && nullToAbsent
          ? const Value.absent()
          : Value(sendProgress),
      imageSizes: imageSizes == null && nullToAbsent
          ? const Value.absent()
          : Value(imageSizes),
      audioUrl: audioUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(audioUrl),
      audioDuration: audioDuration == null && nullToAbsent
          ? const Value.absent()
          : Value(audioDuration),
      videoDuration: videoDuration == null && nullToAbsent
          ? const Value.absent()
          : Value(videoDuration),
      videoAspectRatio: videoAspectRatio == null && nullToAbsent
          ? const Value.absent()
          : Value(videoAspectRatio),
      videoBubbleWidth: videoBubbleWidth == null && nullToAbsent
          ? const Value.absent()
          : Value(videoBubbleWidth),
      videoBubbleHeight: videoBubbleHeight == null && nullToAbsent
          ? const Value.absent()
          : Value(videoBubbleHeight),
      isGroup: Value(isGroup),
      senderUid: senderUid == null && nullToAbsent
          ? const Value.absent()
          : Value(senderUid),
      senderName: senderName == null && nullToAbsent
          ? const Value.absent()
          : Value(senderName),
      senderAvatar: senderAvatar == null && nullToAbsent
          ? const Value.absent()
          : Value(senderAvatar),
      mentions: mentions == null && nullToAbsent
          ? const Value.absent()
          : Value(mentions),
      isSended: Value(isSended),
      chatId: Value(chatId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSystemMessage: Value(isSystemMessage),
      systemData: systemData == null && nullToAbsent
          ? const Value.absent()
          : Value(systemData),
      replyToJson: replyToJson == null && nullToAbsent
          ? const Value.absent()
          : Value(replyToJson),
      bubbleEmoji: bubbleEmoji == null && nullToAbsent
          ? const Value.absent()
          : Value(bubbleEmoji),
      callDuration: callDuration == null && nullToAbsent
          ? const Value.absent()
          : Value(callDuration),
      callResult: callResult == null && nullToAbsent
          ? const Value.absent()
          : Value(callResult),
      callType: callType == null && nullToAbsent
          ? const Value.absent()
          : Value(callType),
      thumbnailPath: thumbnailPath == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailPath),
    );
  }

  factory Message.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Message(
      id: serializer.fromJson<String>(json['id']),
      body: serializer.fromJson<String>(json['body']),
      isMe: serializer.fromJson<int>(json['isMe']),
      timestamp: serializer.fromJson<String>(json['timestamp']),
      isEdited: serializer.fromJson<int>(json['isEdited']),
      editTime: serializer.fromJson<String?>(json['editTime']),
      isFavorite: serializer.fromJson<int>(json['isFavorite']),
      isForwarded: serializer.fromJson<int>(json['isForwarded']),
      forwardedFrom: serializer.fromJson<String?>(json['forwardedFrom']),
      replyToId: serializer.fromJson<String?>(json['replyToId']),
      messageType: serializer.fromJson<int>(json['messageType']),
      mediaUrls: serializer.fromJson<String?>(json['mediaUrls']),
      filePath: serializer.fromJson<String?>(json['filePath']),
      fileName: serializer.fromJson<String?>(json['fileName']),
      fileSize: serializer.fromJson<String?>(json['fileSize']),
      location: serializer.fromJson<String?>(json['location']),
      locationName: serializer.fromJson<String?>(json['locationName']),
      status: serializer.fromJson<int>(json['status']),
      sendProgress: serializer.fromJson<double?>(json['sendProgress']),
      imageSizes: serializer.fromJson<String?>(json['imageSizes']),
      audioUrl: serializer.fromJson<String?>(json['audioUrl']),
      audioDuration: serializer.fromJson<int?>(json['audioDuration']),
      videoDuration: serializer.fromJson<int?>(json['videoDuration']),
      videoAspectRatio: serializer.fromJson<double?>(json['videoAspectRatio']),
      videoBubbleWidth: serializer.fromJson<double?>(json['videoBubbleWidth']),
      videoBubbleHeight:
          serializer.fromJson<double?>(json['videoBubbleHeight']),
      isGroup: serializer.fromJson<int>(json['isGroup']),
      senderUid: serializer.fromJson<String?>(json['senderUid']),
      senderName: serializer.fromJson<String?>(json['senderName']),
      senderAvatar: serializer.fromJson<String?>(json['senderAvatar']),
      mentions: serializer.fromJson<String?>(json['mentions']),
      isSended: serializer.fromJson<int>(json['isSended']),
      chatId: serializer.fromJson<String>(json['chatId']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      isSystemMessage: serializer.fromJson<int>(json['isSystemMessage']),
      systemData: serializer.fromJson<String?>(json['systemData']),
      replyToJson: serializer.fromJson<String?>(json['replyToJson']),
      bubbleEmoji: serializer.fromJson<String?>(json['bubbleEmoji']),
      callDuration: serializer.fromJson<int?>(json['callDuration']),
      callResult: serializer.fromJson<String?>(json['callResult']),
      callType: serializer.fromJson<String?>(json['callType']),
      thumbnailPath: serializer.fromJson<String?>(json['thumbnailPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'body': serializer.toJson<String>(body),
      'isMe': serializer.toJson<int>(isMe),
      'timestamp': serializer.toJson<String>(timestamp),
      'isEdited': serializer.toJson<int>(isEdited),
      'editTime': serializer.toJson<String?>(editTime),
      'isFavorite': serializer.toJson<int>(isFavorite),
      'isForwarded': serializer.toJson<int>(isForwarded),
      'forwardedFrom': serializer.toJson<String?>(forwardedFrom),
      'replyToId': serializer.toJson<String?>(replyToId),
      'messageType': serializer.toJson<int>(messageType),
      'mediaUrls': serializer.toJson<String?>(mediaUrls),
      'filePath': serializer.toJson<String?>(filePath),
      'fileName': serializer.toJson<String?>(fileName),
      'fileSize': serializer.toJson<String?>(fileSize),
      'location': serializer.toJson<String?>(location),
      'locationName': serializer.toJson<String?>(locationName),
      'status': serializer.toJson<int>(status),
      'sendProgress': serializer.toJson<double?>(sendProgress),
      'imageSizes': serializer.toJson<String?>(imageSizes),
      'audioUrl': serializer.toJson<String?>(audioUrl),
      'audioDuration': serializer.toJson<int?>(audioDuration),
      'videoDuration': serializer.toJson<int?>(videoDuration),
      'videoAspectRatio': serializer.toJson<double?>(videoAspectRatio),
      'videoBubbleWidth': serializer.toJson<double?>(videoBubbleWidth),
      'videoBubbleHeight': serializer.toJson<double?>(videoBubbleHeight),
      'isGroup': serializer.toJson<int>(isGroup),
      'senderUid': serializer.toJson<String?>(senderUid),
      'senderName': serializer.toJson<String?>(senderName),
      'senderAvatar': serializer.toJson<String?>(senderAvatar),
      'mentions': serializer.toJson<String?>(mentions),
      'isSended': serializer.toJson<int>(isSended),
      'chatId': serializer.toJson<String>(chatId),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'isSystemMessage': serializer.toJson<int>(isSystemMessage),
      'systemData': serializer.toJson<String?>(systemData),
      'replyToJson': serializer.toJson<String?>(replyToJson),
      'bubbleEmoji': serializer.toJson<String?>(bubbleEmoji),
      'callDuration': serializer.toJson<int?>(callDuration),
      'callResult': serializer.toJson<String?>(callResult),
      'callType': serializer.toJson<String?>(callType),
      'thumbnailPath': serializer.toJson<String?>(thumbnailPath),
    };
  }

  Message copyWith(
          {String? id,
          String? body,
          int? isMe,
          String? timestamp,
          int? isEdited,
          Value<String?> editTime = const Value.absent(),
          int? isFavorite,
          int? isForwarded,
          Value<String?> forwardedFrom = const Value.absent(),
          Value<String?> replyToId = const Value.absent(),
          int? messageType,
          Value<String?> mediaUrls = const Value.absent(),
          Value<String?> filePath = const Value.absent(),
          Value<String?> fileName = const Value.absent(),
          Value<String?> fileSize = const Value.absent(),
          Value<String?> location = const Value.absent(),
          Value<String?> locationName = const Value.absent(),
          int? status,
          Value<double?> sendProgress = const Value.absent(),
          Value<String?> imageSizes = const Value.absent(),
          Value<String?> audioUrl = const Value.absent(),
          Value<int?> audioDuration = const Value.absent(),
          Value<int?> videoDuration = const Value.absent(),
          Value<double?> videoAspectRatio = const Value.absent(),
          Value<double?> videoBubbleWidth = const Value.absent(),
          Value<double?> videoBubbleHeight = const Value.absent(),
          int? isGroup,
          Value<String?> senderUid = const Value.absent(),
          Value<String?> senderName = const Value.absent(),
          Value<String?> senderAvatar = const Value.absent(),
          Value<String?> mentions = const Value.absent(),
          int? isSended,
          String? chatId,
          String? createdAt,
          String? updatedAt,
          int? isSystemMessage,
          Value<String?> systemData = const Value.absent(),
          Value<String?> replyToJson = const Value.absent(),
          Value<String?> bubbleEmoji = const Value.absent(),
          Value<int?> callDuration = const Value.absent(),
          Value<String?> callResult = const Value.absent(),
          Value<String?> callType = const Value.absent(),
          Value<String?> thumbnailPath = const Value.absent()}) =>
      Message(
        id: id ?? this.id,
        body: body ?? this.body,
        isMe: isMe ?? this.isMe,
        timestamp: timestamp ?? this.timestamp,
        isEdited: isEdited ?? this.isEdited,
        editTime: editTime.present ? editTime.value : this.editTime,
        isFavorite: isFavorite ?? this.isFavorite,
        isForwarded: isForwarded ?? this.isForwarded,
        forwardedFrom:
            forwardedFrom.present ? forwardedFrom.value : this.forwardedFrom,
        replyToId: replyToId.present ? replyToId.value : this.replyToId,
        messageType: messageType ?? this.messageType,
        mediaUrls: mediaUrls.present ? mediaUrls.value : this.mediaUrls,
        filePath: filePath.present ? filePath.value : this.filePath,
        fileName: fileName.present ? fileName.value : this.fileName,
        fileSize: fileSize.present ? fileSize.value : this.fileSize,
        location: location.present ? location.value : this.location,
        locationName:
            locationName.present ? locationName.value : this.locationName,
        status: status ?? this.status,
        sendProgress:
            sendProgress.present ? sendProgress.value : this.sendProgress,
        imageSizes: imageSizes.present ? imageSizes.value : this.imageSizes,
        audioUrl: audioUrl.present ? audioUrl.value : this.audioUrl,
        audioDuration:
            audioDuration.present ? audioDuration.value : this.audioDuration,
        videoDuration:
            videoDuration.present ? videoDuration.value : this.videoDuration,
        videoAspectRatio: videoAspectRatio.present
            ? videoAspectRatio.value
            : this.videoAspectRatio,
        videoBubbleWidth: videoBubbleWidth.present
            ? videoBubbleWidth.value
            : this.videoBubbleWidth,
        videoBubbleHeight: videoBubbleHeight.present
            ? videoBubbleHeight.value
            : this.videoBubbleHeight,
        isGroup: isGroup ?? this.isGroup,
        senderUid: senderUid.present ? senderUid.value : this.senderUid,
        senderName: senderName.present ? senderName.value : this.senderName,
        senderAvatar:
            senderAvatar.present ? senderAvatar.value : this.senderAvatar,
        mentions: mentions.present ? mentions.value : this.mentions,
        isSended: isSended ?? this.isSended,
        chatId: chatId ?? this.chatId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isSystemMessage: isSystemMessage ?? this.isSystemMessage,
        systemData: systemData.present ? systemData.value : this.systemData,
        replyToJson: replyToJson.present ? replyToJson.value : this.replyToJson,
        bubbleEmoji: bubbleEmoji.present ? bubbleEmoji.value : this.bubbleEmoji,
        callDuration:
            callDuration.present ? callDuration.value : this.callDuration,
        callResult: callResult.present ? callResult.value : this.callResult,
        callType: callType.present ? callType.value : this.callType,
        thumbnailPath:
            thumbnailPath.present ? thumbnailPath.value : this.thumbnailPath,
      );
  Message copyWithCompanion(MessagesCompanion data) {
    return Message(
      id: data.id.present ? data.id.value : this.id,
      body: data.body.present ? data.body.value : this.body,
      isMe: data.isMe.present ? data.isMe.value : this.isMe,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      isEdited: data.isEdited.present ? data.isEdited.value : this.isEdited,
      editTime: data.editTime.present ? data.editTime.value : this.editTime,
      isFavorite:
          data.isFavorite.present ? data.isFavorite.value : this.isFavorite,
      isForwarded:
          data.isForwarded.present ? data.isForwarded.value : this.isForwarded,
      forwardedFrom: data.forwardedFrom.present
          ? data.forwardedFrom.value
          : this.forwardedFrom,
      replyToId: data.replyToId.present ? data.replyToId.value : this.replyToId,
      messageType:
          data.messageType.present ? data.messageType.value : this.messageType,
      mediaUrls: data.mediaUrls.present ? data.mediaUrls.value : this.mediaUrls,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      fileSize: data.fileSize.present ? data.fileSize.value : this.fileSize,
      location: data.location.present ? data.location.value : this.location,
      locationName: data.locationName.present
          ? data.locationName.value
          : this.locationName,
      status: data.status.present ? data.status.value : this.status,
      sendProgress: data.sendProgress.present
          ? data.sendProgress.value
          : this.sendProgress,
      imageSizes:
          data.imageSizes.present ? data.imageSizes.value : this.imageSizes,
      audioUrl: data.audioUrl.present ? data.audioUrl.value : this.audioUrl,
      audioDuration: data.audioDuration.present
          ? data.audioDuration.value
          : this.audioDuration,
      videoDuration: data.videoDuration.present
          ? data.videoDuration.value
          : this.videoDuration,
      videoAspectRatio: data.videoAspectRatio.present
          ? data.videoAspectRatio.value
          : this.videoAspectRatio,
      videoBubbleWidth: data.videoBubbleWidth.present
          ? data.videoBubbleWidth.value
          : this.videoBubbleWidth,
      videoBubbleHeight: data.videoBubbleHeight.present
          ? data.videoBubbleHeight.value
          : this.videoBubbleHeight,
      isGroup: data.isGroup.present ? data.isGroup.value : this.isGroup,
      senderUid: data.senderUid.present ? data.senderUid.value : this.senderUid,
      senderName:
          data.senderName.present ? data.senderName.value : this.senderName,
      senderAvatar: data.senderAvatar.present
          ? data.senderAvatar.value
          : this.senderAvatar,
      mentions: data.mentions.present ? data.mentions.value : this.mentions,
      isSended: data.isSended.present ? data.isSended.value : this.isSended,
      chatId: data.chatId.present ? data.chatId.value : this.chatId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSystemMessage: data.isSystemMessage.present
          ? data.isSystemMessage.value
          : this.isSystemMessage,
      systemData:
          data.systemData.present ? data.systemData.value : this.systemData,
      replyToJson:
          data.replyToJson.present ? data.replyToJson.value : this.replyToJson,
      bubbleEmoji:
          data.bubbleEmoji.present ? data.bubbleEmoji.value : this.bubbleEmoji,
      callDuration: data.callDuration.present
          ? data.callDuration.value
          : this.callDuration,
      callResult:
          data.callResult.present ? data.callResult.value : this.callResult,
      callType: data.callType.present ? data.callType.value : this.callType,
      thumbnailPath: data.thumbnailPath.present
          ? data.thumbnailPath.value
          : this.thumbnailPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Message(')
          ..write('id: $id, ')
          ..write('body: $body, ')
          ..write('isMe: $isMe, ')
          ..write('timestamp: $timestamp, ')
          ..write('isEdited: $isEdited, ')
          ..write('editTime: $editTime, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('isForwarded: $isForwarded, ')
          ..write('forwardedFrom: $forwardedFrom, ')
          ..write('replyToId: $replyToId, ')
          ..write('messageType: $messageType, ')
          ..write('mediaUrls: $mediaUrls, ')
          ..write('filePath: $filePath, ')
          ..write('fileName: $fileName, ')
          ..write('fileSize: $fileSize, ')
          ..write('location: $location, ')
          ..write('locationName: $locationName, ')
          ..write('status: $status, ')
          ..write('sendProgress: $sendProgress, ')
          ..write('imageSizes: $imageSizes, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('audioDuration: $audioDuration, ')
          ..write('videoDuration: $videoDuration, ')
          ..write('videoAspectRatio: $videoAspectRatio, ')
          ..write('videoBubbleWidth: $videoBubbleWidth, ')
          ..write('videoBubbleHeight: $videoBubbleHeight, ')
          ..write('isGroup: $isGroup, ')
          ..write('senderUid: $senderUid, ')
          ..write('senderName: $senderName, ')
          ..write('senderAvatar: $senderAvatar, ')
          ..write('mentions: $mentions, ')
          ..write('isSended: $isSended, ')
          ..write('chatId: $chatId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSystemMessage: $isSystemMessage, ')
          ..write('systemData: $systemData, ')
          ..write('replyToJson: $replyToJson, ')
          ..write('bubbleEmoji: $bubbleEmoji, ')
          ..write('callDuration: $callDuration, ')
          ..write('callResult: $callResult, ')
          ..write('callType: $callType, ')
          ..write('thumbnailPath: $thumbnailPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        body,
        isMe,
        timestamp,
        isEdited,
        editTime,
        isFavorite,
        isForwarded,
        forwardedFrom,
        replyToId,
        messageType,
        mediaUrls,
        filePath,
        fileName,
        fileSize,
        location,
        locationName,
        status,
        sendProgress,
        imageSizes,
        audioUrl,
        audioDuration,
        videoDuration,
        videoAspectRatio,
        videoBubbleWidth,
        videoBubbleHeight,
        isGroup,
        senderUid,
        senderName,
        senderAvatar,
        mentions,
        isSended,
        chatId,
        createdAt,
        updatedAt,
        isSystemMessage,
        systemData,
        replyToJson,
        bubbleEmoji,
        callDuration,
        callResult,
        callType,
        thumbnailPath
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Message &&
          other.id == this.id &&
          other.body == this.body &&
          other.isMe == this.isMe &&
          other.timestamp == this.timestamp &&
          other.isEdited == this.isEdited &&
          other.editTime == this.editTime &&
          other.isFavorite == this.isFavorite &&
          other.isForwarded == this.isForwarded &&
          other.forwardedFrom == this.forwardedFrom &&
          other.replyToId == this.replyToId &&
          other.messageType == this.messageType &&
          other.mediaUrls == this.mediaUrls &&
          other.filePath == this.filePath &&
          other.fileName == this.fileName &&
          other.fileSize == this.fileSize &&
          other.location == this.location &&
          other.locationName == this.locationName &&
          other.status == this.status &&
          other.sendProgress == this.sendProgress &&
          other.imageSizes == this.imageSizes &&
          other.audioUrl == this.audioUrl &&
          other.audioDuration == this.audioDuration &&
          other.videoDuration == this.videoDuration &&
          other.videoAspectRatio == this.videoAspectRatio &&
          other.videoBubbleWidth == this.videoBubbleWidth &&
          other.videoBubbleHeight == this.videoBubbleHeight &&
          other.isGroup == this.isGroup &&
          other.senderUid == this.senderUid &&
          other.senderName == this.senderName &&
          other.senderAvatar == this.senderAvatar &&
          other.mentions == this.mentions &&
          other.isSended == this.isSended &&
          other.chatId == this.chatId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isSystemMessage == this.isSystemMessage &&
          other.systemData == this.systemData &&
          other.replyToJson == this.replyToJson &&
          other.bubbleEmoji == this.bubbleEmoji &&
          other.callDuration == this.callDuration &&
          other.callResult == this.callResult &&
          other.callType == this.callType &&
          other.thumbnailPath == this.thumbnailPath);
}

class MessagesCompanion extends UpdateCompanion<Message> {
  final Value<String> id;
  final Value<String> body;
  final Value<int> isMe;
  final Value<String> timestamp;
  final Value<int> isEdited;
  final Value<String?> editTime;
  final Value<int> isFavorite;
  final Value<int> isForwarded;
  final Value<String?> forwardedFrom;
  final Value<String?> replyToId;
  final Value<int> messageType;
  final Value<String?> mediaUrls;
  final Value<String?> filePath;
  final Value<String?> fileName;
  final Value<String?> fileSize;
  final Value<String?> location;
  final Value<String?> locationName;
  final Value<int> status;
  final Value<double?> sendProgress;
  final Value<String?> imageSizes;
  final Value<String?> audioUrl;
  final Value<int?> audioDuration;
  final Value<int?> videoDuration;
  final Value<double?> videoAspectRatio;
  final Value<double?> videoBubbleWidth;
  final Value<double?> videoBubbleHeight;
  final Value<int> isGroup;
  final Value<String?> senderUid;
  final Value<String?> senderName;
  final Value<String?> senderAvatar;
  final Value<String?> mentions;
  final Value<int> isSended;
  final Value<String> chatId;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> isSystemMessage;
  final Value<String?> systemData;
  final Value<String?> replyToJson;
  final Value<String?> bubbleEmoji;
  final Value<int?> callDuration;
  final Value<String?> callResult;
  final Value<String?> callType;
  final Value<String?> thumbnailPath;
  final Value<int> rowid;
  const MessagesCompanion({
    this.id = const Value.absent(),
    this.body = const Value.absent(),
    this.isMe = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.isEdited = const Value.absent(),
    this.editTime = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.isForwarded = const Value.absent(),
    this.forwardedFrom = const Value.absent(),
    this.replyToId = const Value.absent(),
    this.messageType = const Value.absent(),
    this.mediaUrls = const Value.absent(),
    this.filePath = const Value.absent(),
    this.fileName = const Value.absent(),
    this.fileSize = const Value.absent(),
    this.location = const Value.absent(),
    this.locationName = const Value.absent(),
    this.status = const Value.absent(),
    this.sendProgress = const Value.absent(),
    this.imageSizes = const Value.absent(),
    this.audioUrl = const Value.absent(),
    this.audioDuration = const Value.absent(),
    this.videoDuration = const Value.absent(),
    this.videoAspectRatio = const Value.absent(),
    this.videoBubbleWidth = const Value.absent(),
    this.videoBubbleHeight = const Value.absent(),
    this.isGroup = const Value.absent(),
    this.senderUid = const Value.absent(),
    this.senderName = const Value.absent(),
    this.senderAvatar = const Value.absent(),
    this.mentions = const Value.absent(),
    this.isSended = const Value.absent(),
    this.chatId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSystemMessage = const Value.absent(),
    this.systemData = const Value.absent(),
    this.replyToJson = const Value.absent(),
    this.bubbleEmoji = const Value.absent(),
    this.callDuration = const Value.absent(),
    this.callResult = const Value.absent(),
    this.callType = const Value.absent(),
    this.thumbnailPath = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MessagesCompanion.insert({
    required String id,
    required String body,
    required int isMe,
    required String timestamp,
    this.isEdited = const Value.absent(),
    this.editTime = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.isForwarded = const Value.absent(),
    this.forwardedFrom = const Value.absent(),
    this.replyToId = const Value.absent(),
    this.messageType = const Value.absent(),
    this.mediaUrls = const Value.absent(),
    this.filePath = const Value.absent(),
    this.fileName = const Value.absent(),
    this.fileSize = const Value.absent(),
    this.location = const Value.absent(),
    this.locationName = const Value.absent(),
    this.status = const Value.absent(),
    this.sendProgress = const Value.absent(),
    this.imageSizes = const Value.absent(),
    this.audioUrl = const Value.absent(),
    this.audioDuration = const Value.absent(),
    this.videoDuration = const Value.absent(),
    this.videoAspectRatio = const Value.absent(),
    this.videoBubbleWidth = const Value.absent(),
    this.videoBubbleHeight = const Value.absent(),
    this.isGroup = const Value.absent(),
    this.senderUid = const Value.absent(),
    this.senderName = const Value.absent(),
    this.senderAvatar = const Value.absent(),
    this.mentions = const Value.absent(),
    this.isSended = const Value.absent(),
    required String chatId,
    required String createdAt,
    required String updatedAt,
    this.isSystemMessage = const Value.absent(),
    this.systemData = const Value.absent(),
    this.replyToJson = const Value.absent(),
    this.bubbleEmoji = const Value.absent(),
    this.callDuration = const Value.absent(),
    this.callResult = const Value.absent(),
    this.callType = const Value.absent(),
    this.thumbnailPath = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        body = Value(body),
        isMe = Value(isMe),
        timestamp = Value(timestamp),
        chatId = Value(chatId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Message> custom({
    Expression<String>? id,
    Expression<String>? body,
    Expression<int>? isMe,
    Expression<String>? timestamp,
    Expression<int>? isEdited,
    Expression<String>? editTime,
    Expression<int>? isFavorite,
    Expression<int>? isForwarded,
    Expression<String>? forwardedFrom,
    Expression<String>? replyToId,
    Expression<int>? messageType,
    Expression<String>? mediaUrls,
    Expression<String>? filePath,
    Expression<String>? fileName,
    Expression<String>? fileSize,
    Expression<String>? location,
    Expression<String>? locationName,
    Expression<int>? status,
    Expression<double>? sendProgress,
    Expression<String>? imageSizes,
    Expression<String>? audioUrl,
    Expression<int>? audioDuration,
    Expression<int>? videoDuration,
    Expression<double>? videoAspectRatio,
    Expression<double>? videoBubbleWidth,
    Expression<double>? videoBubbleHeight,
    Expression<int>? isGroup,
    Expression<String>? senderUid,
    Expression<String>? senderName,
    Expression<String>? senderAvatar,
    Expression<String>? mentions,
    Expression<int>? isSended,
    Expression<String>? chatId,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? isSystemMessage,
    Expression<String>? systemData,
    Expression<String>? replyToJson,
    Expression<String>? bubbleEmoji,
    Expression<int>? callDuration,
    Expression<String>? callResult,
    Expression<String>? callType,
    Expression<String>? thumbnailPath,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (body != null) 'text': body,
      if (isMe != null) 'is_me': isMe,
      if (timestamp != null) 'timestamp': timestamp,
      if (isEdited != null) 'is_edited': isEdited,
      if (editTime != null) 'edit_time': editTime,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (isForwarded != null) 'is_forwarded': isForwarded,
      if (forwardedFrom != null) 'forwarded_from': forwardedFrom,
      if (replyToId != null) 'reply_to_id': replyToId,
      if (messageType != null) 'message_type': messageType,
      if (mediaUrls != null) 'media_urls': mediaUrls,
      if (filePath != null) 'file_path': filePath,
      if (fileName != null) 'file_name': fileName,
      if (fileSize != null) 'file_size': fileSize,
      if (location != null) 'location': location,
      if (locationName != null) 'location_name': locationName,
      if (status != null) 'status': status,
      if (sendProgress != null) 'send_progress': sendProgress,
      if (imageSizes != null) 'image_sizes': imageSizes,
      if (audioUrl != null) 'audio_url': audioUrl,
      if (audioDuration != null) 'audio_duration': audioDuration,
      if (videoDuration != null) 'video_duration': videoDuration,
      if (videoAspectRatio != null) 'video_aspect_ratio': videoAspectRatio,
      if (videoBubbleWidth != null) 'video_bubble_width': videoBubbleWidth,
      if (videoBubbleHeight != null) 'video_bubble_height': videoBubbleHeight,
      if (isGroup != null) 'is_group': isGroup,
      if (senderUid != null) 'sender_uid': senderUid,
      if (senderName != null) 'sender_name': senderName,
      if (senderAvatar != null) 'sender_avatar': senderAvatar,
      if (mentions != null) 'mentions': mentions,
      if (isSended != null) 'is_sended': isSended,
      if (chatId != null) 'chat_id': chatId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSystemMessage != null) 'is_system_message': isSystemMessage,
      if (systemData != null) 'system_data': systemData,
      if (replyToJson != null) 'reply_to_json': replyToJson,
      if (bubbleEmoji != null) 'bubble_emoji': bubbleEmoji,
      if (callDuration != null) 'call_duration': callDuration,
      if (callResult != null) 'call_result': callResult,
      if (callType != null) 'call_type': callType,
      if (thumbnailPath != null) 'thumbnail_path': thumbnailPath,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MessagesCompanion copyWith(
      {Value<String>? id,
      Value<String>? body,
      Value<int>? isMe,
      Value<String>? timestamp,
      Value<int>? isEdited,
      Value<String?>? editTime,
      Value<int>? isFavorite,
      Value<int>? isForwarded,
      Value<String?>? forwardedFrom,
      Value<String?>? replyToId,
      Value<int>? messageType,
      Value<String?>? mediaUrls,
      Value<String?>? filePath,
      Value<String?>? fileName,
      Value<String?>? fileSize,
      Value<String?>? location,
      Value<String?>? locationName,
      Value<int>? status,
      Value<double?>? sendProgress,
      Value<String?>? imageSizes,
      Value<String?>? audioUrl,
      Value<int?>? audioDuration,
      Value<int?>? videoDuration,
      Value<double?>? videoAspectRatio,
      Value<double?>? videoBubbleWidth,
      Value<double?>? videoBubbleHeight,
      Value<int>? isGroup,
      Value<String?>? senderUid,
      Value<String?>? senderName,
      Value<String?>? senderAvatar,
      Value<String?>? mentions,
      Value<int>? isSended,
      Value<String>? chatId,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<int>? isSystemMessage,
      Value<String?>? systemData,
      Value<String?>? replyToJson,
      Value<String?>? bubbleEmoji,
      Value<int?>? callDuration,
      Value<String?>? callResult,
      Value<String?>? callType,
      Value<String?>? thumbnailPath,
      Value<int>? rowid}) {
    return MessagesCompanion(
      id: id ?? this.id,
      body: body ?? this.body,
      isMe: isMe ?? this.isMe,
      timestamp: timestamp ?? this.timestamp,
      isEdited: isEdited ?? this.isEdited,
      editTime: editTime ?? this.editTime,
      isFavorite: isFavorite ?? this.isFavorite,
      isForwarded: isForwarded ?? this.isForwarded,
      forwardedFrom: forwardedFrom ?? this.forwardedFrom,
      replyToId: replyToId ?? this.replyToId,
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
      isGroup: isGroup ?? this.isGroup,
      senderUid: senderUid ?? this.senderUid,
      senderName: senderName ?? this.senderName,
      senderAvatar: senderAvatar ?? this.senderAvatar,
      mentions: mentions ?? this.mentions,
      isSended: isSended ?? this.isSended,
      chatId: chatId ?? this.chatId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSystemMessage: isSystemMessage ?? this.isSystemMessage,
      systemData: systemData ?? this.systemData,
      replyToJson: replyToJson ?? this.replyToJson,
      bubbleEmoji: bubbleEmoji ?? this.bubbleEmoji,
      callDuration: callDuration ?? this.callDuration,
      callResult: callResult ?? this.callResult,
      callType: callType ?? this.callType,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (body.present) {
      map['text'] = Variable<String>(body.value);
    }
    if (isMe.present) {
      map['is_me'] = Variable<int>(isMe.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<String>(timestamp.value);
    }
    if (isEdited.present) {
      map['is_edited'] = Variable<int>(isEdited.value);
    }
    if (editTime.present) {
      map['edit_time'] = Variable<String>(editTime.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<int>(isFavorite.value);
    }
    if (isForwarded.present) {
      map['is_forwarded'] = Variable<int>(isForwarded.value);
    }
    if (forwardedFrom.present) {
      map['forwarded_from'] = Variable<String>(forwardedFrom.value);
    }
    if (replyToId.present) {
      map['reply_to_id'] = Variable<String>(replyToId.value);
    }
    if (messageType.present) {
      map['message_type'] = Variable<int>(messageType.value);
    }
    if (mediaUrls.present) {
      map['media_urls'] = Variable<String>(mediaUrls.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (fileSize.present) {
      map['file_size'] = Variable<String>(fileSize.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (locationName.present) {
      map['location_name'] = Variable<String>(locationName.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (sendProgress.present) {
      map['send_progress'] = Variable<double>(sendProgress.value);
    }
    if (imageSizes.present) {
      map['image_sizes'] = Variable<String>(imageSizes.value);
    }
    if (audioUrl.present) {
      map['audio_url'] = Variable<String>(audioUrl.value);
    }
    if (audioDuration.present) {
      map['audio_duration'] = Variable<int>(audioDuration.value);
    }
    if (videoDuration.present) {
      map['video_duration'] = Variable<int>(videoDuration.value);
    }
    if (videoAspectRatio.present) {
      map['video_aspect_ratio'] = Variable<double>(videoAspectRatio.value);
    }
    if (videoBubbleWidth.present) {
      map['video_bubble_width'] = Variable<double>(videoBubbleWidth.value);
    }
    if (videoBubbleHeight.present) {
      map['video_bubble_height'] = Variable<double>(videoBubbleHeight.value);
    }
    if (isGroup.present) {
      map['is_group'] = Variable<int>(isGroup.value);
    }
    if (senderUid.present) {
      map['sender_uid'] = Variable<String>(senderUid.value);
    }
    if (senderName.present) {
      map['sender_name'] = Variable<String>(senderName.value);
    }
    if (senderAvatar.present) {
      map['sender_avatar'] = Variable<String>(senderAvatar.value);
    }
    if (mentions.present) {
      map['mentions'] = Variable<String>(mentions.value);
    }
    if (isSended.present) {
      map['is_sended'] = Variable<int>(isSended.value);
    }
    if (chatId.present) {
      map['chat_id'] = Variable<String>(chatId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (isSystemMessage.present) {
      map['is_system_message'] = Variable<int>(isSystemMessage.value);
    }
    if (systemData.present) {
      map['system_data'] = Variable<String>(systemData.value);
    }
    if (replyToJson.present) {
      map['reply_to_json'] = Variable<String>(replyToJson.value);
    }
    if (bubbleEmoji.present) {
      map['bubble_emoji'] = Variable<String>(bubbleEmoji.value);
    }
    if (callDuration.present) {
      map['call_duration'] = Variable<int>(callDuration.value);
    }
    if (callResult.present) {
      map['call_result'] = Variable<String>(callResult.value);
    }
    if (callType.present) {
      map['call_type'] = Variable<String>(callType.value);
    }
    if (thumbnailPath.present) {
      map['thumbnail_path'] = Variable<String>(thumbnailPath.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessagesCompanion(')
          ..write('id: $id, ')
          ..write('body: $body, ')
          ..write('isMe: $isMe, ')
          ..write('timestamp: $timestamp, ')
          ..write('isEdited: $isEdited, ')
          ..write('editTime: $editTime, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('isForwarded: $isForwarded, ')
          ..write('forwardedFrom: $forwardedFrom, ')
          ..write('replyToId: $replyToId, ')
          ..write('messageType: $messageType, ')
          ..write('mediaUrls: $mediaUrls, ')
          ..write('filePath: $filePath, ')
          ..write('fileName: $fileName, ')
          ..write('fileSize: $fileSize, ')
          ..write('location: $location, ')
          ..write('locationName: $locationName, ')
          ..write('status: $status, ')
          ..write('sendProgress: $sendProgress, ')
          ..write('imageSizes: $imageSizes, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('audioDuration: $audioDuration, ')
          ..write('videoDuration: $videoDuration, ')
          ..write('videoAspectRatio: $videoAspectRatio, ')
          ..write('videoBubbleWidth: $videoBubbleWidth, ')
          ..write('videoBubbleHeight: $videoBubbleHeight, ')
          ..write('isGroup: $isGroup, ')
          ..write('senderUid: $senderUid, ')
          ..write('senderName: $senderName, ')
          ..write('senderAvatar: $senderAvatar, ')
          ..write('mentions: $mentions, ')
          ..write('isSended: $isSended, ')
          ..write('chatId: $chatId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSystemMessage: $isSystemMessage, ')
          ..write('systemData: $systemData, ')
          ..write('replyToJson: $replyToJson, ')
          ..write('bubbleEmoji: $bubbleEmoji, ')
          ..write('callDuration: $callDuration, ')
          ..write('callResult: $callResult, ')
          ..write('callType: $callType, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ContactsTable extends Contacts with TableInfo<$ContactsTable, Contact> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContactsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _myUidMeta = const VerificationMeta('myUid');
  @override
  late final GeneratedColumn<int> myUid = GeneratedColumn<int>(
      'my_uid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _friendUidMeta =
      const VerificationMeta('friendUid');
  @override
  late final GeneratedColumn<int> friendUid = GeneratedColumn<int>(
      'friend_uid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _adddAtMeta = const VerificationMeta('adddAt');
  @override
  late final GeneratedColumn<String> adddAt = GeneratedColumn<String>(
      'addd_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _loginNameMeta =
      const VerificationMeta('loginName');
  @override
  late final GeneratedColumn<String> loginName = GeneratedColumn<String>(
      'login_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _userAvatarMeta =
      const VerificationMeta('userAvatar');
  @override
  late final GeneratedColumn<String> userAvatar = GeneratedColumn<String>(
      'user_avatar', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _introduceMeta =
      const VerificationMeta('introduce');
  @override
  late final GeneratedColumn<String> introduce = GeneratedColumn<String>(
      'introduce', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _birthdayMeta =
      const VerificationMeta('birthday');
  @override
  late final GeneratedColumn<String> birthday = GeneratedColumn<String>(
      'birthday', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
      'sex', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _otherConMeta =
      const VerificationMeta('otherCon');
  @override
  late final GeneratedColumn<String> otherCon = GeneratedColumn<String>(
      'other_con', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastActivityAtMeta =
      const VerificationMeta('lastActivityAt');
  @override
  late final GeneratedColumn<String> lastActivityAt = GeneratedColumn<String>(
      'last_activity_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _publicKeyMeta =
      const VerificationMeta('publicKey');
  @override
  late final GeneratedColumn<String> publicKey = GeneratedColumn<String>(
      'public_key', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isOnlineMeta =
      const VerificationMeta('isOnline');
  @override
  late final GeneratedColumn<int> isOnline = GeneratedColumn<int>(
      'is_online', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        myUid,
        friendUid,
        adddAt,
        loginName,
        firstName,
        lastName,
        userAvatar,
        introduce,
        birthday,
        sex,
        email,
        otherCon,
        lastActivityAt,
        publicKey,
        isOnline
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'contacts';
  @override
  VerificationContext validateIntegrity(Insertable<Contact> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('my_uid')) {
      context.handle(
          _myUidMeta, myUid.isAcceptableOrUnknown(data['my_uid']!, _myUidMeta));
    } else if (isInserting) {
      context.missing(_myUidMeta);
    }
    if (data.containsKey('friend_uid')) {
      context.handle(_friendUidMeta,
          friendUid.isAcceptableOrUnknown(data['friend_uid']!, _friendUidMeta));
    }
    if (data.containsKey('addd_at')) {
      context.handle(_adddAtMeta,
          adddAt.isAcceptableOrUnknown(data['addd_at']!, _adddAtMeta));
    }
    if (data.containsKey('login_name')) {
      context.handle(_loginNameMeta,
          loginName.isAcceptableOrUnknown(data['login_name']!, _loginNameMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('user_avatar')) {
      context.handle(
          _userAvatarMeta,
          userAvatar.isAcceptableOrUnknown(
              data['user_avatar']!, _userAvatarMeta));
    }
    if (data.containsKey('introduce')) {
      context.handle(_introduceMeta,
          introduce.isAcceptableOrUnknown(data['introduce']!, _introduceMeta));
    }
    if (data.containsKey('birthday')) {
      context.handle(_birthdayMeta,
          birthday.isAcceptableOrUnknown(data['birthday']!, _birthdayMeta));
    }
    if (data.containsKey('sex')) {
      context.handle(
          _sexMeta, sex.isAcceptableOrUnknown(data['sex']!, _sexMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('other_con')) {
      context.handle(_otherConMeta,
          otherCon.isAcceptableOrUnknown(data['other_con']!, _otherConMeta));
    }
    if (data.containsKey('last_activity_at')) {
      context.handle(
          _lastActivityAtMeta,
          lastActivityAt.isAcceptableOrUnknown(
              data['last_activity_at']!, _lastActivityAtMeta));
    }
    if (data.containsKey('public_key')) {
      context.handle(_publicKeyMeta,
          publicKey.isAcceptableOrUnknown(data['public_key']!, _publicKeyMeta));
    }
    if (data.containsKey('is_online')) {
      context.handle(_isOnlineMeta,
          isOnline.isAcceptableOrUnknown(data['is_online']!, _isOnlineMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {friendUid};
  @override
  Contact map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Contact(
      myUid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}my_uid'])!,
      friendUid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}friend_uid'])!,
      adddAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}addd_at']),
      loginName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}login_name']),
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name']),
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name']),
      userAvatar: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_avatar']),
      introduce: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}introduce']),
      birthday: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}birthday']),
      sex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sex']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      otherCon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}other_con']),
      lastActivityAt: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}last_activity_at']),
      publicKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}public_key']),
      isOnline: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_online']),
    );
  }

  @override
  $ContactsTable createAlias(String alias) {
    return $ContactsTable(attachedDatabase, alias);
  }
}

class Contact extends DataClass implements Insertable<Contact> {
  final int myUid;
  final int friendUid;
  final String? adddAt;
  final String? loginName;
  final String? firstName;
  final String? lastName;
  final String? userAvatar;
  final String? introduce;
  final String? birthday;
  final String? sex;
  final String? email;
  final String? otherCon;
  final String? lastActivityAt;
  final String? publicKey;
  final int? isOnline;
  const Contact(
      {required this.myUid,
      required this.friendUid,
      this.adddAt,
      this.loginName,
      this.firstName,
      this.lastName,
      this.userAvatar,
      this.introduce,
      this.birthday,
      this.sex,
      this.email,
      this.otherCon,
      this.lastActivityAt,
      this.publicKey,
      this.isOnline});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['my_uid'] = Variable<int>(myUid);
    map['friend_uid'] = Variable<int>(friendUid);
    if (!nullToAbsent || adddAt != null) {
      map['addd_at'] = Variable<String>(adddAt);
    }
    if (!nullToAbsent || loginName != null) {
      map['login_name'] = Variable<String>(loginName);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || userAvatar != null) {
      map['user_avatar'] = Variable<String>(userAvatar);
    }
    if (!nullToAbsent || introduce != null) {
      map['introduce'] = Variable<String>(introduce);
    }
    if (!nullToAbsent || birthday != null) {
      map['birthday'] = Variable<String>(birthday);
    }
    if (!nullToAbsent || sex != null) {
      map['sex'] = Variable<String>(sex);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || otherCon != null) {
      map['other_con'] = Variable<String>(otherCon);
    }
    if (!nullToAbsent || lastActivityAt != null) {
      map['last_activity_at'] = Variable<String>(lastActivityAt);
    }
    if (!nullToAbsent || publicKey != null) {
      map['public_key'] = Variable<String>(publicKey);
    }
    if (!nullToAbsent || isOnline != null) {
      map['is_online'] = Variable<int>(isOnline);
    }
    return map;
  }

  ContactsCompanion toCompanion(bool nullToAbsent) {
    return ContactsCompanion(
      myUid: Value(myUid),
      friendUid: Value(friendUid),
      adddAt:
          adddAt == null && nullToAbsent ? const Value.absent() : Value(adddAt),
      loginName: loginName == null && nullToAbsent
          ? const Value.absent()
          : Value(loginName),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      userAvatar: userAvatar == null && nullToAbsent
          ? const Value.absent()
          : Value(userAvatar),
      introduce: introduce == null && nullToAbsent
          ? const Value.absent()
          : Value(introduce),
      birthday: birthday == null && nullToAbsent
          ? const Value.absent()
          : Value(birthday),
      sex: sex == null && nullToAbsent ? const Value.absent() : Value(sex),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      otherCon: otherCon == null && nullToAbsent
          ? const Value.absent()
          : Value(otherCon),
      lastActivityAt: lastActivityAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastActivityAt),
      publicKey: publicKey == null && nullToAbsent
          ? const Value.absent()
          : Value(publicKey),
      isOnline: isOnline == null && nullToAbsent
          ? const Value.absent()
          : Value(isOnline),
    );
  }

  factory Contact.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Contact(
      myUid: serializer.fromJson<int>(json['myUid']),
      friendUid: serializer.fromJson<int>(json['friendUid']),
      adddAt: serializer.fromJson<String?>(json['adddAt']),
      loginName: serializer.fromJson<String?>(json['loginName']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      userAvatar: serializer.fromJson<String?>(json['userAvatar']),
      introduce: serializer.fromJson<String?>(json['introduce']),
      birthday: serializer.fromJson<String?>(json['birthday']),
      sex: serializer.fromJson<String?>(json['sex']),
      email: serializer.fromJson<String?>(json['email']),
      otherCon: serializer.fromJson<String?>(json['otherCon']),
      lastActivityAt: serializer.fromJson<String?>(json['lastActivityAt']),
      publicKey: serializer.fromJson<String?>(json['publicKey']),
      isOnline: serializer.fromJson<int?>(json['isOnline']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'myUid': serializer.toJson<int>(myUid),
      'friendUid': serializer.toJson<int>(friendUid),
      'adddAt': serializer.toJson<String?>(adddAt),
      'loginName': serializer.toJson<String?>(loginName),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'userAvatar': serializer.toJson<String?>(userAvatar),
      'introduce': serializer.toJson<String?>(introduce),
      'birthday': serializer.toJson<String?>(birthday),
      'sex': serializer.toJson<String?>(sex),
      'email': serializer.toJson<String?>(email),
      'otherCon': serializer.toJson<String?>(otherCon),
      'lastActivityAt': serializer.toJson<String?>(lastActivityAt),
      'publicKey': serializer.toJson<String?>(publicKey),
      'isOnline': serializer.toJson<int?>(isOnline),
    };
  }

  Contact copyWith(
          {int? myUid,
          int? friendUid,
          Value<String?> adddAt = const Value.absent(),
          Value<String?> loginName = const Value.absent(),
          Value<String?> firstName = const Value.absent(),
          Value<String?> lastName = const Value.absent(),
          Value<String?> userAvatar = const Value.absent(),
          Value<String?> introduce = const Value.absent(),
          Value<String?> birthday = const Value.absent(),
          Value<String?> sex = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> otherCon = const Value.absent(),
          Value<String?> lastActivityAt = const Value.absent(),
          Value<String?> publicKey = const Value.absent(),
          Value<int?> isOnline = const Value.absent()}) =>
      Contact(
        myUid: myUid ?? this.myUid,
        friendUid: friendUid ?? this.friendUid,
        adddAt: adddAt.present ? adddAt.value : this.adddAt,
        loginName: loginName.present ? loginName.value : this.loginName,
        firstName: firstName.present ? firstName.value : this.firstName,
        lastName: lastName.present ? lastName.value : this.lastName,
        userAvatar: userAvatar.present ? userAvatar.value : this.userAvatar,
        introduce: introduce.present ? introduce.value : this.introduce,
        birthday: birthday.present ? birthday.value : this.birthday,
        sex: sex.present ? sex.value : this.sex,
        email: email.present ? email.value : this.email,
        otherCon: otherCon.present ? otherCon.value : this.otherCon,
        lastActivityAt:
            lastActivityAt.present ? lastActivityAt.value : this.lastActivityAt,
        publicKey: publicKey.present ? publicKey.value : this.publicKey,
        isOnline: isOnline.present ? isOnline.value : this.isOnline,
      );
  Contact copyWithCompanion(ContactsCompanion data) {
    return Contact(
      myUid: data.myUid.present ? data.myUid.value : this.myUid,
      friendUid: data.friendUid.present ? data.friendUid.value : this.friendUid,
      adddAt: data.adddAt.present ? data.adddAt.value : this.adddAt,
      loginName: data.loginName.present ? data.loginName.value : this.loginName,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      userAvatar:
          data.userAvatar.present ? data.userAvatar.value : this.userAvatar,
      introduce: data.introduce.present ? data.introduce.value : this.introduce,
      birthday: data.birthday.present ? data.birthday.value : this.birthday,
      sex: data.sex.present ? data.sex.value : this.sex,
      email: data.email.present ? data.email.value : this.email,
      otherCon: data.otherCon.present ? data.otherCon.value : this.otherCon,
      lastActivityAt: data.lastActivityAt.present
          ? data.lastActivityAt.value
          : this.lastActivityAt,
      publicKey: data.publicKey.present ? data.publicKey.value : this.publicKey,
      isOnline: data.isOnline.present ? data.isOnline.value : this.isOnline,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Contact(')
          ..write('myUid: $myUid, ')
          ..write('friendUid: $friendUid, ')
          ..write('adddAt: $adddAt, ')
          ..write('loginName: $loginName, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('userAvatar: $userAvatar, ')
          ..write('introduce: $introduce, ')
          ..write('birthday: $birthday, ')
          ..write('sex: $sex, ')
          ..write('email: $email, ')
          ..write('otherCon: $otherCon, ')
          ..write('lastActivityAt: $lastActivityAt, ')
          ..write('publicKey: $publicKey, ')
          ..write('isOnline: $isOnline')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      myUid,
      friendUid,
      adddAt,
      loginName,
      firstName,
      lastName,
      userAvatar,
      introduce,
      birthday,
      sex,
      email,
      otherCon,
      lastActivityAt,
      publicKey,
      isOnline);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Contact &&
          other.myUid == this.myUid &&
          other.friendUid == this.friendUid &&
          other.adddAt == this.adddAt &&
          other.loginName == this.loginName &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.userAvatar == this.userAvatar &&
          other.introduce == this.introduce &&
          other.birthday == this.birthday &&
          other.sex == this.sex &&
          other.email == this.email &&
          other.otherCon == this.otherCon &&
          other.lastActivityAt == this.lastActivityAt &&
          other.publicKey == this.publicKey &&
          other.isOnline == this.isOnline);
}

class ContactsCompanion extends UpdateCompanion<Contact> {
  final Value<int> myUid;
  final Value<int> friendUid;
  final Value<String?> adddAt;
  final Value<String?> loginName;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> userAvatar;
  final Value<String?> introduce;
  final Value<String?> birthday;
  final Value<String?> sex;
  final Value<String?> email;
  final Value<String?> otherCon;
  final Value<String?> lastActivityAt;
  final Value<String?> publicKey;
  final Value<int?> isOnline;
  const ContactsCompanion({
    this.myUid = const Value.absent(),
    this.friendUid = const Value.absent(),
    this.adddAt = const Value.absent(),
    this.loginName = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.userAvatar = const Value.absent(),
    this.introduce = const Value.absent(),
    this.birthday = const Value.absent(),
    this.sex = const Value.absent(),
    this.email = const Value.absent(),
    this.otherCon = const Value.absent(),
    this.lastActivityAt = const Value.absent(),
    this.publicKey = const Value.absent(),
    this.isOnline = const Value.absent(),
  });
  ContactsCompanion.insert({
    required int myUid,
    this.friendUid = const Value.absent(),
    this.adddAt = const Value.absent(),
    this.loginName = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.userAvatar = const Value.absent(),
    this.introduce = const Value.absent(),
    this.birthday = const Value.absent(),
    this.sex = const Value.absent(),
    this.email = const Value.absent(),
    this.otherCon = const Value.absent(),
    this.lastActivityAt = const Value.absent(),
    this.publicKey = const Value.absent(),
    this.isOnline = const Value.absent(),
  }) : myUid = Value(myUid);
  static Insertable<Contact> custom({
    Expression<int>? myUid,
    Expression<int>? friendUid,
    Expression<String>? adddAt,
    Expression<String>? loginName,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? userAvatar,
    Expression<String>? introduce,
    Expression<String>? birthday,
    Expression<String>? sex,
    Expression<String>? email,
    Expression<String>? otherCon,
    Expression<String>? lastActivityAt,
    Expression<String>? publicKey,
    Expression<int>? isOnline,
  }) {
    return RawValuesInsertable({
      if (myUid != null) 'my_uid': myUid,
      if (friendUid != null) 'friend_uid': friendUid,
      if (adddAt != null) 'addd_at': adddAt,
      if (loginName != null) 'login_name': loginName,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (userAvatar != null) 'user_avatar': userAvatar,
      if (introduce != null) 'introduce': introduce,
      if (birthday != null) 'birthday': birthday,
      if (sex != null) 'sex': sex,
      if (email != null) 'email': email,
      if (otherCon != null) 'other_con': otherCon,
      if (lastActivityAt != null) 'last_activity_at': lastActivityAt,
      if (publicKey != null) 'public_key': publicKey,
      if (isOnline != null) 'is_online': isOnline,
    });
  }

  ContactsCompanion copyWith(
      {Value<int>? myUid,
      Value<int>? friendUid,
      Value<String?>? adddAt,
      Value<String?>? loginName,
      Value<String?>? firstName,
      Value<String?>? lastName,
      Value<String?>? userAvatar,
      Value<String?>? introduce,
      Value<String?>? birthday,
      Value<String?>? sex,
      Value<String?>? email,
      Value<String?>? otherCon,
      Value<String?>? lastActivityAt,
      Value<String?>? publicKey,
      Value<int?>? isOnline}) {
    return ContactsCompanion(
      myUid: myUid ?? this.myUid,
      friendUid: friendUid ?? this.friendUid,
      adddAt: adddAt ?? this.adddAt,
      loginName: loginName ?? this.loginName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userAvatar: userAvatar ?? this.userAvatar,
      introduce: introduce ?? this.introduce,
      birthday: birthday ?? this.birthday,
      sex: sex ?? this.sex,
      email: email ?? this.email,
      otherCon: otherCon ?? this.otherCon,
      lastActivityAt: lastActivityAt ?? this.lastActivityAt,
      publicKey: publicKey ?? this.publicKey,
      isOnline: isOnline ?? this.isOnline,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (myUid.present) {
      map['my_uid'] = Variable<int>(myUid.value);
    }
    if (friendUid.present) {
      map['friend_uid'] = Variable<int>(friendUid.value);
    }
    if (adddAt.present) {
      map['addd_at'] = Variable<String>(adddAt.value);
    }
    if (loginName.present) {
      map['login_name'] = Variable<String>(loginName.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (userAvatar.present) {
      map['user_avatar'] = Variable<String>(userAvatar.value);
    }
    if (introduce.present) {
      map['introduce'] = Variable<String>(introduce.value);
    }
    if (birthday.present) {
      map['birthday'] = Variable<String>(birthday.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (otherCon.present) {
      map['other_con'] = Variable<String>(otherCon.value);
    }
    if (lastActivityAt.present) {
      map['last_activity_at'] = Variable<String>(lastActivityAt.value);
    }
    if (publicKey.present) {
      map['public_key'] = Variable<String>(publicKey.value);
    }
    if (isOnline.present) {
      map['is_online'] = Variable<int>(isOnline.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactsCompanion(')
          ..write('myUid: $myUid, ')
          ..write('friendUid: $friendUid, ')
          ..write('adddAt: $adddAt, ')
          ..write('loginName: $loginName, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('userAvatar: $userAvatar, ')
          ..write('introduce: $introduce, ')
          ..write('birthday: $birthday, ')
          ..write('sex: $sex, ')
          ..write('email: $email, ')
          ..write('otherCon: $otherCon, ')
          ..write('lastActivityAt: $lastActivityAt, ')
          ..write('publicKey: $publicKey, ')
          ..write('isOnline: $isOnline')
          ..write(')'))
        .toString();
  }
}

class $GroupsTable extends Groups with TableInfo<$GroupsTable, Group> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<String> groupId = GeneratedColumn<String>(
      'group_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _groupNameMeta =
      const VerificationMeta('groupName');
  @override
  late final GeneratedColumn<String> groupName = GeneratedColumn<String>(
      'group_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _adminIdMeta =
      const VerificationMeta('adminId');
  @override
  late final GeneratedColumn<String> adminId = GeneratedColumn<String>(
      'admin_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _memberIdsMeta =
      const VerificationMeta('memberIds');
  @override
  late final GeneratedColumn<String> memberIds = GeneratedColumn<String>(
      'member_ids', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _groupAvatarMeta =
      const VerificationMeta('groupAvatar');
  @override
  late final GeneratedColumn<String> groupAvatar = GeneratedColumn<String>(
      'group_avatar', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _memberCountMeta =
      const VerificationMeta('memberCount');
  @override
  late final GeneratedColumn<int> memberCount = GeneratedColumn<int>(
      'member_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        groupId,
        groupName,
        adminId,
        createdAt,
        memberIds,
        groupAvatar,
        description,
        memberCount,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'groups';
  @override
  VerificationContext validateIntegrity(Insertable<Group> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('group_name')) {
      context.handle(_groupNameMeta,
          groupName.isAcceptableOrUnknown(data['group_name']!, _groupNameMeta));
    } else if (isInserting) {
      context.missing(_groupNameMeta);
    }
    if (data.containsKey('admin_id')) {
      context.handle(_adminIdMeta,
          adminId.isAcceptableOrUnknown(data['admin_id']!, _adminIdMeta));
    } else if (isInserting) {
      context.missing(_adminIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('member_ids')) {
      context.handle(_memberIdsMeta,
          memberIds.isAcceptableOrUnknown(data['member_ids']!, _memberIdsMeta));
    } else if (isInserting) {
      context.missing(_memberIdsMeta);
    }
    if (data.containsKey('group_avatar')) {
      context.handle(
          _groupAvatarMeta,
          groupAvatar.isAcceptableOrUnknown(
              data['group_avatar']!, _groupAvatarMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('member_count')) {
      context.handle(
          _memberCountMeta,
          memberCount.isAcceptableOrUnknown(
              data['member_count']!, _memberCountMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {groupId};
  @override
  Group map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Group(
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_id'])!,
      groupName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_name'])!,
      adminId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}admin_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      memberIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}member_ids'])!,
      groupAvatar: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_avatar']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      memberCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}member_count'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $GroupsTable createAlias(String alias) {
    return $GroupsTable(attachedDatabase, alias);
  }
}

class Group extends DataClass implements Insertable<Group> {
  final String groupId;
  final String groupName;
  final String adminId;
  final String createdAt;
  final String memberIds;
  final String? groupAvatar;
  final String? description;
  final int memberCount;
  final String updatedAt;
  const Group(
      {required this.groupId,
      required this.groupName,
      required this.adminId,
      required this.createdAt,
      required this.memberIds,
      this.groupAvatar,
      this.description,
      required this.memberCount,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['group_id'] = Variable<String>(groupId);
    map['group_name'] = Variable<String>(groupName);
    map['admin_id'] = Variable<String>(adminId);
    map['created_at'] = Variable<String>(createdAt);
    map['member_ids'] = Variable<String>(memberIds);
    if (!nullToAbsent || groupAvatar != null) {
      map['group_avatar'] = Variable<String>(groupAvatar);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['member_count'] = Variable<int>(memberCount);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  GroupsCompanion toCompanion(bool nullToAbsent) {
    return GroupsCompanion(
      groupId: Value(groupId),
      groupName: Value(groupName),
      adminId: Value(adminId),
      createdAt: Value(createdAt),
      memberIds: Value(memberIds),
      groupAvatar: groupAvatar == null && nullToAbsent
          ? const Value.absent()
          : Value(groupAvatar),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      memberCount: Value(memberCount),
      updatedAt: Value(updatedAt),
    );
  }

  factory Group.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Group(
      groupId: serializer.fromJson<String>(json['groupId']),
      groupName: serializer.fromJson<String>(json['groupName']),
      adminId: serializer.fromJson<String>(json['adminId']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      memberIds: serializer.fromJson<String>(json['memberIds']),
      groupAvatar: serializer.fromJson<String?>(json['groupAvatar']),
      description: serializer.fromJson<String?>(json['description']),
      memberCount: serializer.fromJson<int>(json['memberCount']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'groupId': serializer.toJson<String>(groupId),
      'groupName': serializer.toJson<String>(groupName),
      'adminId': serializer.toJson<String>(adminId),
      'createdAt': serializer.toJson<String>(createdAt),
      'memberIds': serializer.toJson<String>(memberIds),
      'groupAvatar': serializer.toJson<String?>(groupAvatar),
      'description': serializer.toJson<String?>(description),
      'memberCount': serializer.toJson<int>(memberCount),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  Group copyWith(
          {String? groupId,
          String? groupName,
          String? adminId,
          String? createdAt,
          String? memberIds,
          Value<String?> groupAvatar = const Value.absent(),
          Value<String?> description = const Value.absent(),
          int? memberCount,
          String? updatedAt}) =>
      Group(
        groupId: groupId ?? this.groupId,
        groupName: groupName ?? this.groupName,
        adminId: adminId ?? this.adminId,
        createdAt: createdAt ?? this.createdAt,
        memberIds: memberIds ?? this.memberIds,
        groupAvatar: groupAvatar.present ? groupAvatar.value : this.groupAvatar,
        description: description.present ? description.value : this.description,
        memberCount: memberCount ?? this.memberCount,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Group copyWithCompanion(GroupsCompanion data) {
    return Group(
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
      groupName: data.groupName.present ? data.groupName.value : this.groupName,
      adminId: data.adminId.present ? data.adminId.value : this.adminId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      memberIds: data.memberIds.present ? data.memberIds.value : this.memberIds,
      groupAvatar:
          data.groupAvatar.present ? data.groupAvatar.value : this.groupAvatar,
      description:
          data.description.present ? data.description.value : this.description,
      memberCount:
          data.memberCount.present ? data.memberCount.value : this.memberCount,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Group(')
          ..write('groupId: $groupId, ')
          ..write('groupName: $groupName, ')
          ..write('adminId: $adminId, ')
          ..write('createdAt: $createdAt, ')
          ..write('memberIds: $memberIds, ')
          ..write('groupAvatar: $groupAvatar, ')
          ..write('description: $description, ')
          ..write('memberCount: $memberCount, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(groupId, groupName, adminId, createdAt,
      memberIds, groupAvatar, description, memberCount, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Group &&
          other.groupId == this.groupId &&
          other.groupName == this.groupName &&
          other.adminId == this.adminId &&
          other.createdAt == this.createdAt &&
          other.memberIds == this.memberIds &&
          other.groupAvatar == this.groupAvatar &&
          other.description == this.description &&
          other.memberCount == this.memberCount &&
          other.updatedAt == this.updatedAt);
}

class GroupsCompanion extends UpdateCompanion<Group> {
  final Value<String> groupId;
  final Value<String> groupName;
  final Value<String> adminId;
  final Value<String> createdAt;
  final Value<String> memberIds;
  final Value<String?> groupAvatar;
  final Value<String?> description;
  final Value<int> memberCount;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const GroupsCompanion({
    this.groupId = const Value.absent(),
    this.groupName = const Value.absent(),
    this.adminId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.memberIds = const Value.absent(),
    this.groupAvatar = const Value.absent(),
    this.description = const Value.absent(),
    this.memberCount = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroupsCompanion.insert({
    required String groupId,
    required String groupName,
    required String adminId,
    required String createdAt,
    required String memberIds,
    this.groupAvatar = const Value.absent(),
    this.description = const Value.absent(),
    this.memberCount = const Value.absent(),
    required String updatedAt,
    this.rowid = const Value.absent(),
  })  : groupId = Value(groupId),
        groupName = Value(groupName),
        adminId = Value(adminId),
        createdAt = Value(createdAt),
        memberIds = Value(memberIds),
        updatedAt = Value(updatedAt);
  static Insertable<Group> custom({
    Expression<String>? groupId,
    Expression<String>? groupName,
    Expression<String>? adminId,
    Expression<String>? createdAt,
    Expression<String>? memberIds,
    Expression<String>? groupAvatar,
    Expression<String>? description,
    Expression<int>? memberCount,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (groupId != null) 'group_id': groupId,
      if (groupName != null) 'group_name': groupName,
      if (adminId != null) 'admin_id': adminId,
      if (createdAt != null) 'created_at': createdAt,
      if (memberIds != null) 'member_ids': memberIds,
      if (groupAvatar != null) 'group_avatar': groupAvatar,
      if (description != null) 'description': description,
      if (memberCount != null) 'member_count': memberCount,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroupsCompanion copyWith(
      {Value<String>? groupId,
      Value<String>? groupName,
      Value<String>? adminId,
      Value<String>? createdAt,
      Value<String>? memberIds,
      Value<String?>? groupAvatar,
      Value<String?>? description,
      Value<int>? memberCount,
      Value<String>? updatedAt,
      Value<int>? rowid}) {
    return GroupsCompanion(
      groupId: groupId ?? this.groupId,
      groupName: groupName ?? this.groupName,
      adminId: adminId ?? this.adminId,
      createdAt: createdAt ?? this.createdAt,
      memberIds: memberIds ?? this.memberIds,
      groupAvatar: groupAvatar ?? this.groupAvatar,
      description: description ?? this.description,
      memberCount: memberCount ?? this.memberCount,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (groupId.present) {
      map['group_id'] = Variable<String>(groupId.value);
    }
    if (groupName.present) {
      map['group_name'] = Variable<String>(groupName.value);
    }
    if (adminId.present) {
      map['admin_id'] = Variable<String>(adminId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (memberIds.present) {
      map['member_ids'] = Variable<String>(memberIds.value);
    }
    if (groupAvatar.present) {
      map['group_avatar'] = Variable<String>(groupAvatar.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (memberCount.present) {
      map['member_count'] = Variable<int>(memberCount.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupsCompanion(')
          ..write('groupId: $groupId, ')
          ..write('groupName: $groupName, ')
          ..write('adminId: $adminId, ')
          ..write('createdAt: $createdAt, ')
          ..write('memberIds: $memberIds, ')
          ..write('groupAvatar: $groupAvatar, ')
          ..write('description: $description, ')
          ..write('memberCount: $memberCount, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MessagesTable messages = $MessagesTable(this);
  late final $ContactsTable contacts = $ContactsTable(this);
  late final $GroupsTable groups = $GroupsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [messages, contacts, groups];
}

typedef $$MessagesTableCreateCompanionBuilder = MessagesCompanion Function({
  required String id,
  required String body,
  required int isMe,
  required String timestamp,
  Value<int> isEdited,
  Value<String?> editTime,
  Value<int> isFavorite,
  Value<int> isForwarded,
  Value<String?> forwardedFrom,
  Value<String?> replyToId,
  Value<int> messageType,
  Value<String?> mediaUrls,
  Value<String?> filePath,
  Value<String?> fileName,
  Value<String?> fileSize,
  Value<String?> location,
  Value<String?> locationName,
  Value<int> status,
  Value<double?> sendProgress,
  Value<String?> imageSizes,
  Value<String?> audioUrl,
  Value<int?> audioDuration,
  Value<int?> videoDuration,
  Value<double?> videoAspectRatio,
  Value<double?> videoBubbleWidth,
  Value<double?> videoBubbleHeight,
  Value<int> isGroup,
  Value<String?> senderUid,
  Value<String?> senderName,
  Value<String?> senderAvatar,
  Value<String?> mentions,
  Value<int> isSended,
  required String chatId,
  required String createdAt,
  required String updatedAt,
  Value<int> isSystemMessage,
  Value<String?> systemData,
  Value<String?> replyToJson,
  Value<String?> bubbleEmoji,
  Value<int?> callDuration,
  Value<String?> callResult,
  Value<String?> callType,
  Value<String?> thumbnailPath,
  Value<int> rowid,
});
typedef $$MessagesTableUpdateCompanionBuilder = MessagesCompanion Function({
  Value<String> id,
  Value<String> body,
  Value<int> isMe,
  Value<String> timestamp,
  Value<int> isEdited,
  Value<String?> editTime,
  Value<int> isFavorite,
  Value<int> isForwarded,
  Value<String?> forwardedFrom,
  Value<String?> replyToId,
  Value<int> messageType,
  Value<String?> mediaUrls,
  Value<String?> filePath,
  Value<String?> fileName,
  Value<String?> fileSize,
  Value<String?> location,
  Value<String?> locationName,
  Value<int> status,
  Value<double?> sendProgress,
  Value<String?> imageSizes,
  Value<String?> audioUrl,
  Value<int?> audioDuration,
  Value<int?> videoDuration,
  Value<double?> videoAspectRatio,
  Value<double?> videoBubbleWidth,
  Value<double?> videoBubbleHeight,
  Value<int> isGroup,
  Value<String?> senderUid,
  Value<String?> senderName,
  Value<String?> senderAvatar,
  Value<String?> mentions,
  Value<int> isSended,
  Value<String> chatId,
  Value<String> createdAt,
  Value<String> updatedAt,
  Value<int> isSystemMessage,
  Value<String?> systemData,
  Value<String?> replyToJson,
  Value<String?> bubbleEmoji,
  Value<int?> callDuration,
  Value<String?> callResult,
  Value<String?> callType,
  Value<String?> thumbnailPath,
  Value<int> rowid,
});

class $$MessagesTableFilterComposer
    extends Composer<_$AppDatabase, $MessagesTable> {
  $$MessagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get isMe => $composableBuilder(
      column: $table.isMe, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get isEdited => $composableBuilder(
      column: $table.isEdited, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get editTime => $composableBuilder(
      column: $table.editTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get isFavorite => $composableBuilder(
      column: $table.isFavorite, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get isForwarded => $composableBuilder(
      column: $table.isForwarded, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get forwardedFrom => $composableBuilder(
      column: $table.forwardedFrom, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get replyToId => $composableBuilder(
      column: $table.replyToId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get messageType => $composableBuilder(
      column: $table.messageType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediaUrls => $composableBuilder(
      column: $table.mediaUrls, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fileName => $composableBuilder(
      column: $table.fileName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fileSize => $composableBuilder(
      column: $table.fileSize, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get locationName => $composableBuilder(
      column: $table.locationName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sendProgress => $composableBuilder(
      column: $table.sendProgress, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageSizes => $composableBuilder(
      column: $table.imageSizes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get audioUrl => $composableBuilder(
      column: $table.audioUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get audioDuration => $composableBuilder(
      column: $table.audioDuration, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get videoDuration => $composableBuilder(
      column: $table.videoDuration, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get videoAspectRatio => $composableBuilder(
      column: $table.videoAspectRatio,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get videoBubbleWidth => $composableBuilder(
      column: $table.videoBubbleWidth,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get videoBubbleHeight => $composableBuilder(
      column: $table.videoBubbleHeight,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get isGroup => $composableBuilder(
      column: $table.isGroup, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get senderUid => $composableBuilder(
      column: $table.senderUid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get senderName => $composableBuilder(
      column: $table.senderName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get senderAvatar => $composableBuilder(
      column: $table.senderAvatar, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mentions => $composableBuilder(
      column: $table.mentions, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get isSended => $composableBuilder(
      column: $table.isSended, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get chatId => $composableBuilder(
      column: $table.chatId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get isSystemMessage => $composableBuilder(
      column: $table.isSystemMessage,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get systemData => $composableBuilder(
      column: $table.systemData, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get replyToJson => $composableBuilder(
      column: $table.replyToJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bubbleEmoji => $composableBuilder(
      column: $table.bubbleEmoji, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get callDuration => $composableBuilder(
      column: $table.callDuration, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get callResult => $composableBuilder(
      column: $table.callResult, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get callType => $composableBuilder(
      column: $table.callType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get thumbnailPath => $composableBuilder(
      column: $table.thumbnailPath, builder: (column) => ColumnFilters(column));
}

class $$MessagesTableOrderingComposer
    extends Composer<_$AppDatabase, $MessagesTable> {
  $$MessagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get body => $composableBuilder(
      column: $table.body, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get isMe => $composableBuilder(
      column: $table.isMe, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get isEdited => $composableBuilder(
      column: $table.isEdited, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get editTime => $composableBuilder(
      column: $table.editTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get isFavorite => $composableBuilder(
      column: $table.isFavorite, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get isForwarded => $composableBuilder(
      column: $table.isForwarded, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get forwardedFrom => $composableBuilder(
      column: $table.forwardedFrom,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get replyToId => $composableBuilder(
      column: $table.replyToId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get messageType => $composableBuilder(
      column: $table.messageType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaUrls => $composableBuilder(
      column: $table.mediaUrls, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fileName => $composableBuilder(
      column: $table.fileName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fileSize => $composableBuilder(
      column: $table.fileSize, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get locationName => $composableBuilder(
      column: $table.locationName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sendProgress => $composableBuilder(
      column: $table.sendProgress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageSizes => $composableBuilder(
      column: $table.imageSizes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get audioUrl => $composableBuilder(
      column: $table.audioUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get audioDuration => $composableBuilder(
      column: $table.audioDuration,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get videoDuration => $composableBuilder(
      column: $table.videoDuration,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get videoAspectRatio => $composableBuilder(
      column: $table.videoAspectRatio,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get videoBubbleWidth => $composableBuilder(
      column: $table.videoBubbleWidth,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get videoBubbleHeight => $composableBuilder(
      column: $table.videoBubbleHeight,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get isGroup => $composableBuilder(
      column: $table.isGroup, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get senderUid => $composableBuilder(
      column: $table.senderUid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get senderName => $composableBuilder(
      column: $table.senderName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get senderAvatar => $composableBuilder(
      column: $table.senderAvatar,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mentions => $composableBuilder(
      column: $table.mentions, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get isSended => $composableBuilder(
      column: $table.isSended, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get chatId => $composableBuilder(
      column: $table.chatId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get isSystemMessage => $composableBuilder(
      column: $table.isSystemMessage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get systemData => $composableBuilder(
      column: $table.systemData, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get replyToJson => $composableBuilder(
      column: $table.replyToJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bubbleEmoji => $composableBuilder(
      column: $table.bubbleEmoji, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get callDuration => $composableBuilder(
      column: $table.callDuration,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get callResult => $composableBuilder(
      column: $table.callResult, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get callType => $composableBuilder(
      column: $table.callType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get thumbnailPath => $composableBuilder(
      column: $table.thumbnailPath,
      builder: (column) => ColumnOrderings(column));
}

class $$MessagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MessagesTable> {
  $$MessagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<int> get isMe =>
      $composableBuilder(column: $table.isMe, builder: (column) => column);

  GeneratedColumn<String> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<int> get isEdited =>
      $composableBuilder(column: $table.isEdited, builder: (column) => column);

  GeneratedColumn<String> get editTime =>
      $composableBuilder(column: $table.editTime, builder: (column) => column);

  GeneratedColumn<int> get isFavorite => $composableBuilder(
      column: $table.isFavorite, builder: (column) => column);

  GeneratedColumn<int> get isForwarded => $composableBuilder(
      column: $table.isForwarded, builder: (column) => column);

  GeneratedColumn<String> get forwardedFrom => $composableBuilder(
      column: $table.forwardedFrom, builder: (column) => column);

  GeneratedColumn<String> get replyToId =>
      $composableBuilder(column: $table.replyToId, builder: (column) => column);

  GeneratedColumn<int> get messageType => $composableBuilder(
      column: $table.messageType, builder: (column) => column);

  GeneratedColumn<String> get mediaUrls =>
      $composableBuilder(column: $table.mediaUrls, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<String> get fileSize =>
      $composableBuilder(column: $table.fileSize, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get locationName => $composableBuilder(
      column: $table.locationName, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get sendProgress => $composableBuilder(
      column: $table.sendProgress, builder: (column) => column);

  GeneratedColumn<String> get imageSizes => $composableBuilder(
      column: $table.imageSizes, builder: (column) => column);

  GeneratedColumn<String> get audioUrl =>
      $composableBuilder(column: $table.audioUrl, builder: (column) => column);

  GeneratedColumn<int> get audioDuration => $composableBuilder(
      column: $table.audioDuration, builder: (column) => column);

  GeneratedColumn<int> get videoDuration => $composableBuilder(
      column: $table.videoDuration, builder: (column) => column);

  GeneratedColumn<double> get videoAspectRatio => $composableBuilder(
      column: $table.videoAspectRatio, builder: (column) => column);

  GeneratedColumn<double> get videoBubbleWidth => $composableBuilder(
      column: $table.videoBubbleWidth, builder: (column) => column);

  GeneratedColumn<double> get videoBubbleHeight => $composableBuilder(
      column: $table.videoBubbleHeight, builder: (column) => column);

  GeneratedColumn<int> get isGroup =>
      $composableBuilder(column: $table.isGroup, builder: (column) => column);

  GeneratedColumn<String> get senderUid =>
      $composableBuilder(column: $table.senderUid, builder: (column) => column);

  GeneratedColumn<String> get senderName => $composableBuilder(
      column: $table.senderName, builder: (column) => column);

  GeneratedColumn<String> get senderAvatar => $composableBuilder(
      column: $table.senderAvatar, builder: (column) => column);

  GeneratedColumn<String> get mentions =>
      $composableBuilder(column: $table.mentions, builder: (column) => column);

  GeneratedColumn<int> get isSended =>
      $composableBuilder(column: $table.isSended, builder: (column) => column);

  GeneratedColumn<String> get chatId =>
      $composableBuilder(column: $table.chatId, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get isSystemMessage => $composableBuilder(
      column: $table.isSystemMessage, builder: (column) => column);

  GeneratedColumn<String> get systemData => $composableBuilder(
      column: $table.systemData, builder: (column) => column);

  GeneratedColumn<String> get replyToJson => $composableBuilder(
      column: $table.replyToJson, builder: (column) => column);

  GeneratedColumn<String> get bubbleEmoji => $composableBuilder(
      column: $table.bubbleEmoji, builder: (column) => column);

  GeneratedColumn<int> get callDuration => $composableBuilder(
      column: $table.callDuration, builder: (column) => column);

  GeneratedColumn<String> get callResult => $composableBuilder(
      column: $table.callResult, builder: (column) => column);

  GeneratedColumn<String> get callType =>
      $composableBuilder(column: $table.callType, builder: (column) => column);

  GeneratedColumn<String> get thumbnailPath => $composableBuilder(
      column: $table.thumbnailPath, builder: (column) => column);
}

class $$MessagesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MessagesTable,
    Message,
    $$MessagesTableFilterComposer,
    $$MessagesTableOrderingComposer,
    $$MessagesTableAnnotationComposer,
    $$MessagesTableCreateCompanionBuilder,
    $$MessagesTableUpdateCompanionBuilder,
    (Message, BaseReferences<_$AppDatabase, $MessagesTable, Message>),
    Message,
    PrefetchHooks Function()> {
  $$MessagesTableTableManager(_$AppDatabase db, $MessagesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MessagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MessagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MessagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> body = const Value.absent(),
            Value<int> isMe = const Value.absent(),
            Value<String> timestamp = const Value.absent(),
            Value<int> isEdited = const Value.absent(),
            Value<String?> editTime = const Value.absent(),
            Value<int> isFavorite = const Value.absent(),
            Value<int> isForwarded = const Value.absent(),
            Value<String?> forwardedFrom = const Value.absent(),
            Value<String?> replyToId = const Value.absent(),
            Value<int> messageType = const Value.absent(),
            Value<String?> mediaUrls = const Value.absent(),
            Value<String?> filePath = const Value.absent(),
            Value<String?> fileName = const Value.absent(),
            Value<String?> fileSize = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String?> locationName = const Value.absent(),
            Value<int> status = const Value.absent(),
            Value<double?> sendProgress = const Value.absent(),
            Value<String?> imageSizes = const Value.absent(),
            Value<String?> audioUrl = const Value.absent(),
            Value<int?> audioDuration = const Value.absent(),
            Value<int?> videoDuration = const Value.absent(),
            Value<double?> videoAspectRatio = const Value.absent(),
            Value<double?> videoBubbleWidth = const Value.absent(),
            Value<double?> videoBubbleHeight = const Value.absent(),
            Value<int> isGroup = const Value.absent(),
            Value<String?> senderUid = const Value.absent(),
            Value<String?> senderName = const Value.absent(),
            Value<String?> senderAvatar = const Value.absent(),
            Value<String?> mentions = const Value.absent(),
            Value<int> isSended = const Value.absent(),
            Value<String> chatId = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<int> isSystemMessage = const Value.absent(),
            Value<String?> systemData = const Value.absent(),
            Value<String?> replyToJson = const Value.absent(),
            Value<String?> bubbleEmoji = const Value.absent(),
            Value<int?> callDuration = const Value.absent(),
            Value<String?> callResult = const Value.absent(),
            Value<String?> callType = const Value.absent(),
            Value<String?> thumbnailPath = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MessagesCompanion(
            id: id,
            body: body,
            isMe: isMe,
            timestamp: timestamp,
            isEdited: isEdited,
            editTime: editTime,
            isFavorite: isFavorite,
            isForwarded: isForwarded,
            forwardedFrom: forwardedFrom,
            replyToId: replyToId,
            messageType: messageType,
            mediaUrls: mediaUrls,
            filePath: filePath,
            fileName: fileName,
            fileSize: fileSize,
            location: location,
            locationName: locationName,
            status: status,
            sendProgress: sendProgress,
            imageSizes: imageSizes,
            audioUrl: audioUrl,
            audioDuration: audioDuration,
            videoDuration: videoDuration,
            videoAspectRatio: videoAspectRatio,
            videoBubbleWidth: videoBubbleWidth,
            videoBubbleHeight: videoBubbleHeight,
            isGroup: isGroup,
            senderUid: senderUid,
            senderName: senderName,
            senderAvatar: senderAvatar,
            mentions: mentions,
            isSended: isSended,
            chatId: chatId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isSystemMessage: isSystemMessage,
            systemData: systemData,
            replyToJson: replyToJson,
            bubbleEmoji: bubbleEmoji,
            callDuration: callDuration,
            callResult: callResult,
            callType: callType,
            thumbnailPath: thumbnailPath,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String body,
            required int isMe,
            required String timestamp,
            Value<int> isEdited = const Value.absent(),
            Value<String?> editTime = const Value.absent(),
            Value<int> isFavorite = const Value.absent(),
            Value<int> isForwarded = const Value.absent(),
            Value<String?> forwardedFrom = const Value.absent(),
            Value<String?> replyToId = const Value.absent(),
            Value<int> messageType = const Value.absent(),
            Value<String?> mediaUrls = const Value.absent(),
            Value<String?> filePath = const Value.absent(),
            Value<String?> fileName = const Value.absent(),
            Value<String?> fileSize = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String?> locationName = const Value.absent(),
            Value<int> status = const Value.absent(),
            Value<double?> sendProgress = const Value.absent(),
            Value<String?> imageSizes = const Value.absent(),
            Value<String?> audioUrl = const Value.absent(),
            Value<int?> audioDuration = const Value.absent(),
            Value<int?> videoDuration = const Value.absent(),
            Value<double?> videoAspectRatio = const Value.absent(),
            Value<double?> videoBubbleWidth = const Value.absent(),
            Value<double?> videoBubbleHeight = const Value.absent(),
            Value<int> isGroup = const Value.absent(),
            Value<String?> senderUid = const Value.absent(),
            Value<String?> senderName = const Value.absent(),
            Value<String?> senderAvatar = const Value.absent(),
            Value<String?> mentions = const Value.absent(),
            Value<int> isSended = const Value.absent(),
            required String chatId,
            required String createdAt,
            required String updatedAt,
            Value<int> isSystemMessage = const Value.absent(),
            Value<String?> systemData = const Value.absent(),
            Value<String?> replyToJson = const Value.absent(),
            Value<String?> bubbleEmoji = const Value.absent(),
            Value<int?> callDuration = const Value.absent(),
            Value<String?> callResult = const Value.absent(),
            Value<String?> callType = const Value.absent(),
            Value<String?> thumbnailPath = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MessagesCompanion.insert(
            id: id,
            body: body,
            isMe: isMe,
            timestamp: timestamp,
            isEdited: isEdited,
            editTime: editTime,
            isFavorite: isFavorite,
            isForwarded: isForwarded,
            forwardedFrom: forwardedFrom,
            replyToId: replyToId,
            messageType: messageType,
            mediaUrls: mediaUrls,
            filePath: filePath,
            fileName: fileName,
            fileSize: fileSize,
            location: location,
            locationName: locationName,
            status: status,
            sendProgress: sendProgress,
            imageSizes: imageSizes,
            audioUrl: audioUrl,
            audioDuration: audioDuration,
            videoDuration: videoDuration,
            videoAspectRatio: videoAspectRatio,
            videoBubbleWidth: videoBubbleWidth,
            videoBubbleHeight: videoBubbleHeight,
            isGroup: isGroup,
            senderUid: senderUid,
            senderName: senderName,
            senderAvatar: senderAvatar,
            mentions: mentions,
            isSended: isSended,
            chatId: chatId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isSystemMessage: isSystemMessage,
            systemData: systemData,
            replyToJson: replyToJson,
            bubbleEmoji: bubbleEmoji,
            callDuration: callDuration,
            callResult: callResult,
            callType: callType,
            thumbnailPath: thumbnailPath,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MessagesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MessagesTable,
    Message,
    $$MessagesTableFilterComposer,
    $$MessagesTableOrderingComposer,
    $$MessagesTableAnnotationComposer,
    $$MessagesTableCreateCompanionBuilder,
    $$MessagesTableUpdateCompanionBuilder,
    (Message, BaseReferences<_$AppDatabase, $MessagesTable, Message>),
    Message,
    PrefetchHooks Function()>;
typedef $$ContactsTableCreateCompanionBuilder = ContactsCompanion Function({
  required int myUid,
  Value<int> friendUid,
  Value<String?> adddAt,
  Value<String?> loginName,
  Value<String?> firstName,
  Value<String?> lastName,
  Value<String?> userAvatar,
  Value<String?> introduce,
  Value<String?> birthday,
  Value<String?> sex,
  Value<String?> email,
  Value<String?> otherCon,
  Value<String?> lastActivityAt,
  Value<String?> publicKey,
  Value<int?> isOnline,
});
typedef $$ContactsTableUpdateCompanionBuilder = ContactsCompanion Function({
  Value<int> myUid,
  Value<int> friendUid,
  Value<String?> adddAt,
  Value<String?> loginName,
  Value<String?> firstName,
  Value<String?> lastName,
  Value<String?> userAvatar,
  Value<String?> introduce,
  Value<String?> birthday,
  Value<String?> sex,
  Value<String?> email,
  Value<String?> otherCon,
  Value<String?> lastActivityAt,
  Value<String?> publicKey,
  Value<int?> isOnline,
});

class $$ContactsTableFilterComposer
    extends Composer<_$AppDatabase, $ContactsTable> {
  $$ContactsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get myUid => $composableBuilder(
      column: $table.myUid, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get friendUid => $composableBuilder(
      column: $table.friendUid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get adddAt => $composableBuilder(
      column: $table.adddAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get loginName => $composableBuilder(
      column: $table.loginName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userAvatar => $composableBuilder(
      column: $table.userAvatar, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get introduce => $composableBuilder(
      column: $table.introduce, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get birthday => $composableBuilder(
      column: $table.birthday, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sex => $composableBuilder(
      column: $table.sex, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get otherCon => $composableBuilder(
      column: $table.otherCon, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastActivityAt => $composableBuilder(
      column: $table.lastActivityAt,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get publicKey => $composableBuilder(
      column: $table.publicKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get isOnline => $composableBuilder(
      column: $table.isOnline, builder: (column) => ColumnFilters(column));
}

class $$ContactsTableOrderingComposer
    extends Composer<_$AppDatabase, $ContactsTable> {
  $$ContactsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get myUid => $composableBuilder(
      column: $table.myUid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get friendUid => $composableBuilder(
      column: $table.friendUid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get adddAt => $composableBuilder(
      column: $table.adddAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get loginName => $composableBuilder(
      column: $table.loginName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userAvatar => $composableBuilder(
      column: $table.userAvatar, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get introduce => $composableBuilder(
      column: $table.introduce, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get birthday => $composableBuilder(
      column: $table.birthday, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sex => $composableBuilder(
      column: $table.sex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get otherCon => $composableBuilder(
      column: $table.otherCon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastActivityAt => $composableBuilder(
      column: $table.lastActivityAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get publicKey => $composableBuilder(
      column: $table.publicKey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get isOnline => $composableBuilder(
      column: $table.isOnline, builder: (column) => ColumnOrderings(column));
}

class $$ContactsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContactsTable> {
  $$ContactsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get myUid =>
      $composableBuilder(column: $table.myUid, builder: (column) => column);

  GeneratedColumn<int> get friendUid =>
      $composableBuilder(column: $table.friendUid, builder: (column) => column);

  GeneratedColumn<String> get adddAt =>
      $composableBuilder(column: $table.adddAt, builder: (column) => column);

  GeneratedColumn<String> get loginName =>
      $composableBuilder(column: $table.loginName, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get userAvatar => $composableBuilder(
      column: $table.userAvatar, builder: (column) => column);

  GeneratedColumn<String> get introduce =>
      $composableBuilder(column: $table.introduce, builder: (column) => column);

  GeneratedColumn<String> get birthday =>
      $composableBuilder(column: $table.birthday, builder: (column) => column);

  GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get otherCon =>
      $composableBuilder(column: $table.otherCon, builder: (column) => column);

  GeneratedColumn<String> get lastActivityAt => $composableBuilder(
      column: $table.lastActivityAt, builder: (column) => column);

  GeneratedColumn<String> get publicKey =>
      $composableBuilder(column: $table.publicKey, builder: (column) => column);

  GeneratedColumn<int> get isOnline =>
      $composableBuilder(column: $table.isOnline, builder: (column) => column);
}

class $$ContactsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ContactsTable,
    Contact,
    $$ContactsTableFilterComposer,
    $$ContactsTableOrderingComposer,
    $$ContactsTableAnnotationComposer,
    $$ContactsTableCreateCompanionBuilder,
    $$ContactsTableUpdateCompanionBuilder,
    (Contact, BaseReferences<_$AppDatabase, $ContactsTable, Contact>),
    Contact,
    PrefetchHooks Function()> {
  $$ContactsTableTableManager(_$AppDatabase db, $ContactsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContactsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContactsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContactsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> myUid = const Value.absent(),
            Value<int> friendUid = const Value.absent(),
            Value<String?> adddAt = const Value.absent(),
            Value<String?> loginName = const Value.absent(),
            Value<String?> firstName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> userAvatar = const Value.absent(),
            Value<String?> introduce = const Value.absent(),
            Value<String?> birthday = const Value.absent(),
            Value<String?> sex = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> otherCon = const Value.absent(),
            Value<String?> lastActivityAt = const Value.absent(),
            Value<String?> publicKey = const Value.absent(),
            Value<int?> isOnline = const Value.absent(),
          }) =>
              ContactsCompanion(
            myUid: myUid,
            friendUid: friendUid,
            adddAt: adddAt,
            loginName: loginName,
            firstName: firstName,
            lastName: lastName,
            userAvatar: userAvatar,
            introduce: introduce,
            birthday: birthday,
            sex: sex,
            email: email,
            otherCon: otherCon,
            lastActivityAt: lastActivityAt,
            publicKey: publicKey,
            isOnline: isOnline,
          ),
          createCompanionCallback: ({
            required int myUid,
            Value<int> friendUid = const Value.absent(),
            Value<String?> adddAt = const Value.absent(),
            Value<String?> loginName = const Value.absent(),
            Value<String?> firstName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> userAvatar = const Value.absent(),
            Value<String?> introduce = const Value.absent(),
            Value<String?> birthday = const Value.absent(),
            Value<String?> sex = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> otherCon = const Value.absent(),
            Value<String?> lastActivityAt = const Value.absent(),
            Value<String?> publicKey = const Value.absent(),
            Value<int?> isOnline = const Value.absent(),
          }) =>
              ContactsCompanion.insert(
            myUid: myUid,
            friendUid: friendUid,
            adddAt: adddAt,
            loginName: loginName,
            firstName: firstName,
            lastName: lastName,
            userAvatar: userAvatar,
            introduce: introduce,
            birthday: birthday,
            sex: sex,
            email: email,
            otherCon: otherCon,
            lastActivityAt: lastActivityAt,
            publicKey: publicKey,
            isOnline: isOnline,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ContactsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ContactsTable,
    Contact,
    $$ContactsTableFilterComposer,
    $$ContactsTableOrderingComposer,
    $$ContactsTableAnnotationComposer,
    $$ContactsTableCreateCompanionBuilder,
    $$ContactsTableUpdateCompanionBuilder,
    (Contact, BaseReferences<_$AppDatabase, $ContactsTable, Contact>),
    Contact,
    PrefetchHooks Function()>;
typedef $$GroupsTableCreateCompanionBuilder = GroupsCompanion Function({
  required String groupId,
  required String groupName,
  required String adminId,
  required String createdAt,
  required String memberIds,
  Value<String?> groupAvatar,
  Value<String?> description,
  Value<int> memberCount,
  required String updatedAt,
  Value<int> rowid,
});
typedef $$GroupsTableUpdateCompanionBuilder = GroupsCompanion Function({
  Value<String> groupId,
  Value<String> groupName,
  Value<String> adminId,
  Value<String> createdAt,
  Value<String> memberIds,
  Value<String?> groupAvatar,
  Value<String?> description,
  Value<int> memberCount,
  Value<String> updatedAt,
  Value<int> rowid,
});

class $$GroupsTableFilterComposer
    extends Composer<_$AppDatabase, $GroupsTable> {
  $$GroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get groupName => $composableBuilder(
      column: $table.groupName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get adminId => $composableBuilder(
      column: $table.adminId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get memberIds => $composableBuilder(
      column: $table.memberIds, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get groupAvatar => $composableBuilder(
      column: $table.groupAvatar, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get memberCount => $composableBuilder(
      column: $table.memberCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$GroupsTableOrderingComposer
    extends Composer<_$AppDatabase, $GroupsTable> {
  $$GroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get groupName => $composableBuilder(
      column: $table.groupName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get adminId => $composableBuilder(
      column: $table.adminId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get memberIds => $composableBuilder(
      column: $table.memberIds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get groupAvatar => $composableBuilder(
      column: $table.groupAvatar, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get memberCount => $composableBuilder(
      column: $table.memberCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$GroupsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GroupsTable> {
  $$GroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get groupId =>
      $composableBuilder(column: $table.groupId, builder: (column) => column);

  GeneratedColumn<String> get groupName =>
      $composableBuilder(column: $table.groupName, builder: (column) => column);

  GeneratedColumn<String> get adminId =>
      $composableBuilder(column: $table.adminId, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get memberIds =>
      $composableBuilder(column: $table.memberIds, builder: (column) => column);

  GeneratedColumn<String> get groupAvatar => $composableBuilder(
      column: $table.groupAvatar, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get memberCount => $composableBuilder(
      column: $table.memberCount, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$GroupsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GroupsTable,
    Group,
    $$GroupsTableFilterComposer,
    $$GroupsTableOrderingComposer,
    $$GroupsTableAnnotationComposer,
    $$GroupsTableCreateCompanionBuilder,
    $$GroupsTableUpdateCompanionBuilder,
    (Group, BaseReferences<_$AppDatabase, $GroupsTable, Group>),
    Group,
    PrefetchHooks Function()> {
  $$GroupsTableTableManager(_$AppDatabase db, $GroupsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> groupId = const Value.absent(),
            Value<String> groupName = const Value.absent(),
            Value<String> adminId = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> memberIds = const Value.absent(),
            Value<String?> groupAvatar = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> memberCount = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupsCompanion(
            groupId: groupId,
            groupName: groupName,
            adminId: adminId,
            createdAt: createdAt,
            memberIds: memberIds,
            groupAvatar: groupAvatar,
            description: description,
            memberCount: memberCount,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String groupId,
            required String groupName,
            required String adminId,
            required String createdAt,
            required String memberIds,
            Value<String?> groupAvatar = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> memberCount = const Value.absent(),
            required String updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupsCompanion.insert(
            groupId: groupId,
            groupName: groupName,
            adminId: adminId,
            createdAt: createdAt,
            memberIds: memberIds,
            groupAvatar: groupAvatar,
            description: description,
            memberCount: memberCount,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GroupsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GroupsTable,
    Group,
    $$GroupsTableFilterComposer,
    $$GroupsTableOrderingComposer,
    $$GroupsTableAnnotationComposer,
    $$GroupsTableCreateCompanionBuilder,
    $$GroupsTableUpdateCompanionBuilder,
    (Group, BaseReferences<_$AppDatabase, $GroupsTable, Group>),
    Group,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MessagesTableTableManager get messages =>
      $$MessagesTableTableManager(_db, _db.messages);
  $$ContactsTableTableManager get contacts =>
      $$ContactsTableTableManager(_db, _db.contacts);
  $$GroupsTableTableManager get groups =>
      $$GroupsTableTableManager(_db, _db.groups);
}
