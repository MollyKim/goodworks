import 'package:dio/dio.dart' hide Headers;
import 'package:practice/services/feed/feed_model.dart';
import 'package:retrofit/http.dart';

part 'feed_service.g.dart';

@RestApi(baseUrl: 'http://qa-amos.vm-united.com')
abstract class FeedService {
  factory FeedService(Dio dio, {String baseUrl}) = _FeedService;


  @GET('/api/v1/seum/church/{churchID}/community/{{communityID}}/feed?limit=5')
  @Headers(<String, dynamic>{
    'Country': 'KR',
  })
  Future<Feed> getFeedData(
      @Path() String churchID, String communityID,
      );

}