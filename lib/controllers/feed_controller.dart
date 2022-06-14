import 'package:practice/controllers/root_contoller.dart';
import 'package:practice/services/feed/feed_list_model.dart';
import 'package:practice/services/feed/feed_model.dart';
import 'package:practice/services/root_service.dart';

class FeedController extends BaseController{
  FeedController(RootService rootService) : super(rootService);

  FeedList feedList = FeedList();
  Feed feed = Feed();

  Future<void> getFeedListData({required String churchId, required String communityID}) async{//, int? type, String? cursor} ) async {
    final FeedList resp = await super.rootService.feedService.getFeedList(churchId);//,type,cursor);
    this.feedList = resp;
    update();
  }

  Future<void> getFeedDetail({
    required String churchId, required String communityID, required String feedID
  }) async {
    Feed resp = await super.rootService.feedService.getFeedDetailData(churchId,communityID,feedID);
    this.feed = resp;
    update();
  }


}