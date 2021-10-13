// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostLoginInfoBody _$PostLoginInfoBodyFromJson(Map<String, dynamic> json) {
  return PostLoginInfoBody(
    userid: json['userid'] as String,
    userpwd: json['userpwd'] as String,
    regcode: json['regcode'] as String,
  );
}

Map<String, dynamic> _$PostLoginInfoBodyToJson(PostLoginInfoBody instance) =>
    <String, dynamic>{
      'userid': instance.userid,
      'userpwd': instance.userpwd,
      'regcode': instance.regcode,
    };

PostLoginInfoModel _$PostLoginInfoModelFromJson(Map<String, dynamic> json) {
  return PostLoginInfoModel(
    RESP_CD: json['RESP_CD'] as int?,
    RESP_MSG: json['RESP_MSG'] as String?,
    RESP_DATA: json['RESP_DATA'] == null
        ? null
        : PostLoginInfoResponse.fromJson(json['RESP_DATA'] as Object),
    RESP_HOST: json['RESP_HOST'] as String?,
  );
}

Map<String, dynamic> _$PostLoginInfoModelToJson(PostLoginInfoModel instance) =>
    <String, dynamic>{
      'RESP_CD': instance.RESP_CD,
      'RESP_MSG': instance.RESP_MSG,
      'RESP_DATA': instance.RESP_DATA,
      'RESP_HOST': instance.RESP_HOST,
    };

PostLoginInfoResponse _$PostLoginInfoResponseFromJson(
    Map<String, dynamic> json) {
  return PostLoginInfoResponse(
    session_id: json['session_id'] as String?,
    state_key: json['state_key'] as String?,
    mem_seq: json['mem_seq'] as String?,
    library_seq: json['library_seq'] as String?,
    mobilekey: json['mobilekey'] as String?,
    mem_nickname: json['mem_nickname'] as String?,
    adult_yn: json['adult_yn'] as String?,
    mem_confirm_yn: json['mem_confirm_yn'] as String?,
    dormancy: json['dormancy'] as int?,
    phone_id: json['phone_id'] as String?,
    free_payment_target_yn: json['free_payment_target_yn'] as String?,
  );
}

Map<String, dynamic> _$PostLoginInfoResponseToJson(
        PostLoginInfoResponse instance) =>
    <String, dynamic>{
      'session_id': instance.session_id,
      'state_key': instance.state_key,
      'mem_seq': instance.mem_seq,
      'library_seq': instance.library_seq,
      'mobilekey': instance.mobilekey,
      'mem_nickname': instance.mem_nickname,
      'adult_yn': instance.adult_yn,
      'mem_confirm_yn': instance.mem_confirm_yn,
      'dormancy': instance.dormancy,
      'phone_id': instance.phone_id,
      'free_payment_target_yn': instance.free_payment_target_yn,
    };
