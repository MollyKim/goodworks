import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practice/screens/community/community.dart';
import 'package:practice/services/church/church_service.dart';
import 'package:practice/services/feed/feed_service.dart';
import 'package:practice/services/pray/pray_service.dart';
import 'package:practice/services/user/user_service.dart';
import 'package:practice/services/worship/worship_service.dart';
import 'package:practice/util/logger.dart';

import 'community/community_service.dart';

class RootService {
  static final Dio _dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: onRequestWrapper,
        onResponse: onResponseWrapper,
        onError: onErrorWrapper,
      ),
    );

  LoginService loginService;
  ChurchService churchService;
  FeedService feedService;
  CommunityService communityService;
  PrayService pryService;
  WorshipService worshipService;

  RootService()
      : this.loginService = LoginService(_dio),
        this.churchService = ChurchService(_dio),
        this.feedService = FeedService(_dio),
        this.communityService = CommunityService(_dio),
        this.pryService = PrayService(_dio),
        this.worshipService = WorshipService(_dio);

  static parseBody(dynamic data) {
    try {
      if (data is List) {
        final dynamicList = [];
        for (int i = 0; i < data.length; i++) {
          dynamicList.add(parseBody(data[i]));
        }
        return dynamicList;
      }

      if (data is Map) {
        for (var key in data.keys) {
          data[key] = parseBody(data[key]);
        }
      }

      if (data is int) return data;
      if (data is double) return data;
      return data;
    } catch (e) {
      customLogger.e(
        '이 에러가 난다면 해결 또는 헬프요청. 실행에는 영향 없음.'
        '\n$e',
      );
    }
  }

  static onErrorWrapper(
    DioError error,
    ErrorInterceptorHandler handler,
  ) async {
    // if (logHttpRequests) {
    Fluttertoast.showToast(
        msg: "통신 오류가 발생했습니다.\n잠시 후 다시 이용해주세요.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);

    customLogger.d(
      '!!!!!!!!!!ERROR THROWN WITH FOLLOWING LOG!!!!!!!!!!\n'
      'path: ${error.requestOptions.baseUrl}${error.requestOptions.path}\n'
      'status code: ${error.response?.statusCode ?? ''}\n'
      'body: ${error.response?.data.toString() ?? ''}\n'
      'headers: ${error.response?.headers ?? ''}',
    );
    // }

    // TODO production 가기전에 무조건 고처야함 RETRY 횟수를 지정하기!

    return handler.next(error);
  }

  static onResponseWrapper(
    Response resp,
    ResponseInterceptorHandler handler,
  ) async {
    // if (logHttpRequests) {
    customLogger.d(
      '!!!!!!!!!!RESPONSE RECEIVED WITH FOLLOWING LOG!!!!!!!!!!\n'
      'path: ${resp.requestOptions.baseUrl}${resp.requestOptions.path}\n'
      'body: ${resp.data}\n'
      'headers: ${resp.headers}',
    );
    //  }

    return handler.next(resp);
  }

  static onRequestWrapper(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.headers.containsKey('content-type')) {
      final ct = options.headers['content-type'];
      // final ct = options.headers[
      //     'multipart/form-data; boundary=<calculated when request is sent>'];

      options.contentType = ct;
    }

    //  if (logHttpRequests) {
    customLogger.d('!!!!!!!!!!REQUEST SENT WITH FOLLOWING LOG!!!!!!!!!!\n'
        'path: ${options.baseUrl}${options.path}\n'
        'body: ${parseBody(options.data)}\n'
        'headers: ${options.headers}');
    //   }

    return handler.next(options);
  }
}
