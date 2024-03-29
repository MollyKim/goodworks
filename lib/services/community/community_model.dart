import 'package:json_annotation/json_annotation.dart';
import 'package:practice/services/feed/feed_list_model.dart';

part 'community_model.g.dart';

@JsonSerializable()
class CommunityModel {
  String? trId;
  String? resultCode;
  String? resultMsg;
  List<CommunityResultData>? resultData;

  CommunityModel({this.trId, this.resultCode, this.resultMsg, this.resultData});

  factory CommunityModel.fromJson(Object? json) => _$CommunityModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$CommunityModelToJson(this);
}

@JsonSerializable()
class CommunityResultData {
  final String id;
  final int? churchId;
  final int? communityId;
  final int? churchUserId;
  final int? churchUserType;
  final int? communityUserType;
  final int? depth;
  final String? title;
  final int? memberLimit;
  final int? memberCount;
  final int? communityType;
  final String? introduce;
  final CommunityCoverImage? coverImage;
  final AvatarImage? avatar;
  final List<CommunityAttachment>? attachments;
  final String? name;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String userName;
  final String content;

  factory CommunityResultData.fromJson(Map<String, dynamic> json) => _$CommunityResultDataFromJson(json);

  CommunityResultData(
      {required this.id,
      this.churchId,
      this.depth,
      this.title,
      this.memberLimit,
      this.memberCount,
      this.communityType,
      this.introduce,
      this.coverImage,
      this.name,
      this.createdAt,
      this.updatedAt,
        this.userName = '',
        this.content = '',
      this.deletedAt,
      this.avatar,
        this.churchUserId,
        this.churchUserType,
        this.communityId,
        this.communityUserType,
        this.attachments,
      });

  Map<String, dynamic> toJson() => _$CommunityResultDataToJson(this);
}

@JsonSerializable()
class CommunityCoverImage {
  final String? filename;
  final String? url;
  final String smallUrl;
  final int size;

  CommunityCoverImage(this.filename, this.url, this.smallUrl, this.size);

  factory CommunityCoverImage.fromJson(Map<String, dynamic> json) => _$CommunityCoverImageFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityCoverImageToJson(this);
}


@JsonSerializable()
class AvatarImage {
  final String? url;
  final String? smallUrl;

  factory AvatarImage.fromJson(Map<String, dynamic> json) => _$AvatarImageFromJson(json);

  AvatarImage(this.smallUrl, this.url);

  Map<String, dynamic> toJson() => _$AvatarImageToJson(this);
}


@JsonSerializable()
class CommunityAttachment {
  final int id;
  final String? feedId;
  final CommunityFileInfo? fileInfo;
  final String attachType;

  factory CommunityAttachment.fromJson(Map<String, dynamic> json) => _$CommunityAttachmentFromJson(json);

  CommunityAttachment({required this.id, required this.feedId, required this.fileInfo, required this.attachType});

  Map<String, dynamic> toJson() => _$CommunityAttachmentToJson(this);
}

@JsonSerializable()
class CommunityFileInfo {
  final String? filename;
  final String? url;
  final String? smallUrl;
  final int? size;

  factory CommunityFileInfo.fromJson(Map<String, dynamic> json) => _$CommunityFileInfoFromJson(json);

  CommunityFileInfo({this.filename, this.url, this.smallUrl, this.size});

  Map<String, dynamic> toJson() => _$CommunityFileInfoToJson(this);
}

@JsonSerializable()
class PostCommunityResponse {
  String? trId;
  String? resultCode;
  String? resultMsg;

  PostCommunityResponse({
    this.trId,
    this.resultCode,
    this.resultMsg,
  });

  factory PostCommunityResponse.fromJson(Object? json) => _$PostCommunityResponseFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$PostCommunityResponseToJson(this);
}

@JsonSerializable()
class CommunityUserModel {
  String? trId;
  String? resultCode;
  String? resultMsg;
  List<CommunityUserResultData>? resultData;

  CommunityUserModel({this.trId, this.resultCode, this.resultMsg, this.resultData});

  factory CommunityUserModel.fromJson(Object? json) => _$CommunityUserModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$CommunityUserModelToJson(this);
}

@JsonSerializable()
class CommunityUserResultData {
  int? churchUserId;
  int? userId;
  int? userStatus;
  String? userName;
  int? communityUserType;
  Avatar? avatar;

  CommunityUserResultData(this.churchUserId, this.userId, this.userStatus, this.userName, this.communityUserType, this.avatar);

  factory CommunityUserResultData.fromJson(Object? json) =>
      _$CommunityUserResultDataFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$CommunityUserResultDataToJson(this);
}

@JsonSerializable()
class Avatar {
  String? filename;
  String? url;
  String? smallUrl;
  int? size;

  Avatar(this.filename, this.url, this.smallUrl, this.size);

  factory Avatar.fromJson(Object? json) => _$AvatarFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$AvatarToJson(this);
}
