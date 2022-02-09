import 'package:dio/dio.dart' hide Headers;
import 'package:practice/models/user_model.dart';
import 'package:retrofit/http.dart';

part 'login_service.g.dart';

@RestApi(baseUrl: 'http://qa-amos.vm-united.com')
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST('/login')
  @Headers(<String,dynamic>{})
  Future<UserModel> postLoginIngoBody(
        @Body() Map<String,dynamic> body,
      );

  @POST('/api/v1/seum/user/register')
  @Headers(<String,dynamic>{})
  Future<UserModel> registerUser(
      @Body() Map<String,dynamic> body,
      );

  @POST('/login')
  @Headers(<String,dynamic>{})
  Future<UserModel> loginUser(
      @Body() Map<String,dynamic> body,
      );


}