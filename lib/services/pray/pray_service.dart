import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

part 'pray_service.g.dart';

@RestApi(baseUrl: 'http://qa-amos.vm-united.com')
abstract class PrayService {
  factory PrayService(Dio dio, {String baseUrl}) = _PrayService;
}
