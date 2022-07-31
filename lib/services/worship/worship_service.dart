import 'package:dio/dio.dart' hide Headers;
import 'package:practice/services/worship/worship_model.dart';
import 'package:retrofit/http.dart';

part 'worship_service.g.dart';

@RestApi(baseUrl: 'http://qa-amos.vm-united.com/api/v1/seum')
abstract class WorshipService {
  factory WorshipService(Dio dio, {String baseUrl}) = _WorshipService;

  @GET('/church/{churchID}/worship-type')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<WorshipTypeList> getWorshipTypeList(
    @Header('Authorization') String token,
    @Path("churchID") int churchID,
  );

  ///https://www.vm-united.com/seum/api/v1/seum/church/1/prayer
}
