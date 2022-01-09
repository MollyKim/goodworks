// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return Feed(
    trID: json['trID'] as String,
    resultCode: json['resultCode'] as String,
    resultMsg: json['resultMsg'] as String,
    resultData:
        FeedResultData.fromJson(json['resultData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
    };

FeedResultData _$FeedResultDataFromJson(Map<String, dynamic> json) {
  return FeedResultData(
    id: json['id'] as int,
    churchId: json['churchId'] as int,
    churchUserId: json['churchUserId'] as int,
    title: json['title'] as String,
    feedType: json['feedType'] as int,
    feedStatus: json['feedStatus'] as int,
    content: json['content'] as String?,
    favoriteCount: json['favoriteCount'] as int,
    commentCount: json['commentCount'] as int,
    pinned: json['pinned'] as bool,
    attachments: (json['attachments'] as List<dynamic>?)
        ?.map((e) => FeedAttachment.fromJson(e as Map<String, dynamic>))
        .toList(),
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    deletedAt: json['deletedAt'] as String?,
  );
}

Map<String, dynamic> _$FeedResultDataToJson(FeedResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'churchId': instance.churchId,
      'churchUserId': instance.churchUserId,
      'title': instance.title,
      'feedType': instance.feedType,
      'feedStatus': instance.feedStatus,
      'content': instance.content,
      'favoriteCount': instance.favoriteCount,
      'commentCount': instance.commentCount,
      'pinned': instance.pinned,
      'attachments': instance.attachments,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };

FeedAttachment _$FeedAttachmentFromJson(Map<String, dynamic> json) {
  return FeedAttachment(
    id: json['id'] as int,
    feedId: json['feedId'] as String,
    fileinfo: FeedFileInfo.fromJson(json['fileinfo'] as Map<String, dynamic>),
    attachType: json['attachType'] as String,
  );
}

Map<String, dynamic> _$FeedAttachmentToJson(FeedAttachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feedId': instance.feedId,
      'fileinfo': instance.fileinfo,
      'attachType': instance.attachType,
    };

FeedFileInfo _$FeedFileInfoFromJson(Map<String, dynamic> json) {
  return FeedFileInfo(
    filename: json['filename'] as String?,
    url: json['url'] as String?,
    smallUrl: json['smallUrl'] as String?,
    size: json['size'] as int?,
  );
}

Map<String, dynamic> _$FeedFileInfoToJson(FeedFileInfo instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'url': instance.url,
      'smallUrl': instance.smallUrl,
      'size': instance.size,
    };
