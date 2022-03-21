// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pray_crud_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayCreateModel _$PrayCreateModelFromJson(Map<String, dynamic> json) {
  return PrayCreateModel(
    trID: json['trID'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
    resultData: json['resultData'] == null
        ? null
        : PrayCreateResultData.fromJson(
            json['resultData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PrayCreateModelToJson(PrayCreateModel instance) =>
    <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
    };

PrayCreateResultData _$PrayCreateResultDataFromJson(Map<String, dynamic> json) {
  return PrayCreateResultData(
    id: json['id'] as int,
    churchId: json['churchId'] as int,
    communityId: json['communityId'] as int?,
    prayerType: json['prayerType'] as int,
    ownerChurchUserID: json['ownerChurchUserID'] as int?,
    content: json['content'] as String?,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
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
