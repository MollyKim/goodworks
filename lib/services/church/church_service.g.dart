// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'church_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ChurchService implements ChurchService {
  _ChurchService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://qa-amos.vm-united.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ChurchModel> getChurchData(token, churchID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ChurchModel>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options, '/api/v1/seum/church/$churchID',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ChurchModel.fromJson(_result.data!);
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
