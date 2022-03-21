import 'package:json_annotation/json_annotation.dart';

part 'pray_crud_model.g.dart';

@JsonSerializable()
class PrayCreateModel {
  final String? trID;
  final String? resultCode;
  final String? resultMsg;
  final PrayCreateResultData? resultData;

  PrayCreateModel(
      {this.trID, this.resultCode, this.resultMsg, this.resultData});

  factory PrayCreateModel.fromJson(Map<String, dynamic> json) =>
      _$PrayCreateModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrayCreateModelToJson(this);
}

@JsonSerializable()
class PrayCreateResultData {
  final int id;
  final int churchId;
  final int? communityId;
  final int prayerType;
  final int? ownerChurchUserID;
  final String? content;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  PrayCreateResultData({
    required this.id,
    required this.churchId,
    required this.communityId,
    required this.prayerType,
    required this.ownerChurchUserID,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory PrayCreateResultData.fromJson(Map<String, dynamic> json) =>
      _$PrayCreateResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$PrayCreateResultDataToJson(this);
}


@JsonSerializable()
class PrayUpdateModel {
  final String? trID;
  final String? resultCode;
  final String? resultMsg;
  final PrayCreateResultData? resultData;

  PrayCreateModel(
      {this.trID, this.resultCode, this.resultMsg, this.resultData});

  factory PrayCreateModel.fromJson(Map<String, dynamic> json) =>
      _$PrayCreateModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrayCreateModelToJson(this);
}

@JsonSerializable()
class PrayCreateResultData {
  final int id;
  final int churchId;
  final int? communityId;
  final int prayerType;
  final int? ownerChurchUserID;
  final String? content;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  PrayCreateResultData({
    required this.id,
    required this.churchId,
    required this.communityId,
    required this.prayerType,
    required this.ownerChurchUserID,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory PrayCreateResultData.fromJson(Map<String, dynamic> json) =>
      _$PrayCreateResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$PrayCreateResultDataToJson(this);
}