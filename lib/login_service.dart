import 'package:dio/dio.dart' hide Headers;
import 'package:practice/login_model.dart';
import 'package:retrofit/http.dart';

part 'login_service.g.dart';

@RestApi(baseUrl: 'https://dev-api.millie.co.kr/v1')
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST('/login')
  @Headers(<String,dynamic>{})
  Future<PostLoginInfoModel> postLoginIngoBody(
        @Body() Map<String,dynamic> body,
      );
}