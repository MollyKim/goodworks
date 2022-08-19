import 'package:get/get.dart';
import 'package:practice/controllers/root_contoller.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/services/pray/pray_list_model.dart';
import 'package:practice/services/root_service.dart';

class PrayController extends BaseController {
  PrayController(RootService rootService) : super(rootService);

  PrayList prayList = PrayList();
  PrayDetail prayDetail = PrayDetail();
  PrayCreate prayCreate = PrayCreate();
  PrayUpdate prayUpdate = PrayUpdate();
  PrayDelete prayDelete = PrayDelete();
  UserController userController = Get.find();

  Future<void> getPrayListData(String token, {required String churchId}) async {
    String headerToken = "Bearer $token";
    final PrayList resp = await super.rootService.pryService.getPrayList(headerToken, churchId); //,type,cursor);
    this.prayList = resp;
    update();
  }

  // Future<void> getPrayListData(String token,{required String churchId, time}) async {
  //   String headerToken = "Bearer $token";
  //   //, int? type, String? cursor} ) async {
  //   final PrayList resp = await super
  //       .rootService
  //       .pryService
  //       .getPrayList(headerToken, churchId, time); //,type,cursor);
  //   this.prayList = resp;
  //   update();
  // }

  Future<void> getPrayDetailData(String token, {required String churchId, prayerID}) async {
    String headerToken = "Bearer $token";

    final PrayDetail resp =
        await super.rootService.pryService.getPrayDetail(headerToken, churchId, prayerID); //,type,cursor);
    this.prayDetail = resp;
    update();
  }

  Future<void> postPrayCreate(
      {required String churchId,
      required int communityId,
      prayerType,
      ownerChurchUserId,
      required String content}) async {
    String token = "Bearer ${userController.userSession}";

    final Map<String, dynamic> data = {
      "communityId": communityId,
      "prayerType": 2,
      "ownerChurchUserId": ownerChurchUserId,
      "content": content
    };

    final PrayCreate resp = await super.rootService.pryService.postPrayCreate(token, churchId, data); //,type,cursor);
    this.prayCreate = resp;
    update();
  }

  Future<void> putPrayUpdate({required String churchId, prayerId, content}) async {
    //, int? type, String? cursor} ) async {

    final Map<String, dynamic> data = {"content": content};

    final PrayUpdate resp = await super.rootService.pryService.putPrayUpdate(churchId, prayerId, data); //,type,cursor);
    this.prayUpdate = resp;
    update();
  }

  Future<void> deletePray({required String churchId, prayerId}) async {
    //, int? type, String? cursor} ) async {

    final PrayDelete resp = await super.rootService.pryService.deletePray(churchId, prayerId); //,type,cursor);
    this.prayDelete = resp;
    update();
  }

// Future<void> getFeedListData({required String churchId, required String communityID}) async{//, int? type, String? cursor} ) async {
//   final FeedList resp = await super.rootService.feedService.getFeedList(churchId,communityID);//,type,cursor);
//   this.feedList = resp;
//   update();
// }

}
