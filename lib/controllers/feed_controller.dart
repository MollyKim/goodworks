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

  Future<void> getFeedListData({required String churchId, required String communityID}) async{//, int? type, String? cursor} ) async {
    Map<String, dynamic> headers = {
      'Authorization' : userController.userSession,
    };
    final FeedList resp = await super.rootService.feedService.getFeedList(headers,churchId);//,type,cursor);
    this.feedList = resp;
    update();
  }

  Future<void> getFeedDetail({
    required String churchId, required String communityID, required String feedID
  }) async {
    Map<String, dynamic> headers = {
      'Authorization' : userController.userSession,
    };
    Feed resp = await super.rootService.feedService.getFeedDetailData(headers,churchId,communityID,feedID);
    this.feed = resp;
    update();
  }


}