import 'package:dio/dio.dart';
import 'package:practice/login_service.dart';

class RootService {
  static Dio dio = Dio()
  ..interceptors.add(
    InterceptorsWrapper(
      onError: onErrorWrapper,
      onRequest: onRequestWrapper,
      onResponse: onResponseWrapper,
    ),
  );

  LoginService loginService;

  RootService() : this.loginService = LoginService(dio);

  static parseBody(dynamic data) {
    try{
      if(data is List){
        final listDynamic = [];
        for(int index = 0; index < data.length;index ++){
          listDynamic.add(parseBody(data[index]));
        }
      }
      else if(data is Map){
        for(var key in data.keys){
          data[key] = parseBody(data[key]);
        }
      }
      else if(data is int) return data;
      else if(data is double) return data;
      else
        return data.toString();
    } catch(e) {
      print(e);
    }
  }

  static onErrorWrapper(
      DioError error,
      ErrorInterceptorHandler handler,
      ) async {
    print('error');
print(error.requestOptions.baseUrl);
print(error.requestOptions.path);
print(error.response!.statusCode);
print(error.response!.data.toString());
print(error.response?.headers.toString() ?? '');
    return handler.next(error);
  }

  static onResponseWrapper(
      Response resp,
      ResponseInterceptorHandler handler,
      ) async {
    print('response');
print(resp.requestOptions.baseUrl);
print(resp.requestOptions.path);
print(resp.data);
print(resp.headers);

    return handler.next(resp);
  }

  static onRequestWrapper(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    if (options.headers.containsKey('content-type')) {
      // final ct = options.headers['content-type'];
      final ct = options
          .headers['multipart/form-data; boundary=<calculated when request is sent>'];
      print('request');
print("options.data : ${options.data}");
print("options.path : ${options.path}");
print("options.headers : ${options.headers}");
print("options.uri : ${options.uri}");
print(options.data);
      options.contentType = ct;
    }
    return handler.next(options);
  }

}