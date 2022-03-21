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