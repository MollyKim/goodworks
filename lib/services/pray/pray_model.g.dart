// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pray_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayModel _$PrayModelFromJson(Map<String, dynamic> json) {
  return PrayModel(
    trID: json['trID'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
    resultData: json['resultData'] == null
        ? null
        : PrayResultData.fromJson(json['resultData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PrayModelToJson(PrayModel instance) => <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
    };

PrayResultData _$PrayResultDataFromJson(Map<String, dynamic> json) {
  return PrayResultData(
    id: json['id'] as int,
    communityId: json['communityId'] as int,
    communityTitle: json['communityTitle'] as String?,
    communityType: json['communityType'] as int?,
    ownerChurchUserID: json['ownerChurchUserID'] as int,
    userName: json['userName'] as String,
    churchUserType: json['churchUserType'] as int?,
    avatar: Avatar.fromJson(json['avatar'] as Object),
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    deletedAt: json['deletedAt'] as String?,
    isMine: json['isMine'] as String?,
  );
}

Map<String, dynamic> _$PrayResultDataToJson(PrayResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'communityId': instance.communityId,
      'communityTitle': instance.communityTitle,
      'communityType': instance.communityType,
      'ownerChurchUserID': instance.ownerChurchUserID,
      'userName': instance.userName,
      'churchUserType': instance.churchUserType,
      'avatar': instance.avatar,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'isMine': instance.isMine,
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
