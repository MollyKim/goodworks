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
    @Path("churchID") String churchId,
  );

  @POST('/church/{churchID}/worship-type')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<WorshipTypeCreate> postWorshipTypeCreate(
    @Header('Authorization') String token,
    @Path("churchID") String churchId,
    @Body() Map<String, dynamic> body,
  );

  @PUT('/church/{churchID}/worship-type')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<WorshipTypeUpdate> putWorshipTypeUpdate(
    @Header('Authorization') String token,
    @Path("churchID") String churchId,
    @Body() Map<String, dynamic> body,
  );

  @PUT('/church/{churchID}/worship-type/priority')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<WorshipTypePriorityUpdate> putWorshipTypePriorityUpdate(
    @Header('Authorization') String token,
    @Path("churchID") String churchId,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/church/{churchID}/worship-type')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<WorshipTypeDelete> deleteWorshipTypeDelete(
    @Header('Authorization') String token,
    @Path("churchID") String churchId,
    @Body() Map<String, dynamic> body,
  );

  @GET('/church/{churchID}/worship')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<WorshipList> getWorshipList(
    @Header('Authorization') String token,
    @Path("churchID") String churchId,
  );

  @GET('/church/{churchID}/worship/:{worshipID}')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<WorshipDetail> getWorshipDetail(
    @Header('Authorization') String token,
    @Path("churchID") String churchId,
    @Path("worshipID") String worshipId,
  );

  @POST('/church/{churchID}/worship')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<WorshipCreate> postWorshipCreate(
    @Header('Authorization') String token,
    @Path("churchID") String churchId,
    @Body() Map<String, dynamic> body,
  );

  @PUT('/church/{churchID}/worship/:{worshipID}')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<WorshipUpdate> putWorshipUpdate(
    @Header('Authorization') String token,
    @Path("churchID") String churchId,
    @Path("worshipID") String worshipId,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/church/{churchID}/worship/:{worshipID}')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<WorshipDelete> deleteWorshipDelete(
    @Header('Authorization') String token,
    @Path("churchID") String churchId,
    @Path("worshipID") String worshipId,
  );

  ///https://www.vm-united.com/seum/api/v1/seum/church/1/prayer
}
