import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int? trId;
  String? resultCode;
  String? resultMsg;
  UserResultData? resultData;

  UserModel(
      {this.trId, this.resultCode, this.resultMsg, this.resultData});

  factory UserModel.fromJson(Object? json) =>
      _$UserModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class UserResultData {
  final int? id;
  final String? seumId;
  final String? phoneNumber;
  final bool? isCertifiedPhone;
  final String? userName;
  final int? userType;
  final String? createdAt;
  final String? updateAt;
  final String? deletedAt;
  final UserProfile? userProfile;
  final List<String>? tokens;
  final int? churchId;

  UserResultData({this.id, this.seumId, this.phoneNumber, this.isCertifiedPhone,
    this.churchId, this.userName, this.deletedAt,this.updateAt,this.createdAt,this.userProfile,this.userType, this.tokens});

  factory UserResultData.fromJson(Object? json) =>
      _$UserResultDataFromJson(json as Map<String, dynamic>);


  Map<String, dynamic> toJson() => _$UserResultDataToJson(this);
}

@JsonSerializable()
class UserProfile{
  final int? id;
  final int? userId;
  final String? nickName;
  final String? selfIntroduce;
  final UserAvatar? avatar;
  final String? createdAt;
  final String? updateAt;
  final String? deletedAt;

  UserProfile(this.id, this.userId, this.nickName, this.selfIntroduce, this.avatar, this.createdAt, this.updateAt, this.deletedAt);

  factory UserProfile.fromJson(Object? json) =>
      _$UserProfileFromJson(json as Map<String, dynamic>);


  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}

@JsonSerializable()
class UserAvatar {
  final String? filename;
  final String? url;
  final String? smallUrl;
  final num? size;

  UserAvatar({this.filename, this.url, this.smallUrl, this.size});

  factory UserAvatar.fromJson(Object? json) =>
      _$UserAvatarFromJson(json as Map<String, dynamic>);


  Map<String, dynamic> toJson() => _$UserAvatarToJson(this);
}