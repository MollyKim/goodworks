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
  Future<WorshipTypeList> getWorshipTypeList(token, churchID) async {
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
            .compose(_dio.options, '/church/$churchID/worship-type',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WorshipTypeList.fromJson(_result.data!);
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
