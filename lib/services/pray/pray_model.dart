import 'package:json_annotation/json_annotation.dart';

part 'pray_model.g.dart';

@JsonSerializable()
class PrayModel {
  final String? trID;
  final String? resultCode;
  final String? resultMsg;
  final PrayResultData? resultData;

  PrayModel({this.trID, this.resultCode, this.resultMsg, this.resultData});

  factory PrayModel.fromJson(Map<String, dynamic> json) =>
      _$PrayModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrayModelToJson(this);
}

@JsonSerializable()
class PrayResultData {
  final int id;
  final int communityId;
  final String? communityTitle;
  final int? communityType;
  final int ownerChurchUserID;
  final String userName;
  final int? churchUserType;
  final Avatar avatar;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final String? isMine;

  PrayResultData({
    required this.id,
    required this.communityId,
    required this.communityTitle,
    required this.communityType,
    required this.ownerChurchUserID,
    required this.userName,
    required this.churchUserType,
    required this.avatar,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.isMine,
  });

  factory PrayResultData.fromJson(Map<String, dynamic> json) =>
      _$PrayResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$PrayResultDataToJson(this);
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