import 'package:get/get.dart';
import 'package:practice/controllers/root_contoller.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/services/root_service.dart';
import 'package:practice/services/worship/worship_model.dart';

class WorshipController extends BaseController {
  WorshipController(RootService rootService) : super(rootService);

  UserController userController = Get.find();
  WorshipTypeCreate worshipTypeCreate = WorshipTypeCreate();
  WorshipTypeList worshipTypeList = WorshipTypeList();
  WorshipTypeUpdate worshipTypeUpdate = WorshipTypeUpdate();
  WorshipTypePriorityUpdate worshipTypePriorityUpdate = WorshipTypePriorityUpdate();
  WorshipTypeDelete worshipTypeDelete = WorshipTypeDelete();
  WorshipList worshipList = WorshipList();
  WorshipDetail worshipDetail = WorshipDetail();
  WorshipCreate worshipCreate = WorshipCreate();
  WorshipUpdate worshipUpdate = WorshipUpdate();
  WorshipDelete worshipDelete = WorshipDelete();

  Future<void> getWorshipTypeData(String token, {required String churchId}) async {
    String headerToken = "Bearer $token";

    final WorshipTypeList resp =
        await super.rootService.worshipService.getWorshipTypeList(headerToken, churchId); //,type,cursor);
    this.worshipTypeList = resp;

    update();
  }

  Future<void> postWorshipTypeCreate(String token, {required String churchId, required String title}) async {
    String headerToken = "Bearer $token";

    final Map<String, dynamic> data = {"title": title};

    final WorshipTypeCreate resp =
        await super.rootService.worshipService.postWorshipTypeCreate(headerToken, churchId, data); //,type,cursor);
    this.worshipTypeCreate = resp;
    update();
  }

  Future<void> putWorshipTypeUpdate(String token, {required String churchId, worshipTypeId, title}) async {
    String headerToken = "Bearer $token";

    final Map<String, dynamic> data = {"worshipTypeId": worshipTypeId, "title": title};

    final WorshipTypeUpdate resp =
        await super.rootService.worshipService.putWorshipTypeUpdate(headerToken, churchId, data); //,type,cursor);
    this.worshipTypeUpdate = resp;
    update();
  }

  ///체크 List
  Future<void> putWorshipTypePriorityUpdate(String token, {required String churchId, worshipTypeIds}) async {
    String headerToken = "Bearer $token";

    final Map<String, dynamic> data = {
      "worshipTypeIds": worshipTypeIds,
    };

    final WorshipTypePriorityUpdate resp = await super
        .rootService
        .worshipService
        .putWorshipTypePriorityUpdate(headerToken, churchId, data); //,type,cursor);
    this.worshipTypePriorityUpdate = resp;
    update();
  }

  Future<void> deleteWorshipTypeDelete(String token, {required String churchId, worshipTypeId}) async {
    String headerToken = "Bearer $token";

    final Map<String, dynamic> data = {
      "worshipTypeId": worshipTypeId,
    };

    final WorshipTypeDelete resp =
        await super.rootService.worshipService.deleteWorshipTypeDelete(headerToken, churchId, data); //,type,cursor);
    this.worshipTypeDelete = resp;
    update();
  }

  Future<void> getWorshipData(String token, {required String churchId}) async {
    String headerToken = "Bearer $token";

    final WorshipList resp =
        await super.rootService.worshipService.getWorshipList(headerToken, churchId); //,type,cursor);
    this.worshipList = resp;
    update();
  }

  Future<void> getWorshipDetailData({required String churchId, required String worshipId}) async {
    String token = "Bearer ${userController.userSession}";

    final WorshipDetail resp =
        await super.rootService.worshipService.getWorshipDetail(token, churchId, worshipId); //,type,cursor);
    this.worshipDetail = resp;
    update();
  }

  Future<void> postWorshipCreate(String token,
      {required String churchId,
      required String title,
      preacher,
      required String worshipTypeId,
      required String videoId,
      content,
      required String worshipDate}) async {
    String headerToken = "Bearer $token";

    final Map<String, dynamic> data = {
      "title": title,
      "preacher": preacher,
      "worshipTypeId": worshipTypeId,
      "videoId": videoId,
      "content": content,
      "worshipDate": worshipDate,
    };

    final WorshipCreate resp =
        await super.rootService.worshipService.postWorshipCreate(headerToken, churchId, data); //,type,cursor);
    this.worshipCreate = resp;
    update();
  }

  Future<void> putWorshipUpdate(String token,
      {required String churchId,
      required String worshipId,
      title,
      preacher,
      worshipTypeId,
      videoId,
      content,
      worshipDate}) async {
    String headerToken = "Bearer $token";

    final Map<String, dynamic> data = {
      "title": title,
      "preacher": preacher,
      "worshipTypeId": worshipTypeId,
      "videoId": videoId,
      "content": content,
      "worshipDate": worshipDate,
    };

    final WorshipUpdate resp = await super
        .rootService
        .worshipService
        .putWorshipUpdate(headerToken, churchId, worshipId, data); //,type,cursor);
    this.worshipUpdate = resp;
    update();
  }

  Future<void> deleteWorshipDelete(String token, {required String churchId, required String worshipId}) async {
    String headerToken = "Bearer $token";

    final WorshipDelete resp =
        await super.rootService.worshipService.deleteWorshipDelete(headerToken, churchId, worshipId); //,type,cursor);
    this.worshipDelete = resp;
    update();
  }
}
