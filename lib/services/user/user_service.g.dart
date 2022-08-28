// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _LoginService implements LoginService {
  _LoginService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://qa-amos.vm-united.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UserModel> postLoginIngoBody(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserModel>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserModel> registerUser(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserModel>(Options(
                method: 'POST',
                headers: <String, dynamic>{
                  r'Content-Type': 'application/json',
                  r'Country': 'KR'
                },
                extra: _extra,
                contentType: 'application/json')
            .compose(_dio.options, '/api/v1/seum/user/register',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserModel> sendOTP(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserModel>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/v1/seum/user/register/otp',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserModel> validateOTP(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserModel>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/v1/seum/user/phone/validate',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserModel> loginUser(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserModel>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Appname': 'class/student'},
                extra: _extra)
            .compose(_dio.options, '/api/v1/seum/user/login',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserOutModel> outUser(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserOutModel>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Appname': 'class/student'},
                extra: _extra)
            .compose(_dio.options, '/api/v1/seum/user/$userId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserOutModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
