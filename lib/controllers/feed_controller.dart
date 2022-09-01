import 'package:get/get.dart';
import 'package:practice/controllers/root_contoller.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/services/feed/feed_list_model.dart';
import 'package:practice/services/feed/feed_model.dart';
import 'package:practice/services/root_service.dart';

class FeedController extends BaseController{
  FeedController(RootService rootService) : super(rootService);

  FeedList feedList = FeedList();
  List<FeedListResultData>? feeds = [];
  Feed feed = Feed();
  UserController userController = Get.find();
  List<String> images = [];
  bool isLast = false;

  getImagesOnly() {
    if(feeds != null && feeds!.length != 0)
    feeds!.forEach((element) {
      element.attachments?.forEach((element) {
        if(element.attachType == "image" && element.fileInfo.url != null) {
          images.add(element.fileInfo.url!);
        }
      });
    });
  }


  Future<void> getFeedListData({required int churchId}) async{
    String token = "Bearer ${userController.userSession}";
    String cursor = feedList.cursor ?? "";
    final FeedList resp = await super.rootService.feedService.getFeedList(token,churchId,cursor);
    this.feedList = resp;
    feeds?.addAll(feedList.resultData!);
    if(feedList.resultData!.isEmpty) isLast = true;
    update();
  }

  Future<void> getFeedListRefresh({required int churchId}) async{
    String token = "Bearer ${userController.userSession}";

    final FeedList resp = await super.rootService.feedService.getFeedList(token,churchId,"");
    this.feedList = resp;
    feeds?.clear();
    feeds?.addAll(feedList.resultData!);
    isLast = false;
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