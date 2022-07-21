import 'package:get/get.dart';
import 'package:practice/controllers/root_contoller.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/services/community/community_model.dart';
import 'package:practice/services/root_service.dart';

class CommunityController extends BaseController{
  CommunityController(RootService rootService) : super(rootService);

  CommunityModel communityList = CommunityModel();
  UserController userController = Get.find();


  Future<void> getCommunityListData({required int churchId}) async{
    String token = "Bearer ${userController.userSession}";
    this.communityList  = await super.rootService.communityService.getCommunityList(token,churchId);
    update();
  }

  Future<void> getCommunityDetail({required String churchId, required String communityId}) async{
    String token = "Bearer ${userController.userSession}";
    this.communityList  = await super.rootService.communityService.getCommunityDetail(token,churchId,communityId);
    update();
  }

  Future<void> postCommunityPost( int churchId, Map<String,dynamic> body ) async{
    String token = "Bearer ${userController.userSession}";

    await super.rootService.communityService.postCommunityPost(token,churchId,body);
  }
}
