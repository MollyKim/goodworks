// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostLoginInfoBody _$PostLoginInfoBodyFromJson(Map<String, dynamic> json) {
  return PostLoginInfoBody(
    email: json['useremail'] as String,
    password: json['userpwd'] as String,
    userName: json['username'] as String,
    phoneNumber: json['phone'] as String,
  );
}

Map<String, dynamic> _$PostLoginInfoBodyToJson(PostLoginInfoBody instance) =>
    <String, dynamic>{
      'useremail': instance.email,
      'userpwd': instance.password,
      'username': instance.userName,
      'phone': instance.phoneNumber,
    };

PostLoginInfoModel _$PostLoginInfoModelFromJson(Map<String, dynamic> json) {
  return PostLoginInfoModel(
    trId: json['trId'] as int?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
    resultData: json['resultData'] == null
        ? null
        : PostLoginInfoResponse.fromJson(json['resultData'] as Object),
  );
}

Map<String, dynamic> _$PostLoginInfoModelToJson(PostLoginInfoModel instance) =>
    <String, dynamic>{
      'trId': instance.trId,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
    };

PostLoginInfoResponse _$PostLoginInfoResponseFromJson(
    Map<String, dynamic> json) {
  return PostLoginInfoResponse(
    id: json['id'] as String?,
    email: json['email'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    isCertifiedPhone: json['isCertifiedPhone'] as String?,
    userName: json['userName'] as String?,
    deletedAt: json['deletedAt'] as String?,
    updateAt: json['updateAt'] as String?,
    createdAt: json['createdAt'] as String?,
    userProfile: json['userProfile'] == null
        ? null
        : PostLoginInfoUserProfile.fromJson(json['userProfile'] as Object),
    userType: json['userType'] as String?,
  );
}

Map<String, dynamic> _$PostLoginInfoResponseToJson(
        PostLoginInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'isCertifiedPhone': instance.isCertifiedPhone,
      'userName': instance.userName,
      'userType': instance.userType,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deletedAt': instance.deletedAt,
      'userProfile': instance.userProfile,
    };

PostLoginInfoUserProfile _$PostLoginInfoUserProfileFromJson(
    Map<String, dynamic> json) {
  return PostLoginInfoUserProfile(
    json['id'] as String?,
    json['userId'] as String?,
    json['nickName'] as String?,
    json['selfIntroduce'] as String?,
    json['avatar'] == null
        ? null
        : PostLoginInfoUserAvatar.fromJson(json['avatar'] as Object),
    json['createdAt'] as String?,
    json['updateAt'] as String?,
    json['deletedAt'] as String?,
  );
}

Map<String, dynamic> _$PostLoginInfoUserProfileToJson(
        PostLoginInfoUserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'nickName': instance.nickName,
      'selfIntroduce': instance.selfIntroduce,
      'avatar': instance.avatar,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deletedAt': instance.deletedAt,
    };

PostLoginInfoUserAvatar _$PostLoginInfoUserAvatarFromJson(
    Map<String, dynamic> json) {
  return PostLoginInfoUserAvatar(
    filename: json['filename'] as String?,
    url: json['url'] as String?,
    smallUrl: json['smallUrl'] as String?,
    size: json['size'] as num?,
  );
}

Map<String, dynamic> _$PostLoginInfoUserAvatarToJson(
        PostLoginInfoUserAvatar instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'url': instance.url,
      'smallUrl': instance.smallUrl,
      'size': instance.size,
    };
