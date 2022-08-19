import 'package:dio/dio.dart' hide Headers;
import 'package:practice/services/pray/pray_list_model.dart';
import 'package:retrofit/http.dart';

part 'pray_service.g.dart';

@RestApi(baseUrl: 'http://qa-amos.vm-united.com/api/v1/seum')
abstract class PrayService {
  factory PrayService(Dio dio, {String baseUrl}) = _PrayService;

  @GET('/church/{churchID}/prayer')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<PrayList> getPrayList(
    @Header('Authorization') String token,
    @Path("churchID") String churchID,
  );

  @GET('/church/{churchID}/prayer/{prayerID}')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<PrayDetail> getPrayDetail(
    @Header('Authorization') String token,
    @Path("churchID") String churchID,
    @Path("prayerID") String prayerID,
  );

  ///create
  @POST('/church/{churchID}/prayer')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<PrayCreate> postPrayCreate(
    @Header('Authorization') String token,
    @Path() String churchID,
    @Body() Map<String, dynamic> body,
  );

  ///create
  @PUT('/church/{churchID}/prayer/{prayerID}')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<PrayUpdate> putPrayUpdate(
    @Path() String churchID,
    prayerID,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/church/{churchID}/prayer/{prayerID}')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<PrayDelete> deletePray(
    @Path() String churchID,
    prayerID,
  );

  ///https://www.vm-united.com/seum/api/v1/seum/church/1/prayer
}
