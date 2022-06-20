import 'package:dio/dio.dart' hide Headers;
import 'package:practice/services/church/church_model.dart';
import 'package:retrofit/http.dart';

part 'church_service.g.dart';

@RestApi(baseUrl: 'http://qa-amos.vm-united.com')
abstract class ChurchService {
  factory ChurchService(Dio dio, {String baseUrl}) = _ChurchService;


  @GET('/api/v1/seum/church/{churchID}')
  Future<ChurchModel> getChurchData(
      @Header('Authorization') String token,
      @Path() String churchID,
    );


}