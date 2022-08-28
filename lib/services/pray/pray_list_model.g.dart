// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pray_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayList _$PrayListFromJson(Map<String, dynamic> json) {
  return PrayList(
    trID: json['trID'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
    resultData: (json['resultData'] as List<dynamic>?)
        ?.map((e) => PrayListResultData.fromJson(e as Map<String, dynamic>))
        .toList(),
    cursor: json['cursor'] as String?,
  );
}

Map<String, dynamic> _$PrayListToJson(PrayList instance) => <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
      'cursor': instance.cursor,
    };

PrayListResultData _$PrayListResultDataFromJson(Map<String, dynamic> json) {
  return PrayListResultData(
    id: json['id'] as int,
    communityId: json['communityId'] as int,
    communityName: json['communityName'] as String?,
    communityTitle: json['communityTitle'] as String?,
    communityType: json['communityType'] as int?,
    ownerChurchUserID: json['ownerChurchUserID'] as int?,
    userName: json['userName'] as String?,
    churchUserType: json['churchUserType'] as int?,
    avatar: json['avatar'] == null
        ? null
        : Avatar.fromJson(json['avatar'] as Object),
    content: json['content'] as String?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    isMine: json['isMine'] as bool?,
  );
}

Map<String, dynamic> _$PrayListResultDataToJson(PrayListResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'communityId': instance.communityId,
      'communityName': instance.communityName,
      'communityTitle': instance.communityTitle,
      'communityType': instance.communityType,
      'ownerChurchUserID': instance.ownerChurchUserID,
      'userName': instance.userName,
      'churchUserType': instance.churchUserType,
      'avatar': instance.avatar,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
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

PrayDetail _$PrayDetailFromJson(Map<String, dynamic> json) {
  return PrayDetail(
    trID: json['trID'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
    resultData: json['resultData'] == null
        ? null
        : PrayDetailResultData.fromJson(
            json['resultData'] as Map<String, dynamic>),
    cursor: json['cursor'] as String?,
  );
}

Map<String, dynamic> _$PrayDetailToJson(PrayDetail instance) =>
    <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
      'cursor': instance.cursor,
    };

PrayDetailResultData _$PrayDetailResultDataFromJson(Map<String, dynamic> json) {
  return PrayDetailResultData(
    id: json['id'] as int,
    communityId: json['communityId'] as int,
    communityTitle: json['communityTitle'] as String?,
    communityType: json['communityType'] as int?,
    ownerChurchUserID: json['ownerChurchUserID'] as int?,
    userName: json['userName'] as String?,
    churchUserType: json['churchUserType'] as int?,
    avatar: json['avatar'] == null
        ? null
        : Avatar.fromJson(json['avatar'] as Object),
    content: json['content'] as String?,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String?,
    deletedAt: json['deletedAt'] as String?,
    isMine: json['isMine'] as bool,
  );
}

Map<String, dynamic> _$PrayDetailResultDataToJson(
        PrayDetailResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'communityId': instance.communityId,
      'communityTitle': instance.communityTitle,
      'communityType': instance.communityType,
      'ownerChurchUserID': instance.ownerChurchUserID,
      'userName': instance.userName,
      'churchUserType': instance.churchUserType,
      'avatar': instance.avatar,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'isMine': instance.isMine,
    };

PrayCreate _$PrayCreateFromJson(Map<String, dynamic> json) {
  return PrayCreate(
    trID: json['trID'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
    resultData: json['resultData'] == null
        ? null
        : PrayCreateResultData.fromJson(
            json['resultData'] as Map<String, dynamic>),
    cursor: json['cursor'] as String?,
  );
}

Map<String, dynamic> _$PrayCreateToJson(PrayCreate instance) =>
    <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
      'cursor': instance.cursor,
    };

PrayCreateResultData _$PrayCreateResultDataFromJson(Map<String, dynamic> json) {
  return PrayCreateResultData(
    id: json['id'] as int,
    churchId: json['churchId'] as int,
    communityId: json['communityId'] as int?,
    prayerType: json['prayerType'] as int?,
    ownerChurchUserID: json['ownerChurchUserID'] as int?,
    content: json['content'] as String?,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String?,
    deletedAt: json['deletedAt'] as String?,
  );
}

Map<String, dynamic> _$PrayCreateResultDataToJson(
        PrayCreateResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'churchId': instance.churchId,
      'communityId': instance.communityId,
      'prayerType': instance.prayerType,
      'ownerChurchUserID': instance.ownerChurchUserID,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };

PrayUpdate _$PrayUpdateFromJson(Map<String, dynamic> json) {
  return PrayUpdate(
    trID: json['trID'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
    resultData: json['resultData'] == null
        ? null
        : PrayUpdateResultData.fromJson(
            json['resultData'] as Map<String, dynamic>),
    cursor: json['cursor'] as String?,
  );
}

Map<String, dynamic> _$PrayUpdateToJson(PrayUpdate instance) =>
    <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
      'cursor': instance.cursor,
    };

PrayUpdateResultData _$PrayUpdateResultDataFromJson(Map<String, dynamic> json) {
  return PrayUpdateResultData(
    id: json['id'] as int,
    churchId: json['churchId'] as int,
    communityId: json['communityId'] as int?,
    prayerType: json['prayerType'] as int?,
    ownerChurchUserID: json['ownerChurchUserID'] as int?,
    content: json['content'] as String?,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String?,
    deletedAt: json['deletedAt'] as String?,
  );
}

Map<String, dynamic> _$PrayUpdateResultDataToJson(
        PrayUpdateResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'churchId': instance.churchId,
      'communityId': instance.communityId,
      'prayerType': instance.prayerType,
      'ownerChurchUserID': instance.ownerChurchUserID,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };

PrayDelete _$PrayDeleteFromJson(Map<String, dynamic> json) {
  return PrayDelete(
    trID: json['trID'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
  );
}

Map<String, dynamic> _$PrayDeleteToJson(PrayDelete instance) =>
    <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
    };
