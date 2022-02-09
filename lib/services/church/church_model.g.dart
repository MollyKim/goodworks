// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'church_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChurchModel _$ChurchModelFromJson(Map<String, dynamic> json) {
  return ChurchModel(
    trId: json['trId'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
    resultData: json['resultData'] == null
        ? null
        : ChurchResultData.fromJson(json['resultData'] as Map<String, dynamic>),
    createdAt: json['createdAt'] as String?,
    deletedAt: json['deletedAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$ChurchModelToJson(ChurchModel instance) =>
    <String, dynamic>{
      'trId': instance.trId,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };

ChurchResultData _$ChurchResultDataFromJson(Map<String, dynamic> json) {
  return ChurchResultData(
    id: json['id'] as int,
    metaCommunity: json['metaCommunity'] == null
        ? null
        : MetaCommunity.fromJson(json['metaCommunity'] as Map<String, dynamic>),
    createdAt: json['createdAt'] as String,
    deletedAt: json['deletedAt'] as String?,
    churchType: json['churchType'] as int?,
    communityCount: json['communityCount'] as int?,
    communityLimit: json['communityLimit'] as int?,
    depthLimit: json['depthLimit'] as int?,
    memberLimit: json['memberLimit'] as int?,
    ownerId: json['ownerId'] as int,
    updatedAt: json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$ChurchResultDataToJson(ChurchResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'memberLimit': instance.memberLimit,
      'communityCount': instance.communityCount,
      'communityLimit': instance.communityLimit,
      'depthLimit': instance.depthLimit,
      'churchType': instance.churchType,
      'metaCommunity': instance.metaCommunity,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };

MetaCommunity _$MetaCommunityFromJson(Map<String, dynamic> json) {
  return MetaCommunity(
    id: json['id'] as int,
    attachments: (json['attachments'] as List<dynamic>?)
        ?.map((e) => ChurchAttachment.fromJson(e as Map<String, dynamic>))
        .toList(),
    coverImage: json['coverImage'] == null
        ? null
        : ChurchCoverImage.fromJson(json['coverImage'] as Map<String, dynamic>),
    updatedAt: json['updatedAt'] as String?,
    memberLimit: json['memberLimit'] as int?,
    deletedAt: json['deletedAt'] as String?,
    createdAt: json['createdAt'] as String?,
    churchId: json['churchId'] as int?,
    communityType: json['communityType'] as int?,
    introduce: json['introduce'] as String?,
    memberCount: json['memberCount'] as int?,
    title: json['title'] as String?,
  );
}

Map<String, dynamic> _$MetaCommunityToJson(MetaCommunity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'churchId': instance.churchId,
      'title': instance.title,
      'communityType': instance.communityType,
      'memberCount': instance.memberCount,
      'memberLimit': instance.memberLimit,
      'introduce': instance.introduce,
      'coverImage': instance.coverImage,
      'attachments': instance.attachments,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };

ChurchCoverImage _$ChurchCoverImageFromJson(Map<String, dynamic> json) {
  return ChurchCoverImage(
    json['filename'] as String?,
    json['url'] as String?,
    json['smallUrl'] as String,
    json['size'] as int,
  );
}

Map<String, dynamic> _$ChurchCoverImageToJson(ChurchCoverImage instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'url': instance.url,
      'smallUrl': instance.smallUrl,
      'size': instance.size,
    };

ChurchAttachment _$ChurchAttachmentFromJson(Map<String, dynamic> json) {
  return ChurchAttachment(
    id: json['id'] as int,
    communityId: json['communityId'] as String,
    fileinfo: ChurchFileInfo.fromJson(json['fileinfo'] as Map<String, dynamic>),
    attachType: json['attachType'] as String,
  );
}

Map<String, dynamic> _$ChurchAttachmentToJson(ChurchAttachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'communityId': instance.communityId,
      'fileinfo': instance.fileinfo,
      'attachType': instance.attachType,
    };

ChurchFileInfo _$ChurchFileInfoFromJson(Map<String, dynamic> json) {
  return ChurchFileInfo(
    filename: json['filename'] as String?,
    url: json['url'] as String?,
    smallUrl: json['smallUrl'] as String?,
    size: json['size'] as int?,
  );
}

Map<String, dynamic> _$ChurchFileInfoToJson(ChurchFileInfo instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'url': instance.url,
      'smallUrl': instance.smallUrl,
      'size': instance.size,
    };
