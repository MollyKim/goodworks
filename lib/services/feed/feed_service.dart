import 'package:dio/dio.dart' hide Headers;
import 'package:practice/services/feed/feed_model.dart';
import 'package:retrofit/http.dart';

import 'feed_list_model.dart';

part 'feed_service.g.dart';

@RestApi(baseUrl: 'http://qa-amos.vm-united.com')
abstract class FeedService {
  factory FeedService(Dio dio, {String baseUrl}) = _FeedService;


  @GET('/api/v1/seum/church/{churchID}/community/{communityID}/feed?limit=5')
  @Headers(<String, dynamic>{
    'Country': 'KR',
  })
  Future<FeedList> getFeedList(
      @Path() String churchID, String communityID,
      );


  @GET('/api/v1/seum/church/{churchID}/community/{communityID}/feed/{feedID}')
  @Headers(<String, dynamic>{
    'Country': 'KR',
  })
  Future<Feed> getFeedDetailData(
      @Path() String churchID, String communityID,feedID
      );


}