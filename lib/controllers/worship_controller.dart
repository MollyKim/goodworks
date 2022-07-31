import 'package:practice/controllers/root_contoller.dart';
import 'package:practice/services/root_service.dart';
import 'package:practice/services/worship/worship_model.dart';

class WorshipController extends BaseController {
  WorshipController(RootService rootService) : super(rootService);

  WorshipTypeCreate worshipTypeCreate = WorshipTypeCreate();
  WorshipTypeList worshipTypeList = WorshipTypeList();
  WorshipTypeUpdate worshipTypeUpdate = WorshipTypeUpdate();
  WorshipTypePriorityUpdate worshipTypePriorityUpdate =
  WorshipTypePriorityUpdate();
  WorshipTypeDelete worshipTypeDelete = WorshipTypeDelete();
  WorshipList worshipList = WorshipList();
  WorshipDetail worshipDetail = WorshipDetail();
  WorshipCreate worshipCreate = WorshipCreate();
  WorshipUpdate worshipUpdate = WorshipUpdate();
  WorshipDelete worshipDelete = WorshipDelete();

  Future<void> getWorshipTypeData({required String churchId}) async {
    final WorshipTypeList resp = await super
        .rootService
        .worshipService
        .getWorshipTypeList(churchId); //,type,cursor);
    this.worshipTypeList = resp;
    update();
  }

  Future<void> postWorshipTypeCreate(
      {required String churchId, required String title}) async {
    final Map<String, dynamic> data = {"title": title};

    final WorshipTypeCreate resp = await super
        .rootService
        .worshipService
        .postWorshipTypeCreate(churchId, data); //,type,cursor);
    this.worshipTypeCreate = resp;
    update();
  }

  Future<void> putWorshipTypeUpdate(
      {required String churchId, worshipTypeId, title}) async {
    final Map<String, dynamic> data = {
      "worshipTypeId": worshipTypeId,
      "title": title
    };

    final WorshipTypeUpdate resp = await super
        .rootService
        .worshipService
        .putWorshipTypeUpdate(churchId, data); //,type,cursor);
    this.worshipTypeUpdate = resp;
    update();
  }

  ///체크 List
  Future<void> putWorshipTypePriorityUpdate(
      {required String churchId, worshipTypeIds}) async {
    final Map<String, dynamic> data = {
      "worshipTypeIds": worshipTypeIds,
    };

    final WorshipTypePriorityUpdate resp = await super
        .rootService
        .worshipService
        .putWorshipTypePriorityUpdate(churchId, data); //,type,cursor);
    this.worshipTypePriorityUpdate = resp;
    update();
  }

  Future<void> deleteWorshipTypeDelete(
      {required String churchId, worshipTypeId}) async {
    final Map<String, dynamic> data = {
      "worshipTypeId": worshipTypeId,
    };

    final WorshipTypeDelete resp = await super
        .rootService
        .worshipService
        .deleteWorshipTypeDelete(churchId, data); //,type,cursor);
    this.worshipTypeDelete = resp;
    update();
  }

  Future<void> getWorshipData({required String churchId}) async {
    final WorshipList resp = await super
        .rootService
        .worshipService
        .getWorshipList(churchId); //,type,cursor);
    this.worshipList = resp;
    update();
  }

  Future<void> getWorshipDetailData({required String churchId,
    required String worshipId}) async {
    final WorshipDetail resp = await super
        .rootService
        .worshipService
        .getWorshipDetail(churchId, worshipId); //,type,cursor);
    this.worshipDetail = resp;
    update();
  }

  Future<void> postWorshipCreate(
      {required String churchId, required String title, preacher,
        required String worshipTypeId, required String videoId, content, required String worshipDate}) async {
    final Map<String, dynamic> data = {"title": title,
      "preacher": preacher,
      "worshipTypeId": worshipTypeId,
      "videoId": videoId,
      "content": content,
      "worshipDate": worshipDate,
    };

    final WorshipCreate resp = await super
        .rootService
        .worshipService
        .postWorshipCreate(churchId, data); //,type,cursor);
    this.worshipCreate = resp;
    update();
  }

  Future<void> putWorshipUpdate(
      {required String churchId, required String worshipId, title,
        preacher, worshipTypeId, videoId, content, worshipDate
      }) async {
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
        .putWorshipUpdate(churchId, worshipId, data); //,type,cursor);
    this.worshipUpdate = resp;
    update();
  }

  Future<void> deleteWorshipDelete(
      {required String churchId, required String worshipId}) async {
    final WorshipDelete resp = await super
        .rootService
        .worshipService
        .deleteWorshipDelete(churchId, worshipId); //,type,cursor);
    this.worshipDelete = resp;
    update();
  }
}

