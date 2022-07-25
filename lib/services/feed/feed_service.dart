import 'package:dio/dio.dart' hide Headers;
import 'package:practice/services/feed/feed_model.dart';
import 'package:retrofit/http.dart';

import 'feed_list_model.dart';

part 'feed_service.g.dart';

@RestApi(baseUrl: 'http://qa-amos.vm-united.com')
abstract class FeedService {
  factory FeedService(Dio dio, {String baseUrl}) = _FeedService;

  @GET('/api/v1/seum/church/{churchID}/feed')
  Future<FeedList> getFeedList(
      @Header('Authorization') String token,
      @Path() int churchID,
      // @Path() String communityID//, int type, String cursor
      );

  @GET('/api/v1/seum/church/{churchID}/community/{communityID}/feed/{feedID}')
  Future<Feed> getFeedDetailData(
      @Header('Authorization') String token,
      @Path("churchID") int churchID,
      @Path("communityID") int communityID,
      @Path("feedID")String feedID

      );


}