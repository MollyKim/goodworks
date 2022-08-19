import 'package:dio/dio.dart' hide Headers;
import 'package:practice/services/community/community_model.dart';
import 'package:retrofit/http.dart';

part 'community_service.g.dart';

@RestApi(baseUrl: 'http://qa-amos.vm-united.com')
abstract class CommunityService {
  factory CommunityService(Dio dio, {String baseUrl}) = _CommunityService;

  @GET('/api/v1/seum/church/{churchID}/community/my/sharinggroup')
  Future<CommunityModel> getCommunityList(
    @Header('Authorization') String token,
    @Path() String churchID,
  );

  @GET('/api/v1/seum/church/{churchID}/community/{communityID}')
  Future<CommunityModel> getCommunityDetail(
    @Header('Authorization') String token,
    @Path("churchID") String churchID,
    @Path("communityID") String communityID,
  );

  @GET('/api/v1/seum/church/{churchID}/community/{communityID}/user')
  Future<CommunityUserModel> getCommunityUserList(
    @Header('Authorization') String token,
    @Path("churchID") String churchID,
    @Path("communityID") String communityID,
  );

  @POST('/api/v1/seum/church/{churchID}/community/2/feed')
  Future<PostCommunityResponse> postCommunityPost(
    @Header('Authorization') String token,
    @Path("churchID") int churchID,
    @Body() FormData body,
  );
}
