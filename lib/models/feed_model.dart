import 'package:json_annotation/json_annotation.dart';

part 'feed_model.g.dart';

@JsonSerializable()
class Feed {
  final String trID;
  final String resultCode;
  final String resultMsg;
  final FeedResultData resultData;

  Feed({
    required this.trID,
    required this.resultCode,
    required this.resultMsg,
    required this.resultData});

  factory Feed.fromJson(Map<String, dynamic> json) =>
      _$FeedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedToJson(this);
}

@JsonSerializable()
class FeedResultData {
  final int id;
  final int churchId;
  final int churchUserId;
  final String title;
  final int feedType;
  final int feedStatus;
  final String? content;
  final int favoriteCount;
  final int commentCount;
  final bool pinned;
  final List<FeedAttachment>? attachments;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  FeedResultData(
      {required this.id,
      required this.churchId,
      required this.churchUserId,
      required this.title,
      required this.feedType,
      required this.feedStatus, this.content, this.favoriteCount : 0, this.commentCount : 0,
      required this.pinned, this.attachments,
      required this.createdAt,
      required this.updatedAt, this.deletedAt});

  factory FeedResultData.fromJson(Map<String, dynamic> json) =>
      _$FeedResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$FeedResultDataToJson(this);
}

@JsonSerializable()
class FeedAttachment {
  final int id;
  final String feedId;
  final FeedFileInfo fileinfo;
  final String attachType;

  factory FeedAttachment.fromJson(Map<String, dynamic> json) =>
      _$FeedAttachmentFromJson(json);

  FeedAttachment({
      required this.id,
      required this.feedId,
      required this.fileinfo,
      required this.attachType});

  Map<String, dynamic> toJson() => _$FeedAttachmentToJson(this);
}

@JsonSerializable()
class FeedFileInfo {
  final String? filename;
  final String? url;
  final String? smallUrl;
  final int? size;

  factory FeedFileInfo.fromJson(Map<String, dynamic> json) =>
      _$FeedFileInfoFromJson(json);

  FeedFileInfo({
    this.filename,
    this.url,
    this.smallUrl,
    this.size});

  Map<String, dynamic> toJson() => _$FeedFileInfoToJson(this);
}
