import 'package:json_annotation/json_annotation.dart';
part 'community_model.g.dart';


@JsonSerializable()
class CommunityModel {
  String? trId;
  String? resultCode;
  String? resultMsg;
  CommunityResultData? resultData;

  CommunityModel(
      {this.trId, this.resultCode, this.resultMsg, this.resultData});

  factory CommunityModel.fromJson(Object? json) =>
      _$CommunityModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$CommunityModelToJson(this);
}


@JsonSerializable()
class CommunityResultData {
  final int id;
  final int? churchId;
  final int? upperCommunityId;
  final int? depth;
  final String? title;
  final int? memberLimit;
  final int? memberCount;
  final int? communityType;
  final String? introduce;
  final CommunityCoverImage? coverImage;
  final List<CommunityAttachment>? attachments;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;


  factory CommunityResultData.fromJson(Map<String, dynamic> json) =>
      _$CommunityResultDataFromJson(json);

  CommunityResultData({required this.id, this.churchId, this.upperCommunityId, this.depth,
      this.title, this.memberLimit, this.memberCount, this.communityType,
      this.introduce, this.coverImage, this.attachments, this.createdAt, this.updatedAt, this.deletedAt});

  Map<String, dynamic> toJson() => _$CommunityResultDataToJson(this);
}

@JsonSerializable()
class CommunityCoverImage{
  final String? filename;
  final String? url;
  final String smallUrl;
  final int size;

  CommunityCoverImage(this.filename, this.url, this.smallUrl, this.size);

  factory CommunityCoverImage.fromJson(Map<String, dynamic> json) =>
      _$CommunityCoverImageFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityCoverImageToJson(this);
}


@JsonSerializable()
class CommunityAttachment {
  final int id;
  final String communityId;
  final CommunityFileInfo fileinfo;
  final String attachType;

  factory CommunityAttachment.fromJson(Map<String, dynamic> json) =>
      _$CommunityAttachmentFromJson(json);

  CommunityAttachment({
    required this.id,
    required this.communityId,
    required this.fileinfo,
    required this.attachType});

  Map<String, dynamic> toJson() => _$CommunityAttachmentToJson(this);
}

@JsonSerializable()
class CommunityFileInfo {
  final String? filename;
  final String? url;
  final String? smallUrl;
  final int? size;

  factory CommunityFileInfo.fromJson(Map<String, dynamic> json) =>
      _$CommunityFileInfoFromJson(json);

  CommunityFileInfo({
    this.filename,
    this.url,
    this.smallUrl,
    this.size});

  Map<String, dynamic> toJson() => _$CommunityFileInfoToJson(this);
}