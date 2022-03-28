import 'package:practice/controllers/root_contoller.dart';
import 'package:practice/services/pray/pray_list_model.dart';
import 'package:practice/services/root_service.dart';

class PrayController extends BaseController {
  PrayController(RootService rootService) : super(rootService);

  PrayList prayList = PrayList();

  Future<void> getPrayListData({required String churchId, required String communityID}) async{//, int? type, String? cursor} ) async {
    // final PrayList resp = await super.rootService.pryService.g(churchId,communityID);//,type,cursor);
    // this.PrayList = resp;
    update();
  }

}
