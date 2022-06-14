import 'package:dio/dio.dart' hide Headers;
import 'package:practice/services/pray/pray_list_model.dart';
import 'package:retrofit/http.dart';

part 'pray_service.g.dart';

@RestApi(baseUrl: 'http://qa-amos.vm-united.com/api/v1/seum')
abstract class PrayService {
  factory PrayService(Dio dio, {String baseUrl}) = _PrayService;

  @GET('/church/{churchID}/prayer?limit=5&timeFilter=2022-06')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<PrayList> getPrayList(
    @Path() String churchID, //, int type, String cursor
  );
}
