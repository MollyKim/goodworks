import 'package:json_annotation/json_annotation.dart';

part 'feed_model.g.dart';

@JsonSerializable()
class Feed {
  final String trID;
  final String resultCode;
  final String resultMsg;
  final ResultData resultData;


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
class ResultData {
  final String id;
  final int churchId;
  final int churchUserId;
  final String title;
  final int feedType;
  final int feedStatus;
  final String content;
  final int favoriteCount;
  final int commentCount;
  final bool pinned;
  final List<Attachment> attachments;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  ResultData(
      {required this.id,
      required this.churchId,
      required this.churchUserId,
      required this.title,
      required this.feedType,
      required this.feedStatus,
      required this.content,
      required this.favoriteCount,
      required this.commentCount,
      required this.pinned,
      required this.attachments,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt});

  factory ResultData.fromJson(Map<String, dynamic> json) =>
      _$ResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResultDataToJson(this);
}

@JsonSerializable()
class Attachment {
  final int id;
  final String feedId;
  final FileInfo fileinfo;
  final String attachType;

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);

  Attachment({
      required this.id,
      required this.feedId,
      required this.fileinfo,
      required this.attachType});

  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}

@JsonSerializable()
class FileInfo {
  final String filename;
  final String url;
  final String smallUrl;
  final int size;

  factory FileInfo.fromJson(Map<String, dynamic> json) =>
      _$FileInfoFromJson(json);

  FileInfo({
      required this.filename,
      required this.url,
      required this.smallUrl,
      required this.size});

  Map<String, dynamic> toJson() => _$FileInfoToJson(this);
}
