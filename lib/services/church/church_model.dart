import 'package:json_annotation/json_annotation.dart';

part 'church_model.g.dart';

@JsonSerializable()
class ChurchModel {
  String? trId;
  String? resultCode;
  String? resultMsg;
  ChurchResultData? resultData;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  ChurchModel(
      {this.trId, this.resultCode, this.resultMsg, this.resultData,
      this.createdAt,this.deletedAt,this.updatedAt});

  factory ChurchModel.fromJson(Object? json) =>
      _$ChurchModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$ChurchModelToJson(this);
}


@JsonSerializable()
class ChurchResultData {
  final int id;
  final int ownerId;
  final int? memberLimit;
  final int? communityCount;
  final int? communityLimit;
  final int? depthLimit;
  final int? churchType;
  final MetaCommunity? metaCommunity;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;

  ChurchResultData(
      {required this.id,
        this.metaCommunity,
        required this.createdAt,
        this.deletedAt,
        this.churchType,this.communityCount,this.communityLimit,this.depthLimit,
        this.memberLimit,required this.ownerId,this.updatedAt});

  factory ChurchResultData.fromJson(Map<String, dynamic> json) =>
      _$ChurchResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChurchResultDataToJson(this);
}

@JsonSerializable()
class MetaCommunity {
  final int id;
  final int? churchId;
  final String? title;
  final int? communityType;
  final int? memberCount;
  final int? memberLimit;
  final String? introduce;
  final ChurchCoverImage? coverImage;
  final List<ChurchAttachment>? attachments;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  MetaCommunity(
      {required this.id, this.attachments,this.coverImage,this.updatedAt,
      this.memberLimit,this.deletedAt,this.createdAt,this.churchId,this.communityType,
      this.introduce,this.memberCount,this.title});

  factory MetaCommunity.fromJson(Map<String, dynamic> json) =>
      _$MetaCommunityFromJson(json);

  Map<String, dynamic> toJson() => _$MetaCommunityToJson(this);
}

@JsonSerializable()
class ChurchCoverImage{
  final String? filename;
  final String? url;
  final String smallUrl;
  final int size;

  ChurchCoverImage(this.filename, this.url, this.smallUrl, this.size);

  factory ChurchCoverImage.fromJson(Map<String, dynamic> json) =>
      _$ChurchCoverImageFromJson(json);

  Map<String, dynamic> toJson() => _$ChurchCoverImageToJson(this);
}


@JsonSerializable()
class ChurchAttachment {
  final int id;
  final String communityId;
  final ChurchFileInfo fileinfo;
  final String attachType;

  factory ChurchAttachment.fromJson(Map<String, dynamic> json) =>
      _$ChurchAttachmentFromJson(json);

  ChurchAttachment({
    required this.id,
    required this.communityId,
    required this.fileinfo,
    required this.attachType});

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

  ChurchFileInfo({
    this.filename,
    this.url,
    this.smallUrl,
    this.size});

  Map<String, dynamic> toJson() => _$ChurchFileInfoToJson(this);
}