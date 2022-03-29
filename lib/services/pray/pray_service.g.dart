// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pray_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _PrayService implements PrayService {
  _PrayService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.vm-united.com/seum/api/v1/seum';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PrayList> getPrayList(churchID, communityID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PrayList>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Country': 'KR'},
                extra: _extra)
            .compose(_dio.options,
                '/church/$churchID/prayer?limit=5&timeFilter=2022-03',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PrayList.fromJson(_result.data!);
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
