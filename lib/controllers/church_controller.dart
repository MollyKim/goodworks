import 'package:practice/services/church/church_model.dart';
import 'package:practice/controllers/root_contoller.dart';
import 'package:practice/services/root_service.dart';

class ChurchController extends BaseController {
  ChurchController(RootService rootService) : super(rootService);

  ChurchModel churchModel = ChurchModel();

  Future<ChurchModel> getChurchData(String token, {required String churchId}) async {
    final ChurchModel resp =
        await super.rootService.churchService.getChurchData(token, churchId);
    this.churchModel = resp;
    update();
    return resp;
  }
}
