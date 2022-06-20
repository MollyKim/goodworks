import 'package:json_annotation/json_annotation.dart';

part 'feed_list_model.g.dart';

@JsonSerializable()
class FeedList {
  final String? trID;
  final String? resultCode;
  final String? resultMsg;
  final List<FeedListResultData>? resultData;
  final String? cursor;

  FeedList(
      {this.trID,
      this.resultCode,
      this.resultMsg,
      this.resultData,
      this.cursor});

  factory FeedList.fromJson(Map<String, dynamic> json) =>
      _$FeedListFromJson(json);

  Map<String, dynamic> toJson() => _$FeedListToJson(this);
}

@JsonSerializable()
class FeedListResultData {
  final String id;
  final int churchId;
  final int churchUserId;
  final String? userName;
  final int? churchUserType;
  final int? communityUserType;
  final Avatar avatar;
  final String? title;
  final String? content;
  final int? feedType;
  final int? feedStatus;
  final bool? pinned;
  final bool? myFavorite;
  final List<FeedListAttachment>? attachments;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;

  FeedListResultData({
    required this.id,
    required this.churchId,
    required this.churchUserId,
    required this.title,
    required this.avatar,
    this.attachments,
    required this.feedType,
    required this.feedStatus,
    this.content,
    required this.pinned,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.churchUserType,
    this.communityUserType,
    this.myFavorite,
    this.userName,
  });

  factory FeedListResultData.fromJson(Map<String, dynamic> json) =>
      _$FeedListResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$FeedListResultDataToJson(this);
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
class FeedListAttachment {
  final int id;
  final String feedId;
  final FeedListFileInfo fileInfo;
  final String attachType;

  factory FeedListAttachment.fromJson(Map<String, dynamic> json) =>
      _$FeedListAttachmentFromJson(json);

  FeedListAttachment(
      {required this.id,
      required this.feedId,
      required this.fileInfo,
      required this.attachType});

  Map<String, dynamic> toJson() => _$FeedListAttachmentToJson(this);
}

@JsonSerializable()
class FeedListFileInfo {
  final String? filename;
  final String? url;
  final String? smallUrl;
  final int? size;

  factory FeedListFileInfo.fromJson(Map<String, dynamic> json) =>
      _$FeedListFileInfoFromJson(json);

  FeedListFileInfo({this.filename, this.url, this.smallUrl, this.size});

  Map<String, dynamic> toJson() => _$FeedListFileInfoToJson(this);
}
