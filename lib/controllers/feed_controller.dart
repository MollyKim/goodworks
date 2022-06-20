import 'package:get/get.dart';
import 'package:practice/controllers/root_contoller.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/services/feed/feed_list_model.dart';
import 'package:practice/services/feed/feed_model.dart';
import 'package:practice/services/root_service.dart';

class FeedController extends BaseController{
  FeedController(RootService rootService) : super(rootService);

  FeedList feedList = FeedList();
  Feed feed = Feed();
  UserController userController = Get.find();

  Future<void> getFeedListData({required String churchId}) async{
    String token = "Bearer ${userController.userSession}";
    final FeedList resp = await super.rootService.feedService.getFeedList(token,churchId);
    this.feedList = resp;
    update();
  }

  Future<void> getFeedDetail({
    required int churchId, required int communityID, required String feedID
  }) async {
    String token = "Bearer ${userController.userSession}";

    Feed resp = await super.rootService.feedService.getFeedDetailData(token,churchId,communityID,feedID);
    this.feed = resp;
    update();
  }


}