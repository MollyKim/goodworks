import 'package:practice/controllers/root_contoller.dart';
import 'package:practice/services/feed/feed_model.dart';
import 'package:practice/services/root_service.dart';

class FeedController extends BaseController{
  FeedController(RootService rootService) : super(rootService);

  Feed feedData = Feed();

  Future<Feed> getFeedData({required String churchId, required String communityID}) async {
    final Feed resp = await super.rootService.feedService.getFeedList(churchId,communityID);
    this.feedData = resp;
    update();
    return resp;
  }

}