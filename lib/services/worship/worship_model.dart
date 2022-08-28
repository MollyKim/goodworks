import 'package:json_annotation/json_annotation.dart';

part 'worship_model.g.dart';

@JsonSerializable()
class WorshipTypeList {
  final String? trID;
  final String? resultCode;
  final String? resultMsg;
  final WorshipTypeListResultData? resultData;

  WorshipTypeList({this.trID, this.resultCode, this.resultMsg, this.resultData});

  factory WorshipTypeList.fromJson(Map<String, dynamic> json) => _$WorshipTypeListFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipTypeListToJson(this);
}

@JsonSerializable()
class WorshipTypeListResultData {
  final int? churchId;
  final List<WorshipTypeListInData>? worshipTypeList;
  final String? createdAt;
  final String? updatedAt;

  WorshipTypeListResultData({
    this.churchId,
    this.worshipTypeList,
    this.createdAt,
    this.updatedAt,
  });

  factory WorshipTypeListResultData.fromJson(Map<String, dynamic> json) => _$WorshipTypeListResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipTypeListResultDataToJson(this);
}

@JsonSerializable()
class WorshipTypeListInData {
  final String? id;
  final String? title;

  WorshipTypeListInData({
    this.id,
    this.title,
  });

  factory WorshipTypeListInData.fromJson(Map<String, dynamic> json) => _$WorshipTypeListInDataFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipTypeListInDataToJson(this);
}

@JsonSerializable()
class WorshipTypeCreate {
  final String? trID;
  final String? resultCode;
  final String? resultMsg;
  final WorshipTypeCreateResultData? resultData;

  WorshipTypeCreate({this.trID, this.resultCode, this.resultMsg, this.resultData});

  factory WorshipTypeCreate.fromJson(Map<String, dynamic> json) => _$WorshipTypeCreateFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipTypeCreateToJson(this);
}

@JsonSerializable()
class WorshipTypeCreateResultData {
  final int? churchId;
  final List<WorshipTypeListData> resultData;
  final String? createdAt;
  final String? updatedAt;

  WorshipTypeCreateResultData({
    required this.churchId,
    required this.resultData,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WorshipTypeCreateResultData.fromJson(Map<String, dynamic> json) =>
      _$WorshipTypeCreateResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipTypeCreateResultDataToJson(this);
}

@JsonSerializable()
class WorshipTypeListData {
  final String? id;
  final String? title;

  WorshipTypeListData({
    required this.id,
    required this.title,
  });

  factory WorshipTypeListData.fromJson(Map<String, dynamic> json) => _$WorshipTypeListDataFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipTypeListDataToJson(this);
}

///https://www.vm-united.com/seum/api/v1/seum/church/1/worship-type
///특정 예배 종류의 명칭을 수정합니다.
@JsonSerializable()
class WorshipTypeUpdate {
  final String? trID;
  final String? resultCode;
  final String? resultMsg;

  WorshipTypeUpdate({
    this.trID,
    this.resultCode,
    this.resultMsg,
  });

  factory WorshipTypeUpdate.fromJson(Map<String, dynamic> json) => _$WorshipTypeUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipTypeUpdateToJson(this);
}

///https://www.vm-united.com/seum/api/v1/seum/church/1/worship-type/priority
///예배 종류의 우선순위를 수정합니다.
///수정한 순서대로 UI 단에 나열됩니다.
@JsonSerializable()
class WorshipTypePriorityUpdate {
  final String? trID;
  final String? resultCode;
  final String? resultMsg;
  final List<WorshipTypePriorityUpdateResultData>? resultData;

  WorshipTypePriorityUpdate({this.trID, this.resultCode, this.resultMsg, this.resultData});

  factory WorshipTypePriorityUpdate.fromJson(Object? json) =>
      _$WorshipTypePriorityUpdateFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$WorshipTypePriorityUpdateToJson(this);
}

@JsonSerializable()
class WorshipTypePriorityUpdateResultData {
  final String id;
  final String title;

  WorshipTypePriorityUpdateResultData({
    required this.id,
    required this.title,
  });

  factory WorshipTypePriorityUpdateResultData.fromJson(Map<String, dynamic> json) =>
      _$WorshipTypePriorityUpdateResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipTypePriorityUpdateResultDataToJson(this);
}

@JsonSerializable()
class WorshipTypeDelete {
  final String? trID;
  final String? resultCode;
  final String? resultMsg;

  WorshipTypeDelete({this.trID, this.resultCode, this.resultMsg});

  factory WorshipTypeDelete.fromJson(Map<String, dynamic> json) => _$WorshipTypeDeleteFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipTypeDeleteToJson(this);
}

@JsonSerializable()
class WorshipList {
  String? trID;
  String? resultCode;
  String? resultMsg;
  List<WorshipListResultData>? resultData;

  WorshipList({this.trID, this.resultCode, this.resultMsg, this.resultData});

  factory WorshipList.fromJson(Map<String, dynamic> json) => _$WorshipListFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipListToJson(this);
}

@JsonSerializable()
class WorshipListResultData {
  int? id;
  int? churchId;
  int? uploaderId;
  PlayInfo? playInfo;
  String? title;
  String? preacher;
  String? worshipDate;
  String? content;
  bool? isVisible;

  WorshipListResultData({
    this.id,
    this.churchId,
    this.uploaderId,
    this.playInfo,
    this.title,
    this.preacher,
    this.worshipDate,
    this.content,
    this.isVisible,
  });

  factory WorshipListResultData.fromJson(Map<String, dynamic> json) => _$WorshipListResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipListResultDataToJson(this);
}

@JsonSerializable()
class PlayInfo {
  String? videoId;

  PlayInfo({
    this.videoId,
  });

  factory PlayInfo.fromJson(Map<String, dynamic> json) => _$PlayInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PlayInfoToJson(this);
}

@JsonSerializable()
class WorshipDetail {
  String? trID;
  String? resultCode;
  String? resultMsg;
  WorshipDetailResultData? resultData;

  WorshipDetail({this.trID, this.resultCode, this.resultMsg, this.resultData});

  factory WorshipDetail.fromJson(Map<String, dynamic> json) => _$WorshipDetailFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipDetailToJson(this);
}

@JsonSerializable()
class WorshipDetailResultData {
  int? id;
  int? churchId;
  int? uploaderId;
  String? worshipTypeId;
  PlayInfoDetail? playInfo;
  String? preacher;
  String? title;
  String? content;
  bool? isVisible;
  String? worshipDate;
  String? createdAt;
  String? updatedAt;
  ContentDetail? contentDetail;

  WorshipDetailResultData(
    this.id,
    this.churchId,
    this.uploaderId,
    this.worshipTypeId,
    this.playInfo,
    this.preacher,
    this.title,
    this.content,
    this.isVisible,
    this.worshipDate,
    this.createdAt,
    this.updatedAt,
    this.contentDetail,
  );

  factory WorshipDetailResultData.fromJson(Map<String, dynamic> json) => _$WorshipDetailResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipDetailResultDataToJson(this);
}

@JsonSerializable()
class PlayInfoDetail {
  int? id;
  String? videoId;
  String? createdAt;
  String? updatedAt;

  PlayInfoDetail(this.id, this.videoId, this.createdAt, this.updatedAt);

  factory PlayInfoDetail.fromJson(Map<String, dynamic> json) => _$PlayInfoDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PlayInfoDetailToJson(this);
}

@JsonSerializable()
class ContentDetail {
  String? duration;
  Thumbnail? thumbnail;

  ContentDetail(this.duration, this.thumbnail);

  factory ContentDetail.fromJson(Map<String, dynamic> json) => _$ContentDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ContentDetailToJson(this);
}

@JsonSerializable()
class Thumbnail {
  String? url;
  int? width;
  int? height;

  Thumbnail(this.url, this.width, this.height);

  factory Thumbnail.fromJson(Map<String, dynamic> json) => _$ThumbnailFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);
}

@JsonSerializable()
class WorshipCreate {
  String? trID;
  String? resultCode;
  String? resultMsg;
  WorshipCreateResultData? resultData;

  WorshipCreate({this.trID, this.resultCode, this.resultMsg, this.resultData});

  factory WorshipCreate.fromJson(Map<String, dynamic> json) => _$WorshipCreateFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipCreateToJson(this);
}

@JsonSerializable()
class WorshipCreateResultData {
  int? id;
  int? churchId;
  int? uploaderId;
  String? worshipTypeId;
  PlayInfoCreate? playInfo;
  String? preacher;
  String? title;
  bool? isVisible;
  String? worshipDate;
  String? createdAt;
  String? updatedAt;

  WorshipCreateResultData(this.id, this.churchId, this.uploaderId, this.worshipTypeId, this.playInfo, this.preacher,
      this.title, this.isVisible, this.worshipDate, this.createdAt, this.updatedAt);

  factory WorshipCreateResultData.fromJson(Map<String, dynamic> json) => _$WorshipCreateResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipCreateResultDataToJson(this);
}

@JsonSerializable()
class PlayInfoCreate {
  int? id;
  String? videoId;
  int? playingCount;
  int? size;
  String? createdAt;
  String? updatedAt;

  PlayInfoCreate(this.id, this.videoId, this.playingCount, this.size, this.createdAt, this.updatedAt);

  factory PlayInfoCreate.fromJson(Map<String, dynamic> json) => _$PlayInfoCreateFromJson(json);

  Map<String, dynamic> toJson() => _$PlayInfoCreateToJson(this);
}

@JsonSerializable()
class WorshipUpdate {
  String? trID;
  String? resultCode;
  String? resultMsg;
  WorshipUpdateResultData? resultData;

  WorshipUpdate({this.trID, this.resultCode, this.resultMsg, this.resultData});

  factory WorshipUpdate.fromJson(Map<String, dynamic> json) => _$WorshipUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipUpdateToJson(this);
}

@JsonSerializable()
class WorshipUpdateResultData {
  int? id;
  int? churchId;
  int? uploaderId;
  String? worshipTypeId;
  WorshipUpdatePlayInfo playInfo;
  String? preacher;
  String? title;
  String? content;
  bool? isVisible;
  String? worshipDate;
  String? createdAt;
  String? updatedAt;

  WorshipUpdateResultData(this.id, this.churchId, this.uploaderId, this.worshipTypeId, this.playInfo, this.preacher,
      this.title, this.content, this.isVisible, this.worshipDate, this.createdAt, this.updatedAt);

  factory WorshipUpdateResultData.fromJson(Map<String, dynamic> json) => _$WorshipUpdateResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipUpdateResultDataToJson(this);
}

@JsonSerializable()
class WorshipUpdatePlayInfo {
  int? id;
  String? videoId;
  int? playingCount;
  int? size;
  String? createdAt;
  String? updatedAt;

  WorshipUpdatePlayInfo(this.id, this.videoId, this.playingCount, this.size, this.createdAt, this.updatedAt);

  factory WorshipUpdatePlayInfo.fromJson(Map<String, dynamic> json) => _$WorshipUpdatePlayInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipUpdatePlayInfoToJson(this);
}

@JsonSerializable()
class WorshipDelete {
  String? trID;
  String? resultCode;
  String? resultMsg;

  WorshipDelete({this.trID, this.resultCode, this.resultMsg});

  factory WorshipDelete.fromJson(Map<String, dynamic> json) => _$WorshipDeleteFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipDeleteToJson(this);
}

// @JsonSerializable()
// class WorshipDelete {
//
//
// factory WorshipDelete.fromJson(Map<String, dynamic> json) =>
// _${WorshipDelete}FromJson(json);
//
// Map<String, dynamic> toJson() => _${WorshipDelete}ToJson(this);
// }
