import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class PostLoginInfoBody {
  final String userid;
  final String userpwd;
  final String regcode;

  PostLoginInfoBody(
      {required this.userid,
      required this.userpwd,
      required this.regcode});


  factory PostLoginInfoBody.fromJson(Map<String, dynamic> json) =>
      _$PostLoginInfoBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PostLoginInfoBodyToJson(this);
}

@JsonSerializable()
class PostLoginInfoModel {
  int? RESP_CD;
  String? RESP_MSG;
  PostLoginInfoResponse? RESP_DATA;
  String? RESP_HOST;

  // ignore: non_constant_identifier_names
  PostLoginInfoModel(
      {this.RESP_CD, this.RESP_MSG, this.RESP_DATA, this.RESP_HOST});

  factory PostLoginInfoModel.fromJson(Object? json) =>
      _$PostLoginInfoModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$PostLoginInfoModelToJson(this);
}

@JsonSerializable()
class PostLoginInfoResponse {
  final String? session_id;
  final String? state_key;
  final String? mem_seq;
  final String? library_seq;
  final String? mobilekey;
  final String? mem_nickname;
  final String? adult_yn;
  final String? mem_confirm_yn;
  final int? dormancy;
  final String? phone_id;
  final String? free_payment_target_yn;

  PostLoginInfoResponse({
    this.session_id,
    this.state_key,
    this.mem_seq,
    this.library_seq,
    this.mobilekey,
    this.mem_nickname,
    this.adult_yn,
    this.mem_confirm_yn,
    this.dormancy,
    this.phone_id,
    this.free_payment_target_yn,
  });

  factory PostLoginInfoResponse.fromJson(Object? json) =>
      _$PostLoginInfoResponseFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$PostLoginInfoResponseToJson(this);
}
