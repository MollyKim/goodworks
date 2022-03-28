import 'package:dio/dio.dart' hide Headers;
import 'package:practice/services/pray/pray_list_model.dart';
import 'package:retrofit/http.dart';

part 'pray_service.g.dart';

@RestApi(baseUrl: 'https://www.vm-united.com/seum/api/v1/seum')
abstract class PrayService {
  factory PrayService(Dio dio, {String baseUrl}) = _PrayService;

  // @GET('/api/v1/seum/church/{churchID}/community/{communityID}/feed?limit=5')
  @GET('/church/{churchID}/prayer?limit=5&timeFilter=2022-03')
  @Headers(<String, dynamic>{
    'Country': 'KR',
  })
  Future<PrayList> getPrayList(
      @Path() String churchID, String communityID//, int type, String cursor
      );


}
