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
  );
}

Map<String, dynamic> _$ChurchModelToJson(ChurchModel instance) =>
    <String, dynamic>{
      'trId': instance.trId,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
    };

ChurchResultData _$ChurchResultDataFromJson(Map<String, dynamic> json) {
  return ChurchResultData(
    id: json['id'] as int,
    logoImage: json['logoImage'] == null
        ? null
        : ChurchAttachment.fromJson(json['logoImage'] as Map<String, dynamic>),
    createdAt: json['createdAt'] as String,
    deletedAt: json['deletedAt'] as String?,
    churchType: json['churchType'] as int?,
    communityCount: json['communityCount'] as int?,
    communityLimit: json['communityLimit'] as int?,
    depthLimit: json['depthLimit'] as int?,
    memberLimit: json['memberLimit'] as int?,
    ownerId: json['ownerId'] as int,
    updatedAt: json['updatedAt'] as String?,
    introduce: json['introduce'] as String?,
    title: json['title'] as String?,
    memberCount: json['memberCount'] as int?,
    landscapeImage: json['landscapeImage'] == null
        ? null
        : ChurchAttachment.fromJson(
            json['landscapeImage'] as Map<String, dynamic>),
    portraitImage: json['portraitImage'] == null
        ? null
        : ChurchAttachment.fromJson(
            json['portraitImage'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChurchResultDataToJson(ChurchResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'memberCount': instance.memberCount,
      'memberLimit': instance.memberLimit,
      'communityCount': instance.communityCount,
      'communityLimit': instance.communityLimit,
      'depthLimit': instance.depthLimit,
      'churchType': instance.churchType,
      'title': instance.title,
      'introduce': instance.introduce,
      'logoImage': instance.logoImage,
      'portraitImage': instance.portraitImage,
      'landscapeImage': instance.landscapeImage,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };

ChurchAttachment _$ChurchAttachmentFromJson(Map<String, dynamic> json) {
  return ChurchAttachment(
    id: json['id'] as int,
    fileInfo: ChurchFileInfo.fromJson(json['fileInfo'] as Map<String, dynamic>),
    imageType: json['imageType'] as int,
  );
}

Map<String, dynamic> _$ChurchAttachmentToJson(ChurchAttachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fileInfo': instance.fileInfo,
      'imageType': instance.imageType,
    };

ChurchFileInfo _$ChurchFileInfoFromJson(Map<String, dynamic> json) {
  return ChurchFileInfo(
    filename: json['filename'] as String,
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
