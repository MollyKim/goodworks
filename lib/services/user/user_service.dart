import 'package:dio/dio.dart' hide Headers;
import 'package:practice/services/user/user_model.dart';
import 'package:retrofit/http.dart';

part 'user_service.g.dart';

@RestApi(baseUrl: 'http://qa-amos.vm-united.com')
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST('/login')
  @Headers(<String,dynamic>{})
  Future<UserModel> postLoginIngoBody(
        @Body() Map<String,dynamic> body,
      );

  @POST('/api/v1/seum/user/register')
  @Headers(<String,dynamic>{
    'Content-Type' : 'application/json',
    'Country': 'KR'
  })
  Future<UserModel> registerUser(
      // @Headers({"Content-Type": "application/json","Country": "KR"}) String header,
      @Body() Map<String,dynamic> body,
      );

  @POST('/api/v1/seum/user/login')
  @Headers(<String,dynamic>{"Appname" : "class/student"})
  Future<UserModel> loginUser(
      // @Header() Map<String, dynamic> header,
      @Body() Map<String,dynamic> body,
      );


}