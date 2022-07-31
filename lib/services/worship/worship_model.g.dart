// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worship_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorshipTypeList _$WorshipTypeListFromJson(Map<String, dynamic> json) {
  return WorshipTypeList(
    trID: json['trID'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
    resultData: (json['resultData'] as List<dynamic>?)
        ?.map((e) =>
            WorshipTypeListResultData.fromJson(e as Map<String, dynamic>))
        .toList(),
    cursor: json['cursor'] as String?,
  );
}

Map<String, dynamic> _$WorshipTypeListToJson(WorshipTypeList instance) =>
    <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
      'cursor': instance.cursor,
    };

WorshipTypeListResultData _$WorshipTypeListResultDataFromJson(
    Map<String, dynamic> json) {
  return WorshipTypeListResultData(
    id: json['id'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$WorshipTypeListResultDataToJson(
        WorshipTypeListResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

WorshipTypeCreate _$WorshipTypeCreateFromJson(Map<String, dynamic> json) {
  return WorshipTypeCreate(
    trID: json['trID'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
    resultData: json['resultData'] == null
        ? null
        : WorshipTypeCreateResultData.fromJson(
            json['resultData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WorshipTypeCreateToJson(WorshipTypeCreate instance) =>
    <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
    };

WorshipTypeCreateResultData _$WorshipTypeCreateResultDataFromJson(
    Map<String, dynamic> json) {
  return WorshipTypeCreateResultData(
    churchId: json['churchId'] as int?,
    resultData: (json['resultData'] as List<dynamic>)
        .map((e) => WorshipTypeListData.fromJson(e as Map<String, dynamic>))
        .toList(),
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as int?,
  );
}

Map<String, dynamic> _$WorshipTypeCreateResultDataToJson(
        WorshipTypeCreateResultData instance) =>
    <String, dynamic>{
      'churchId': instance.churchId,
      'resultData': instance.resultData,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

WorshipTypeListData _$WorshipTypeListDataFromJson(Map<String, dynamic> json) {
  return WorshipTypeListData(
    id: json['id'] as String?,
    title: json['title'] as String?,
  );
}

Map<String, dynamic> _$WorshipTypeListDataToJson(
        WorshipTypeListData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

WorshipTypeUpdate _$WorshipTypeUpdateFromJson(Map<String, dynamic> json) {
  return WorshipTypeUpdate(
    trID: json['trID'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
  );
}

Map<String, dynamic> _$WorshipTypeUpdateToJson(WorshipTypeUpdate instance) =>
    <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
    };

WorshipTypePriorityUpdate _$WorshipTypePriorityUpdateFromJson(
    Map<String, dynamic> json) {
  return WorshipTypePriorityUpdate(
    trID: json['trID'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
    resultData: (json['resultData'] as List<dynamic>?)
        ?.map((e) => WorshipTypePriorityUpdateResultData.fromJson(
            e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WorshipTypePriorityUpdateToJson(
        WorshipTypePriorityUpdate instance) =>
    <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
    };

WorshipTypePriorityUpdateResultData
    _$WorshipTypePriorityUpdateResultDataFromJson(Map<String, dynamic> json) {
  return WorshipTypePriorityUpdateResultData(
    id: json['id'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$WorshipTypePriorityUpdateResultDataToJson(
        WorshipTypePriorityUpdateResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

WorshipDelete _$WorshipDeleteFromJson(Map<String, dynamic> json) {
  return WorshipDelete(
    trID: json['trID'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
  );
}

Map<String, dynamic> _$WorshipDeleteToJson(WorshipDelete instance) =>
    <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
    };

WorshipList _$WorshipListFromJson(Map<String, dynamic> json) {
  return WorshipList(
    trID: json['trID'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
    resultData: (json['resultData'] as List<dynamic>?)
        ?.map((e) => WorshipListResultData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WorshipListToJson(WorshipList instance) =>
    <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
    };

WorshipListResultData _$WorshipListResultDataFromJson(
    Map<String, dynamic> json) {
  return WorshipListResultData(
    id: json['id'] as int?,
    churchId: json['churchId'] as int?,
    uploaderId: json['uploaderId'] as int?,
    playInfo: json['playInfo'] == null
        ? null
        : PlayInfo.fromJson(json['playInfo'] as Map<String, dynamic>),
    title: json['title'] as String?,
    worshipDate: json['worshipDate'] as String?,
  );
}

Map<String, dynamic> _$WorshipListResultDataToJson(
        WorshipListResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'churchId': instance.churchId,
      'uploaderId': instance.uploaderId,
      'playInfo': instance.playInfo,
      'title': instance.title,
      'worshipDate': instance.worshipDate,
    };

PlayInfo _$PlayInfoFromJson(Map<String, dynamic> json) {
  return PlayInfo(
    videoId: json['videoId'] as String?,
  );
}

Map<String, dynamic> _$PlayInfoToJson(PlayInfo instance) => <String, dynamic>{
      'videoId': instance.videoId,
    };

WorshipDetail _$WorshipDetailFromJson(Map<String, dynamic> json) {
  return WorshipDetail(
    trID: json['trID'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
    resultData: (json['resultData'] as List<dynamic>?)
        ?.map(
            (e) => WorshipDetailResultData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WorshipDetailToJson(WorshipDetail instance) =>
    <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
    };

WorshipDetailResultData _$WorshipDetailResultDataFromJson(
    Map<String, dynamic> json) {
  return WorshipDetailResultData(
    json['id'] as int?,
    json['churchId'] as int?,
    json['uploaderId'] as int?,
    json['worshipTypeId'] as String?,
    json['playInfo'] == null
        ? null
        : DetailPlayInfo.fromJson(json['playInfo'] as Map<String, dynamic>),
    json['preacher'] as String?,
    json['title'] as String?,
    json['content'] as String?,
    json['isVisible'] as bool?,
    json['worshipDate'] as String?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$WorshipDetailResultDataToJson(
        WorshipDetailResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'churchId': instance.churchId,
      'uploaderId': instance.uploaderId,
      'worshipTypeId': instance.worshipTypeId,
      'playInfo': instance.playInfo,
      'preacher': instance.preacher,
      'title': instance.title,
      'content': instance.content,
      'isVisible': instance.isVisible,
      'worshipDate': instance.worshipDate,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

DetailPlayInfo _$DetailPlayInfoFromJson(Map<String, dynamic> json) {
  return DetailPlayInfo(
    json['id'] as int?,
    json['videoId'] as String?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$DetailPlayInfoToJson(DetailPlayInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'videoId': instance.videoId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

CreateWorship _$CreateWorshipFromJson(Map<String, dynamic> json) {
  return CreateWorship(
    json['trID'] as String?,
    json['resultCode'] as String?,
    json['resultMsg'] as String?,
    CreateWorshipResultData.fromJson(
        json['resultData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateWorshipToJson(CreateWorship instance) =>
    <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
    };

CreateWorshipResultData _$CreateWorshipResultDataFromJson(
    Map<String, dynamic> json) {
  return CreateWorshipResultData(
    json['id'] as int?,
    json['churchId'] as int?,
    json['uploaderId'] as int?,
    json['worshipTypeId'] as String?,
    json['playInfo'] == null
        ? null
        : CreatePlayInfo.fromJson(json['playInfo'] as Map<String, dynamic>),
    json['preacher'] as String?,
    json['title'] as String?,
    json['isVisible'] as bool?,
    json['worshipDate'] as String?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$CreateWorshipResultDataToJson(
        CreateWorshipResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'churchId': instance.churchId,
      'uploaderId': instance.uploaderId,
      'worshipTypeId': instance.worshipTypeId,
      'playInfo': instance.playInfo,
      'preacher': instance.preacher,
      'title': instance.title,
      'isVisible': instance.isVisible,
      'worshipDate': instance.worshipDate,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

CreatePlayInfo _$CreatePlayInfoFromJson(Map<String, dynamic> json) {
  return CreatePlayInfo(
    json['id'] as int?,
    json['videoId'] as String?,
    json['playingCount'] as int?,
    json['size'] as int?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$CreatePlayInfoToJson(CreatePlayInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'videoId': instance.videoId,
      'playingCount': instance.playingCount,
      'size': instance.size,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

UpdateWorship _$UpdateWorshipFromJson(Map<String, dynamic> json) {
  return UpdateWorship(
    json['trID'] as String?,
    json['resultCode'] as String?,
    json['resultMsg'] as String?,
    json['resultData'] == null
        ? null
        : UpdateWorshipResultData.fromJson(
            json['resultData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateWorshipToJson(UpdateWorship instance) =>
    <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
    };

UpdateWorshipResultData _$UpdateWorshipResultDataFromJson(
    Map<String, dynamic> json) {
  return UpdateWorshipResultData(
    json['id'] as int?,
    json['churchId'] as int?,
    json['uploaderId'] as int?,
    json['worshipTypeId'] as String?,
    UpdateWorshipPlayInfo.fromJson(json['playInfo'] as Map<String, dynamic>),
    json['preacher'] as String?,
    json['title'] as String?,
    json['content'] as String?,
    json['isVisible'] as bool?,
    json['worshipDate'] as String?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$UpdateWorshipResultDataToJson(
        UpdateWorshipResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'churchId': instance.churchId,
      'uploaderId': instance.uploaderId,
      'worshipTypeId': instance.worshipTypeId,
      'playInfo': instance.playInfo,
      'preacher': instance.preacher,
      'title': instance.title,
      'content': instance.content,
      'isVisible': instance.isVisible,
      'worshipDate': instance.worshipDate,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

UpdateWorshipPlayInfo _$UpdateWorshipPlayInfoFromJson(
    Map<String, dynamic> json) {
  return UpdateWorshipPlayInfo(
    json['id'] as int?,
    json['videoId'] as String?,
    json['playingCount'] as int?,
    json['size'] as int?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$UpdateWorshipPlayInfoToJson(
        UpdateWorshipPlayInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'videoId': instance.videoId,
      'playingCount': instance.playingCount,
      'size': instance.size,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

DeleteWorship _$DeleteWorshipFromJson(Map<String, dynamic> json) {
  return DeleteWorship(
    json['trID'] as String?,
    json['resultCode'] as String?,
    json['resultMsg'] as String?,
  );
}

Map<String, dynamic> _$DeleteWorshipToJson(DeleteWorship instance) =>
    <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
    };
