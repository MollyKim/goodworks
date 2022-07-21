import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice/controllers/community_controller.dart';

class WriteCommunityController extends GetxController{
  CommunityController communityController = Get.find();


  List<XFile>? images = [];
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController contentTextEditingController = TextEditingController();

  Future<void> postCommunityPost( int churchId, Map<String,dynamic> body ) async{

    await communityController.postCommunityPost(churchId,body);
  }

}