// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worship_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _WorshipService implements WorshipService {
  _WorshipService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://qa-amos.vm-united.com/api/v1/seum';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<WorshipTypeList> getWorshipTypeList(token, churchId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WorshipTypeList>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'Country': 'KR',
                  r'Authorization': token
                },
                extra: _extra)
            .compose(_dio.options, '/church/$churchId/worship-type',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WorshipTypeList.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WorshipTypeCreate> postWorshipTypeCreate(token, churchId, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WorshipTypeCreate>(Options(
                method: 'POST',
                headers: <String, dynamic>{
                  r'Country': 'KR',
                  r'Authorization': token
                },
                extra: _extra)
            .compose(_dio.options, '/church/$churchId/worship-type',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WorshipTypeCreate.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WorshipTypeUpdate> putWorshipTypeUpdate(token, churchId, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WorshipTypeUpdate>(Options(
                method: 'PUT',
                headers: <String, dynamic>{
                  r'Country': 'KR',
                  r'Authorization': token
                },
                extra: _extra)
            .compose(_dio.options, '/church/$churchId/worship-type',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WorshipTypeUpdate.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WorshipTypePriorityUpdate> putWorshipTypePriorityUpdate(
      token, churchId, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WorshipTypePriorityUpdate>(Options(
                method: 'PUT',
                headers: <String, dynamic>{
                  r'Country': 'KR',
                  r'Authorization': token
                },
                extra: _extra)
            .compose(_dio.options, '/church/$churchId/worship-type/priority',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WorshipTypePriorityUpdate.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WorshipTypeDelete> deleteWorshipTypeDelete(
      token, churchId, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WorshipTypeDelete>(Options(
                method: 'DELETE',
                headers: <String, dynamic>{
                  r'Country': 'KR',
                  r'Authorization': token
                },
                extra: _extra)
            .compose(_dio.options, '/church/$churchId/worship-type',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WorshipTypeDelete.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WorshipList> getWorshipList(token, churchId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WorshipList>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'Country': 'KR',
                  r'Authorization': token
                },
                extra: _extra)
            .compose(_dio.options, '/church/$churchId/worship',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WorshipList.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WorshipDetail> getWorshipDetail(token, churchId, worshipId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WorshipDetail>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'Country': 'KR',
                  r'Authorization': token
                },
                extra: _extra)
            .compose(_dio.options, '/church/$churchId/worship/$worshipId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WorshipDetail.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WorshipCreate> postWorshipCreate(token, churchId, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WorshipCreate>(Options(
                method: 'POST',
                headers: <String, dynamic>{
                  r'Country': 'KR',
                  r'Authorization': token
                },
                extra: _extra)
            .compose(_dio.options, '/church/$churchId/worship',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WorshipCreate.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WorshipUpdate> putWorshipUpdate(
      token, churchId, worshipId, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WorshipUpdate>(Options(
                method: 'PUT',
                headers: <String, dynamic>{
                  r'Country': 'KR',
                  r'Authorization': token
                },
                extra: _extra)
            .compose(_dio.options, '/church/$churchId/worship/:$worshipId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WorshipUpdate.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WorshipDelete> deleteWorshipDelete(token, churchId, worshipId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WorshipDelete>(Options(
                method: 'DELETE',
                headers: <String, dynamic>{
                  r'Country': 'KR',
                  r'Authorization': token
                },
                extra: _extra)
            .compose(_dio.options, '/church/$churchId/worship/:$worshipId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WorshipDelete.fromJson(_result.data!);
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
