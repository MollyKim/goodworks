// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityModel _$CommunityModelFromJson(Map<String, dynamic> json) {
  return CommunityModel(
    trId: json['trId'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
    resultData: json['resultData'] == null
        ? null
        : CommunityResultData.fromJson(
            json['resultData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CommunityModelToJson(CommunityModel instance) =>
    <String, dynamic>{
      'trId': instance.trId,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
    };

CommunityResultData _$CommunityResultDataFromJson(Map<String, dynamic> json) {
  return CommunityResultData(
    id: json['id'] as int,
    churchId: json['churchId'] as int?,
    upperCommunityId: json['upperCommunityId'] as int?,
    depth: json['depth'] as int?,
    title: json['title'] as String?,
    memberLimit: json['memberLimit'] as int?,
    memberCount: json['memberCount'] as int?,
    communityType: json['communityType'] as int?,
    introduce: json['introduce'] as String?,
    coverImage: json['coverImage'] == null
        ? null
        : CommunityCoverImage.fromJson(
            json['coverImage'] as Map<String, dynamic>),
    attachments: (json['attachments'] as List<dynamic>?)
        ?.map((e) => CommunityAttachment.fromJson(e as Map<String, dynamic>))
        .toList(),
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    deletedAt: json['deletedAt'] as String?,
  );
}

Map<String, dynamic> _$CommunityResultDataToJson(
        CommunityResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'churchId': instance.churchId,
      'upperCommunityId': instance.upperCommunityId,
      'depth': instance.depth,
      'title': instance.title,
      'memberLimit': instance.memberLimit,
      'memberCount': instance.memberCount,
      'communityType': instance.communityType,
      'introduce': instance.introduce,
      'coverImage': instance.coverImage,
      'attachments': instance.attachments,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };

CommunityCoverImage _$CommunityCoverImageFromJson(Map<String, dynamic> json) {
  return CommunityCoverImage(
    json['filename'] as String?,
    json['url'] as String?,
    json['smallUrl'] as String,
    json['size'] as int,
  );
}

Map<String, dynamic> _$CommunityCoverImageToJson(
        CommunityCoverImage instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'url': instance.url,
      'smallUrl': instance.smallUrl,
      'size': instance.size,
    };

CommunityAttachment _$CommunityAttachmentFromJson(Map<String, dynamic> json) {
  return CommunityAttachment(
    id: json['id'] as int,
    communityId: json['communityId'] as String,
    fileinfo:
        CommunityFileInfo.fromJson(json['fileinfo'] as Map<String, dynamic>),
    attachType: json['attachType'] as String,
  );
}

Map<String, dynamic> _$CommunityAttachmentToJson(
        CommunityAttachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'communityId': instance.communityId,
      'fileinfo': instance.fileinfo,
      'attachType': instance.attachType,
    };

CommunityFileInfo _$CommunityFileInfoFromJson(Map<String, dynamic> json) {
  return CommunityFileInfo(
    filename: json['filename'] as String?,
    url: json['url'] as String?,
    smallUrl: json['smallUrl'] as String?,
    size: json['size'] as int?,
  );
}

Map<String, dynamic> _$CommunityFileInfoToJson(CommunityFileInfo instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'url': instance.url,
      'smallUrl': instance.smallUrl,
      'size': instance.size,
    };
