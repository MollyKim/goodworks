// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pray_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _PrayService implements PrayService {
  _PrayService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://qa-amos.vm-united.com/api/v1/seum';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PrayList> getPrayList(token, churchID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PrayList>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'Country': 'KR',
                  r'Authorization': token
                },
                extra: _extra)
            .compose(_dio.options, '/church/$churchID/prayer',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PrayList.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PrayDetail> getPrayDetail(token, churchID, prayerID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PrayDetail>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'Country': 'KR',
                  r'Authorization': token
                },
                extra: _extra)
            .compose(_dio.options, '/church/$churchID/prayer/$prayerID',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PrayDetail.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PrayCreate> postPrayCreate(churchID, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PrayCreate>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Country': 'KR'},
                extra: _extra)
            .compose(_dio.options, '/church/$churchID/prayer',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PrayCreate.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PrayUpdate> putPrayUpdate(churchID, prayerID, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PrayUpdate>(Options(
                method: 'PUT',
                headers: <String, dynamic>{r'Country': 'KR'},
                extra: _extra)
            .compose(_dio.options, '/church/$churchID/prayer/{prayerID}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PrayUpdate.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PrayDelete> deletePray(churchID, prayerID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PrayDelete>(Options(
                method: 'DELETE',
                headers: <String, dynamic>{r'Country': 'KR'},
                extra: _extra)
            .compose(_dio.options, '/church/$churchID/prayer/{prayerID}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PrayDelete.fromJson(_result.data!);
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
