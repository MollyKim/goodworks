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
    resultData: json['resultData'] == null
        ? null
        : WorshipTypeListResultData.fromJson(
            json['resultData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WorshipTypeListToJson(WorshipTypeList instance) =>
    <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
    };

WorshipTypeListResultData _$WorshipTypeListResultDataFromJson(
    Map<String, dynamic> json) {
  return WorshipTypeListResultData(
    churchId: json['churchId'] as int?,
    worshipTypeList: (json['worshipTypeList'] as List<dynamic>?)
        ?.map((e) => WorshipTypeListInData.fromJson(e as Map<String, dynamic>))
        .toList(),
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$WorshipTypeListResultDataToJson(
        WorshipTypeListResultData instance) =>
    <String, dynamic>{
      'churchId': instance.churchId,
      'worshipTypeList': instance.worshipTypeList,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

WorshipTypeListInData _$WorshipTypeListInDataFromJson(
    Map<String, dynamic> json) {
  return WorshipTypeListInData(
    id: json['id'] as String?,
    title: json['title'] as String?,
  );
}

Map<String, dynamic> _$WorshipTypeListInDataToJson(
        WorshipTypeListInData instance) =>
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
    updatedAt: json['updatedAt'] as String?,
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

WorshipTypeDelete _$WorshipTypeDeleteFromJson(Map<String, dynamic> json) {
  return WorshipTypeDelete(
    trID: json['trID'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
  );
}

Map<String, dynamic> _$WorshipTypeDeleteToJson(WorshipTypeDelete instance) =>
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
    preacher: json['preacher'] as String?,
    worshipDate: json['worshipDate'] as String?,
    content: json['content'] as String?,
    contentDetail: json['contentDetail'] == null
        ? null
        : ContentDetailList.fromJson(
            json['contentDetail'] as Map<String, dynamic>),
    isVisible: json['isVisible'] as bool?,
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
      'preacher': instance.preacher,
      'worshipDate': instance.worshipDate,
      'content': instance.content,
      'contentDetail': instance.contentDetail,
      'isVisible': instance.isVisible,
    };

PlayInfo _$PlayInfoFromJson(Map<String, dynamic> json) {
  return PlayInfo(
    videoId: json['videoId'] as String?,
  );
}

Map<String, dynamic> _$PlayInfoToJson(PlayInfo instance) => <String, dynamic>{
      'videoId': instance.videoId,
    };

ContentDetailList _$ContentDetailListFromJson(Map<String, dynamic> json) {
  return ContentDetailList(
    duration: json['duration'] as String?,
    thumbnail: json['thumbnail'] == null
        ? null
        : ThumbnailList.fromJson(json['thumbnail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ContentDetailListToJson(ContentDetailList instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'thumbnail': instance.thumbnail,
    };

ThumbnailList _$ThumbnailListFromJson(Map<String, dynamic> json) {
  return ThumbnailList(
    url: json['url'] as String?,
    width: json['width'] as int?,
    heigth: json['heigth'] as int?,
  );
}

Map<String, dynamic> _$ThumbnailListToJson(ThumbnailList instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'heigth': instance.heigth,
    };

WorshipDetail _$WorshipDetailFromJson(Map<String, dynamic> json) {
  return WorshipDetail(
    trID: json['trID'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
    resultData: json['resultData'] == null
        ? null
        : WorshipDetailResultData.fromJson(
            json['resultData'] as Map<String, dynamic>),
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
        : PlayInfoDetail.fromJson(json['playInfo'] as Map<String, dynamic>),
    json['preacher'] as String?,
    json['title'] as String?,
    json['content'] as String?,
    json['isVisible'] as bool?,
    json['worshipDate'] as String?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
    json['contentDetail'] == null
        ? null
        : ContentDetail.fromJson(json['contentDetail'] as Map<String, dynamic>),
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
      'contentDetail': instance.contentDetail,
    };

PlayInfoDetail _$PlayInfoDetailFromJson(Map<String, dynamic> json) {
  return PlayInfoDetail(
    json['id'] as int?,
    json['videoId'] as String?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$PlayInfoDetailToJson(PlayInfoDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'videoId': instance.videoId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

ContentDetail _$ContentDetailFromJson(Map<String, dynamic> json) {
  return ContentDetail(
    json['duration'] as String?,
    json['thumbnail'] == null
        ? null
        : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ContentDetailToJson(ContentDetail instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'thumbnail': instance.thumbnail,
    };

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) {
  return Thumbnail(
    json['url'] as String?,
    json['width'] as int?,
    json['height'] as int?,
  );
}

Map<String, dynamic> _$ThumbnailToJson(Thumbnail instance) => <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

WorshipCreate _$WorshipCreateFromJson(Map<String, dynamic> json) {
  return WorshipCreate(
    trID: json['trID'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
    resultData: json['resultData'] == null
        ? null
        : WorshipCreateResultData.fromJson(
            json['resultData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WorshipCreateToJson(WorshipCreate instance) =>
    <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
    };

WorshipCreateResultData _$WorshipCreateResultDataFromJson(
    Map<String, dynamic> json) {
  return WorshipCreateResultData(
    json['id'] as int?,
    json['churchId'] as int?,
    json['uploaderId'] as int?,
    json['worshipTypeId'] as String?,
    json['playInfo'] == null
        ? null
        : PlayInfoCreate.fromJson(json['playInfo'] as Map<String, dynamic>),
    json['preacher'] as String?,
    json['title'] as String?,
    json['isVisible'] as bool?,
    json['worshipDate'] as String?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$WorshipCreateResultDataToJson(
        WorshipCreateResultData instance) =>
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

PlayInfoCreate _$PlayInfoCreateFromJson(Map<String, dynamic> json) {
  return PlayInfoCreate(
    json['id'] as int?,
    json['videoId'] as String?,
    json['playingCount'] as int?,
    json['size'] as int?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$PlayInfoCreateToJson(PlayInfoCreate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'videoId': instance.videoId,
      'playingCount': instance.playingCount,
      'size': instance.size,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

WorshipUpdate _$WorshipUpdateFromJson(Map<String, dynamic> json) {
  return WorshipUpdate(
    trID: json['trID'] as String?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
    resultData: json['resultData'] == null
        ? null
        : WorshipUpdateResultData.fromJson(
            json['resultData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WorshipUpdateToJson(WorshipUpdate instance) =>
    <String, dynamic>{
      'trID': instance.trID,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
    };

WorshipUpdateResultData _$WorshipUpdateResultDataFromJson(
    Map<String, dynamic> json) {
  return WorshipUpdateResultData(
    json['id'] as int?,
    json['churchId'] as int?,
    json['uploaderId'] as int?,
    json['worshipTypeId'] as String?,
    WorshipUpdatePlayInfo.fromJson(json['playInfo'] as Map<String, dynamic>),
    json['preacher'] as String?,
    json['title'] as String?,
    json['content'] as String?,
    json['isVisible'] as bool?,
    json['worshipDate'] as String?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$WorshipUpdateResultDataToJson(
        WorshipUpdateResultData instance) =>
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

WorshipUpdatePlayInfo _$WorshipUpdatePlayInfoFromJson(
    Map<String, dynamic> json) {
  return WorshipUpdatePlayInfo(
    json['id'] as int?,
    json['videoId'] as String?,
    json['playingCount'] as int?,
    json['size'] as int?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$WorshipUpdatePlayInfoToJson(
        WorshipUpdatePlayInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'videoId': instance.videoId,
      'playingCount': instance.playingCount,
      'size': instance.size,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
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
