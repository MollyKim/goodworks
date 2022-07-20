import 'package:json_annotation/json_annotation.dart';

part 'church_model.g.dart';

@JsonSerializable()
class ChurchModel {
  String? trId;
  String? resultCode;
  String? resultMsg;
  ChurchResultData? resultData;

  ChurchModel(
      {this.trId,
      this.resultCode,
      this.resultMsg,
      this.resultData,
    });

  factory ChurchModel.fromJson(Object? json) =>
      _$ChurchModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$ChurchModelToJson(this);
}

@JsonSerializable()
class ChurchResultData {
  final int id;
  final int ownerId;
  final int? memberCount;
  final int? memberLimit;
  final int? communityCount;
  final int? communityLimit;
  final int? depthLimit;
  final int? churchType;
  final String? name;
  final String? introduce;
  final ChurchAttachment? logoImage;
  final ChurchAttachment? portraitImage;
  final ChurchAttachment? landscapeImage;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  ChurchResultData({
    required this.id,
    this.logoImage,
    required this.createdAt,
    this.deletedAt,
    this.churchType,
    this.communityCount,
    this.communityLimit,
    this.depthLimit,
    this.memberLimit,
    required this.ownerId,
    this.updatedAt,
    this.introduce,
    this.name,
    this.memberCount,
    this.landscapeImage,
    this.portraitImage,
  });

  factory ChurchResultData.fromJson(Map<String, dynamic> json) =>
      _$ChurchResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChurchResultDataToJson(this);
}

@JsonSerializable()
class ChurchAttachment {
  final int id;
  final ChurchFileInfo fileInfo;
  final int imageType;

  factory ChurchAttachment.fromJson(Map<String, dynamic> json) =>
      _$ChurchAttachmentFromJson(json);

  ChurchAttachment(
      {required this.id, required this.fileInfo, required this.imageType});

  Map<String, dynamic> toJson() => _$ChurchAttachmentToJson(this);
}

@JsonSerializable()
class ChurchFileInfo {
  final String? filename;
  final String? url;
  final String? smallUrl;
  final int? size;

  factory ChurchFileInfo.fromJson(Map<String, dynamic> json) =>
      _$ChurchFileInfoFromJson(json);

  ChurchFileInfo({this.filename, this.url, this.smallUrl, this.size});

  Map<String, dynamic> toJson() => _$ChurchFileInfoToJson(this);
}
