import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class PostLoginInfoBody {
  final String email;
  final String password;
  final String userName;
  final String phoneNumber;

  PostLoginInfoBody(
      {required this.email,
      required this.password,
      required this.userName,
      required this.phoneNumber});


  factory PostLoginInfoBody.fromJson(Map<String, dynamic> json) =>
      _$PostLoginInfoBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PostLoginInfoBodyToJson(this);
}

@JsonSerializable()
class PostLoginInfoModel {
  int? trId;
  String? resultCode;
  String? resultMsg;
  PostLoginInfoResponse? resultData;

  // ignore: non_constant_identifier_names
  PostLoginInfoModel(
      {this.trId, this.resultCode, this.resultMsg, this.resultData});

  factory PostLoginInfoModel.fromJson(Object? json) =>
      _$PostLoginInfoModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$PostLoginInfoModelToJson(this);
}

@JsonSerializable()
class PostLoginInfoResponse {
  final String? id;
  final String? email;
  final String? phoneNumber;
  final String? isCertifiedPhone;
  final String? userName;
  final String? userType;
  final String? createdAt;
  final String? updateAt;
  final String? deletedAt;
  final PostLoginInfoUserProfile? userProfile;

  PostLoginInfoResponse({this.id, this.email, this.phoneNumber, this.isCertifiedPhone,
      this.userName, this.deletedAt,this.updateAt,this.createdAt,this.userProfile,this.userType});

  factory PostLoginInfoResponse.fromJson(Object? json) =>
      _$PostLoginInfoResponseFromJson(json as Map<String, dynamic>);


  Map<String, dynamic> toJson() => _$PostLoginInfoResponseToJson(this);
}

@JsonSerializable()
class PostLoginInfoUserProfile{
  final String? id;
  final String? userId;
  final String? nickName;
  final String? selfIntroduce;
  final PostLoginInfoUserAvatar? avatar;
  final String? createdAt;
  final String? updateAt;
  final String? deletedAt;

  PostLoginInfoUserProfile(this.id, this.userId, this.nickName, this.selfIntroduce, this.avatar, this.createdAt, this.updateAt, this.deletedAt);

  factory PostLoginInfoUserProfile.fromJson(Object? json) =>
      _$PostLoginInfoUserProfileFromJson(json as Map<String, dynamic>);


  Map<String, dynamic> toJson() => _$PostLoginInfoUserProfileToJson(this);
}

@JsonSerializable()
class PostLoginInfoUserAvatar {
  final String? filename;
  final String? url;
  final String? smallUrl;
  final num? size;

  PostLoginInfoUserAvatar({this.filename, this.url, this.smallUrl, this.size});

  factory PostLoginInfoUserAvatar.fromJson(Object? json) =>
      _$PostLoginInfoUserAvatarFromJson(json as Map<String, dynamic>);


  Map<String, dynamic> toJson() => _$PostLoginInfoUserAvatarToJson(this);
}