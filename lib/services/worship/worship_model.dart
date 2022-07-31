import 'package:json_annotation/json_annotation.dart';

part 'worship_model.g.dart';

@JsonSerializable()
class WorshipTypeList {
  final String? trID;
  final String? resultCode;
  final String? resultMsg;
  final List<WorshipTypeListResultData>? resultData;
  final String? cursor;

  WorshipTypeList(
      {this.trID,
      this.resultCode,
      this.resultMsg,
      this.resultData,
      this.cursor});

  factory WorshipTypeList.fromJson(Map<String, dynamic> json) =>
      _$WorshipTypeListFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipTypeListToJson(this);
}

@JsonSerializable()
class WorshipTypeListResultData {
  final String id;
  final String title;

  WorshipTypeListResultData({
    required this.id,
    required this.title,
  });

  factory WorshipTypeListResultData.fromJson(Map<String, dynamic> json) =>
      _$WorshipTypeListResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipTypeListResultDataToJson(this);
}

@JsonSerializable()
class WorshipTypeCreate {
  final String? trID;
  final String? resultCode;
  final String? resultMsg;
  final WorshipTypeCreateResultData? resultData;

  WorshipTypeCreate(
      {this.trID, this.resultCode, this.resultMsg, this.resultData});

  factory WorshipTypeCreate.fromJson(Map<String, dynamic> json) =>
      _$WorshipTypeCreateFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipTypeCreateToJson(this);
}

@JsonSerializable()
class WorshipTypeCreateResultData {
  final int? churchId;
  final List<WorshipTypeListData> resultData;
  final String? createdAt;
  final int? updatedAt;

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

  factory WorshipTypeListData.fromJson(Map<String, dynamic> json) =>
      _$WorshipTypeListDataFromJson(json);

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

  factory WorshipTypeUpdate.fromJson(Map<String, dynamic> json) =>
      _$WorshipTypeUpdateFromJson(json);

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

  WorshipTypePriorityUpdate(
      {this.trID, this.resultCode, this.resultMsg, this.resultData});

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

  factory WorshipTypePriorityUpdateResultData.fromJson(
          Map<String, dynamic> json) =>
      _$WorshipTypePriorityUpdateResultDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WorshipTypePriorityUpdateResultDataToJson(this);
}

@JsonSerializable()
class WorshipDelete {
  final String? trID;
  final String? resultCode;
  final String? resultMsg;

  WorshipDelete(
      {required this.trID, required this.resultCode, required this.resultMsg});

  factory WorshipDelete.fromJson(Map<String, dynamic> json) =>
      _$WorshipDeleteFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipDeleteToJson(this);
}

@JsonSerializable()
class WorshipList {
  String? trID;
  String? resultCode;
  String? resultMsg;
  List<WorshipListResultData>? resultData;

  WorshipList({this.trID, this.resultCode, this.resultMsg, this.resultData});

  factory WorshipList.fromJson(Map<String, dynamic> json) =>
      _$WorshipListFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipListToJson(this);
}

@JsonSerializable()
class WorshipListResultData {
  int? id;
  int? churchId;
  int? uploaderId;
  PlayInfo? playInfo;
  String? title;
  String? worshipDate;

  WorshipListResultData({
    this.id,
    this.churchId,
    this.uploaderId,
    this.playInfo,
    this.title,
    this.worshipDate,
  });

  factory WorshipListResultData.fromJson(Map<String, dynamic> json) =>
      _$WorshipListResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipListResultDataToJson(this);
}

@JsonSerializable()
class PlayInfo {
  String? videoId;

  PlayInfo({
    this.videoId,
  });

  factory PlayInfo.fromJson(Map<String, dynamic> json) =>
      _$PlayInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PlayInfoToJson(this);
}

@JsonSerializable()
class WorshipDetail {
  String? trID;
  String? resultCode;
  String? resultMsg;
  List<WorshipDetailResultData>? resultData;

  WorshipDetail({this.trID, this.resultCode, this.resultMsg, this.resultData});

  factory WorshipDetail.fromJson(Map<String, dynamic> json) =>
      _$WorshipDetailFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipDetailToJson(this);
}

@JsonSerializable()
class WorshipDetailResultData {
  int? id;
  int? churchId;
  int? uploaderId;
  String? worshipTypeId;
  DetailPlayInfo? playInfo;
  String? preacher;
  String? title;
  String? content;
  bool? isVisible;
  String? worshipDate;
  String? createdAt;
  String? updatedAt;

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
      this.updatedAt);

  factory WorshipDetailResultData.fromJson(Map<String, dynamic> json) =>
      _$WorshipDetailResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$WorshipDetailResultDataToJson(this);
}

@JsonSerializable()
class DetailPlayInfo {
  int? id;
  String? videoId;
  String? createdAt;
  String? updatedAt;

  DetailPlayInfo(this.id, this.videoId, this.createdAt, this.updatedAt);

  factory DetailPlayInfo.fromJson(Map<String, dynamic> json) =>
      _$DetailPlayInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DetailPlayInfoToJson(this);
}

@JsonSerializable()
class CreateWorship {
  String? trID;
  String? resultCode;
  String? resultMsg;
  CreateWorshipResultData resultData;

  CreateWorship(this.trID, this.resultCode, this.resultMsg, this.resultData);

  factory CreateWorship.fromJson(Map<String, dynamic> json) =>
      _$CreateWorshipFromJson(json);

  Map<String, dynamic> toJson() => _$CreateWorshipToJson(this);
}

@JsonSerializable()
class CreateWorshipResultData {
  int? id;
  int? churchId;
  int? uploaderId;
  String? worshipTypeId;
  CreatePlayInfo? playInfo;
  String? preacher;
  String? title;
  bool? isVisible;
  String? worshipDate;
  String? createdAt;
  String? updatedAt;

  CreateWorshipResultData(
      this.id,
      this.churchId,
      this.uploaderId,
      this.worshipTypeId,
      this.playInfo,
      this.preacher,
      this.title,
      this.isVisible,
      this.worshipDate,
      this.createdAt,
      this.updatedAt);

  factory CreateWorshipResultData.fromJson(Map<String, dynamic> json) =>
      _$CreateWorshipResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreateWorshipResultDataToJson(this);
}

@JsonSerializable()
class CreatePlayInfo {
  int? id;
  String? videoId;
  int? playingCount;
  int? size;
  String? createdAt;
  String? updatedAt;

  CreatePlayInfo(this.id, this.videoId, this.playingCount, this.size,
      this.createdAt, this.updatedAt);

  factory CreatePlayInfo.fromJson(Map<String, dynamic> json) =>
      _$CreatePlayInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePlayInfoToJson(this);
}

@JsonSerializable()
class UpdateWorship {
  String? trID;
  String? resultCode;
  String? resultMsg;
  UpdateWorshipResultData? resultData;

  UpdateWorship(this.trID, this.resultCode, this.resultMsg, this.resultData);

  factory UpdateWorship.fromJson(Map<String, dynamic> json) =>
      _$UpdateWorshipFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateWorshipToJson(this);
}

@JsonSerializable()
class UpdateWorshipResultData {
  int? id;
  int? churchId;
  int? uploaderId;
  String? worshipTypeId;
  UpdateWorshipPlayInfo playInfo;
  String? preacher;
  String? title;
  String? content;
  bool? isVisible;
  String? worshipDate;
  String? createdAt;
  String? updatedAt;

  UpdateWorshipResultData(
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
      this.updatedAt);

  factory UpdateWorshipResultData.fromJson(Map<String, dynamic> json) =>
      _$UpdateWorshipResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateWorshipResultDataToJson(this);
}

@JsonSerializable()
class UpdateWorshipPlayInfo {
  int? id;
  String? videoId;
  int? playingCount;
  int? size;
  String? createdAt;
  String? updatedAt;

  UpdateWorshipPlayInfo(this.id, this.videoId, this.playingCount, this.size,
      this.createdAt, this.updatedAt);

  factory UpdateWorshipPlayInfo.fromJson(Map<String, dynamic> json) =>
      _$UpdateWorshipPlayInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateWorshipPlayInfoToJson(this);
}

@JsonSerializable()
class DeleteWorship {
  String? trID;
  String? resultCode;
  String? resultMsg;

  DeleteWorship(this.trID, this.resultCode, this.resultMsg);

  factory DeleteWorship.fromJson(Map<String, dynamic> json) =>
      _$DeleteWorshipFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteWorshipToJson(this);
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
