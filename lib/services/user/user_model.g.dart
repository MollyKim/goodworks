// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    trId: json['trId'] as int?,
    resultCode: json['resultCode'] as String?,
    resultMsg: json['resultMsg'] as String?,
    resultData: json['resultData'] == null
        ? null
        : UserResultData.fromJson(json['resultData'] as Object),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'trId': instance.trId,
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
      'resultData': instance.resultData,
    };

UserResultData _$UserResultDataFromJson(Map<String, dynamic> json) {
  return UserResultData(
    id: json['id'] as int?,
    seumId: json['seumId'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    isCertifiedPhone: json['isCertifiedPhone'] as bool?,
    userName: json['userName'] as String?,
    deletedAt: json['deletedAt'] as String?,
    updateAt: json['updateAt'] as String?,
    createdAt: json['createdAt'] as String?,
    userProfile: json['userProfile'] == null
        ? null
        : UserProfile.fromJson(json['userProfile'] as Object),
    userType: json['userType'] as int?,
    tokens:
        (json['tokens'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$UserResultDataToJson(UserResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seumId': instance.seumId,
      'phoneNumber': instance.phoneNumber,
      'isCertifiedPhone': instance.isCertifiedPhone,
      'userName': instance.userName,
      'userType': instance.userType,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deletedAt': instance.deletedAt,
      'userProfile': instance.userProfile,
      'tokens': instance.tokens,
    };

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile(
    json['id'] as int?,
    json['userId'] as int?,
    json['nickName'] as String?,
    json['selfIntroduce'] as String?,
    json['avatar'] == null
        ? null
        : UserAvatar.fromJson(json['avatar'] as Object),
    json['createdAt'] as String?,
    json['updateAt'] as String?,
    json['deletedAt'] as String?,
  );
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
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

UserAvatar _$UserAvatarFromJson(Map<String, dynamic> json) {
  return UserAvatar(
    filename: json['filename'] as String?,
    url: json['url'] as String?,
    smallUrl: json['smallUrl'] as String?,
    size: json['size'] as num?,
  );
}

Map<String, dynamic> _$UserAvatarToJson(UserAvatar instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'url': instance.url,
      'smallUrl': instance.smallUrl,
      'size': instance.size,
    };
