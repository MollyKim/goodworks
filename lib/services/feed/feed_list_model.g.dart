// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedList _$FeedListFromJson(Map<String, dynamic> json) {
  return FeedList(
    trID: json['trID'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
    resultData: (json['resultData'] as List<dynamic>?)
        ?.map((e) => FeedListResultData.fromJson(e as Map<String, dynamic>))
        .toList(),
    cursor: json['cursor'] as String?,
  );
}

Map<String, dynamic> _$FeedListToJson(FeedList instance) => <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
      'cursor': instance.cursor,
    };

FeedListResultData _$FeedListResultDataFromJson(Map<String, dynamic> json) {
  return FeedListResultData(
    id: json['id'] as int,
    churchId: json['churchId'] as int,
    churchUserId: json['churchUserId'] as int,
    title: json['title'] as String?,
    avatar: Avatar.fromJson(json['avatar'] as Object),
    attachments: (json['attachments'] as List<dynamic>?)
        ?.map((e) => FeedListAttachment.fromJson(e as Map<String, dynamic>))
        .toList(),
    feedType: json['feedType'] as int?,
    feedStatus: json['feedStatus'] as int?,
    content: json['content'] as String?,
    pinned: json['pinned'] as bool?,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String?,
    deletedAt: json['deletedAt'] as String?,
    churchUserType: json['churchUserType'] as int?,
    communityUserType: json['communityUserType'] as int?,
    myFavorite: json['myFavorite'] as bool?,
    userName: json['userName'] as String?,
  );
}

Map<String, dynamic> _$FeedListResultDataToJson(FeedListResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'churchId': instance.churchId,
      'churchUserId': instance.churchUserId,
      'userName': instance.userName,
      'churchUserType': instance.churchUserType,
      'communityUserType': instance.communityUserType,
      'avatar': instance.avatar,
      'title': instance.title,
      'content': instance.content,
      'feedType': instance.feedType,
      'feedStatus': instance.feedStatus,
      'pinned': instance.pinned,
      'myFavorite': instance.myFavorite,
      'attachments': instance.attachments,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };

Avatar _$AvatarFromJson(Map<String, dynamic> json) {
  return Avatar(
    filename: json['filename'] as String?,
    url: json['url'] as String?,
    smallUrl: json['smallUrl'] as String?,
    size: json['size'] as num?,
  );
}

Map<String, dynamic> _$AvatarToJson(Avatar instance) => <String, dynamic>{
      'filename': instance.filename,
      'url': instance.url,
      'smallUrl': instance.smallUrl,
      'size': instance.size,
    };

FeedListAttachment _$FeedListAttachmentFromJson(Map<String, dynamic> json) {
  return FeedListAttachment(
    id: json['id'] as int,
    feedId: json['feedId'] as String,
    fileinfo:
        FeedListFileInfo.fromJson(json['fileinfo'] as Map<String, dynamic>),
    attachType: json['attachType'] as String,
  );
}

Map<String, dynamic> _$FeedListAttachmentToJson(FeedListAttachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feedId': instance.feedId,
      'fileinfo': instance.fileinfo,
      'attachType': instance.attachType,
    };

FeedListFileInfo _$FeedListFileInfoFromJson(Map<String, dynamic> json) {
  return FeedListFileInfo(
    filename: json['filename'] as String?,
    url: json['url'] as String?,
    smallUrl: json['smallUrl'] as String?,
    size: json['size'] as int?,
  );
}

Map<String, dynamic> _$FeedListFileInfoToJson(FeedListFileInfo instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'url': instance.url,
      'smallUrl': instance.smallUrl,
      'size': instance.size,
    };
