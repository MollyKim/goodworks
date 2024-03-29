// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _FeedService implements FeedService {
  _FeedService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://qa-amos.vm-united.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<FeedList> getFeedList(
    token,
    churchID,
    cursor,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'cursor': cursor};
    final _data = <String, dynamic>{};
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<FeedList>(Options(
      method: 'GET',
      headers: <String, dynamic>{r'Authorization': token},
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v1/seum/church/$churchID/feed',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FeedList.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Feed> getFeedDetailData(
    token,
    churchID,
    communityID,
    feedID,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Feed>(Options(
      method: 'GET',
      headers: <String, dynamic>{r'Authorization': token},
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v1/seum/church/$churchID/community/$communityID/feed/$feedID',
              queryParameters: queryParameters,
              data: _data,
            )
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
