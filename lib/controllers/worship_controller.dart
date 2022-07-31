import 'package:practice/controllers/root_contoller.dart';
import 'package:practice/services/root_service.dart';
import 'package:practice/services/worship/worship_model.dart';

class WorshipController extends BaseController {
  WorshipController(RootService rootService) : super(rootService);

  WorshipTypeList worshipTypeList = WorshipTypeList();

  Future<void> getWorshipTypeData(String token, {required int churchId}) async {
    String headerToken = "Bearer $token";
    //, int? type, String? cursor} ) async {
    final WorshipTypeList resp = await super
        .rootService
        .worshipService
        .getWorshipTypeList(headerToken, churchId); //,type,cursor);
    this.worshipTypeList = resp;
    update();
  }
}
