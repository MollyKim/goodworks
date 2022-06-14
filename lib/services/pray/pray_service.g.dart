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
  Future<PrayList> getPrayList(churchID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PrayList>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'Country': 'KR',
                  r'Authorization':
                      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJxYS52bS11bml0ZWQuY29tL3NldW0iLCJleHAiOjE2NTUyOTk1NjksImp0aSI6IkpwV3ZzN3dvczhKVHNIeVlhakxNNVgiLCJpYXQiOjE2NTUyMTMxNjksImlzcyI6Ikdvb2RXb3JrcyBBdXRoIiwic3ViIjoiR29vZFdvcmtzIFNlcnZpY2UgVG9rZW4iLCJpZHgiOjAsInNjb3BlcyI6WyJub3JtYWwiLCJhZG1pbiJdLCJvd25lciI6ImRydW1ncmFtbWVyIn0.8-TYOdPcdw9fznzT6uSaWBlZPrwDXhGTWvet1eERMaU'
                },
                extra: _extra,
                contentType: 'application/json')
            .compose(_dio.options,
                '/church/$churchID/prayer?limit=5&timeFilter=2022-06',
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
