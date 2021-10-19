import 'package:practice/models/login_model.dart';
import 'package:practice/controllers/root_contoller.dart';
import 'package:practice/services/root_service.dart';

class LoginController extends BaseController{
  LoginController(RootService rootService) : super(rootService);

  Future<PostLoginInfoModel?> loginInfos({
    required String uid,required String passwd,
    }) async {
    final formData = {'userid': uid, 'userpw': passwd, 'regcode': 5,};

    final PostLoginInfoModel resp = await super.rootService.loginService.postLoginIngoBody(formData);
    print("resp.RESP_CD : ${resp.RESP_CD}");
    print("resp.RESP_CD : ${resp.RESP_DATA}");
    print("resp.RESP_CD : ${resp.RESP_HOST}");
    update();
    return resp;
  }
}