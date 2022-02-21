// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _FeedService implements FeedService {
  _FeedService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://qa-amos.vm-united.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Feed> getFeedData(churchID, communityID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        Feed>(Options(
            method: 'GET',
            headers: <String, dynamic>{r'Country': 'KR'},
            extra: _extra)
        .compose(_dio.options,
            '/api/v1/seum/church/$churchID/community/{{communityID}}/feed?limit=5',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Feed.fromJson(_result.data!);
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
