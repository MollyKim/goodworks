import 'package:json_annotation/json_annotation.dart';

part 'pray_list_model.g.dart';

@JsonSerializable()
class PrayList {
  final String? trID;
  final String? resultCode;
  final String? resultMsg;
  final List<PrayListResultData>? resultData;
  final String? cursor;

  PrayList(
      {this.trID,
      this.resultCode,
      this.resultMsg,
      this.resultData,
      this.cursor});

  factory PrayList.fromJson(Map<String, dynamic> json) =>
      _$PrayListFromJson(json);

  Map<String, dynamic> toJson() => _$PrayListToJson(this);
}

@JsonSerializable()
class PrayListResultData {
  final int id;
  final int communityId;
  final String? communityTitle;
  final int? communityType;
  final int? ownerChurchUserID;
  final String? userName;
  final int? churchUserType;
  final Avatar? avatar;
  final String? content;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final bool isMine;

  PrayListResultData({
    required this.id,
    required this.communityId,
    required this.communityTitle,
    required this.communityType,
    required this.ownerChurchUserID,
    required this.userName,
    required this.churchUserType,
    required this.avatar,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.isMine,
  });

  factory PrayListResultData.fromJson(Map<String, dynamic> json) =>
      _$PrayListResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$PrayListResultDataToJson(this);
}

@JsonSerializable()
class Avatar {
  final String? filename;
  final String? url;
  final String? smallUrl;
  final num? size;

  Avatar({this.filename, this.url, this.smallUrl, this.size});

  factory Avatar.fromJson(Object? json) =>
      _$AvatarFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$AvatarToJson(this);
}

@JsonSerializable()
class PrayDetail {
  final String? trID;
  final String? resultCode;
  final String? resultMsg;
  final PrayDetailResultData? resultData;
  final String? cursor;

  PrayDetail(
      {this.trID,
      this.resultCode,
      this.resultMsg,
      this.resultData,
      this.cursor});

  factory PrayDetail.fromJson(Map<String, dynamic> json) =>
      _$PrayDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PrayDetailToJson(this);
}

@JsonSerializable()
class PrayDetailResultData {
  final int id;
  final int communityId;
  final String? communityTitle;
  final int? communityType;
  final int? ownerChurchUserID;
  final String? userName;
  final int? churchUserType;
  final Avatar? avatar;
  final String? content;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final bool isMine;

  PrayDetailResultData({
    required this.id,
    required this.communityId,
    required this.communityTitle,
    required this.communityType,
    required this.ownerChurchUserID,
    required this.userName,
    required this.churchUserType,
    required this.avatar,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.isMine,
  });

  factory PrayDetailResultData.fromJson(Map<String, dynamic> json) =>
      _$PrayDetailResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$PrayDetailResultDataToJson(this);
}

@JsonSerializable()
class PrayCreate {
  final String? trID;
  final String? resultCode;
  final String? resultMsg;
  final PrayCreateResultData? resultData;
  final String? cursor;

  PrayCreate(
      {this.trID,
      this.resultCode,
      this.resultMsg,
      this.resultData,
      this.cursor});

  factory PrayCreate.fromJson(Map<String, dynamic> json) =>
      _$PrayCreateFromJson(json);

  Map<String, dynamic> toJson() => _$PrayCreateToJson(this);
}

@JsonSerializable()
class PrayCreateResultData {
  final int id;
  final int churchId;
  final String? communityId;
  final int? prayerType;
  final int? ownerChurchUserID;
  final String? userName;
  final String? content;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;

  PrayCreateResultData({
    required this.id,
    required this.churchId,
    required this.communityId,
    required this.prayerType,
    required this.ownerChurchUserID,
    required this.userName,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory PrayCreateResultData.fromJson(Map<String, dynamic> json) =>
      _$PrayCreateResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$PrayCreateResultDataToJson(this);
}

@JsonSerializable()
class PrayUpdate {
  final String? trID;
  final String? resultCode;
  final String? resultMsg;
  final PrayUpdateResultData? resultData;
  final String? cursor;

  PrayUpdate(
      {this.trID,
      this.resultCode,
      this.resultMsg,
      this.resultData,
      this.cursor});

  factory PrayUpdate.fromJson(Object? json) =>
      _$PrayUpdateFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$PrayUpdateToJson(this);
}

@JsonSerializable()
class PrayUpdateResultData {
  final int id;
  final int churchId;
  final String? communityId;
  final int? prayerType;
  final int? ownerChurchUserID;
  final String? content;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;

  PrayUpdateResultData({
    required this.id,
    required this.churchId,
    required this.communityId,
    required this.prayerType,
    required this.ownerChurchUserID,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory PrayUpdateResultData.fromJson(Map<String, dynamic> json) =>
      _$PrayUpdateResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$PrayUpdateResultDataToJson(this);
}

@JsonSerializable()
class PrayDelete {
  final String? trID;
  final String? resultCode;
  final String? resultMsg;

  PrayDelete({
    this.trID,
    this.resultCode,
    this.resultMsg,
  });

  factory PrayDelete.fromJson(Map<String, dynamic> json) =>
      _$PrayDeleteFromJson(json);

  Map<String, dynamic> toJson() => _$PrayDeleteToJson(this);
}
