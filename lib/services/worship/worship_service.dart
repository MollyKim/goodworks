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
    @Path("churchID") int churchID,
  );

  @POST('/church/{churchID}/worship-type')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<WorshipTypeCreate> postWorshipTypeCreate(
    @Path("churchID") int churchID,
    @Body() Map<String, dynamic> body,
  );

  @PUT('/church/{churchID}/worship-type')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<WorshipTypeUpdate> putWorshipTypeUpdate(
    @Path("churchID") int churchID,
    @Body() Map<String, dynamic> body,
  );

  @PUT('/church/{churchID}/worship-type/priority')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<WorshipTypePriorityUpdate> putWorshipTypePriorityUpdate(
    @Path("churchID") int churchID,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/church/{churchID}/worship-type')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<WorshipTypeListData> deleteWorshipType(
    @Path("churchID") int churchID,
    @Body() Map<String, dynamic> body,
  );

  @GET('/church/{churchID}/worship')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<WorshipList> getWorshipList(
    @Path("churchID") int churchID,
  );

  @GET('/church/{churchID}/worship/:{worshipID}')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<WorshipDelete> getWorshipDetail(
    @Path("churchID") int churchID,
    @Path("worshipID") int worshipID,
  );

  @POST('/church/{churchID}/worship')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<CreateWorship> postWorshipCreate(
    @Path("churchID") int churchID,
    @Body() Map<String, dynamic> body,
  );

  @PUT('/church/{churchID}/worship/:{worshipID}')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<UpdateWorship> putWorshipUpdate(
    @Path("churchID") int churchID,
    @Path("worshipID") int worshipID,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/church/{churchID}/worship/:{worshipID}')
  @Headers(<String, dynamic>{
    "Country": "KR",
  })
  Future<DeleteWorship> deleteWorship(
    @Path("churchID") int churchID,
    @Path("worshipID") int worshipID,
  );

  ///https://www.vm-united.com/seum/api/v1/seum/church/1/prayer
}
