// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CommunityService implements CommunityService {
  _CommunityService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://qa-amos.vm-united.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CommunityModel> getCommunityList(token, churchID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CommunityModel>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options,
                '/api/v1/seum/church/{churchID}/feed/',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CommunityModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CommunityModel> getCommunityDetail(
      token, churchID, communityID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CommunityModel>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options,
                '/api/v1/seum/church/$churchID/community/$communityID',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CommunityModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CommunityUserModel> getCommunityUserList(
      token, churchID, communityID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CommunityUserModel>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra)
            .compose(_dio.options,
                '/api/v1/seum/church/$churchID/community/$communityID/user',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CommunityUserModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CommunityUserModel> getCommunityUserListTwo(
      token, churchID, communityID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        CommunityUserModel>(Options(
            method: 'GET',
            headers: <String, dynamic>{r'Authorization': token},
            extra: _extra)
        .compose(_dio.options,
            '/api/v1/seum/church/$churchID/community/$communityID/prayer/users-to-manage',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CommunityUserModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PostCommunityResponse> postCommunityPost(token, churchID, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = body;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostCommunityResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': token},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(
                _dio.options, '/api/v1/seum/church/$churchID/community/2/feed',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostCommunityResponse.fromJson(_result.data!);
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
