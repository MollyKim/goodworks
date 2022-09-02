import 'package:get/get.dart';
import 'package:practice/controllers/root_contoller.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/services/community/community_model.dart';
import 'package:practice/services/root_service.dart';

class CommunityController extends BaseController {
  CommunityController(RootService rootService) : super(rootService);

  CommunityUserModel communityUserList = CommunityUserModel();
  CommunityModel communityList = CommunityModel();
  UserController userController = Get.find();

  RxList? communityUserNameList;

  Future<void> getCommunityListData({required String churchId}) async {
    String token = "Bearer ${userController.userSession}";
    this.communityList = await super.rootService.communityService.getCommunityList(token,3, 1, churchId);
    update();
  }

  Future<void> getCommunityDetail({required String churchId, required String communityId}) async {
    String token = "Bearer ${userController.userSession}";
    this.communityList = await super.rootService.communityService.getCommunityDetail(token, churchId, communityId);
    update();
  }

  Future<void> getCommunityUserList({required String churchId, required String communityId}) async {
    String token = "Bearer ${userController.userSession}";
    this.communityUserList =
        await super.rootService.communityService.getCommunityUserList(token, churchId, communityId);
    update();
  }

  Future<void> getCommunityUserListTwo({required String churchId, required String communityId}) async {
    String token = "Bearer ${userController.userSession}";
    this.communityUserList =
        await super.rootService.communityService.getCommunityUserListTwo(token, churchId, communityId);
    update();
  }

  Future<String?> postCommunityPost(int churchId, body) async {
    String token = "Bearer ${userController.userSession}";

    var resp = await super.rootService.communityService.postCommunityPost(token, churchId, body);
    return resp.resultCode;
  }
}
