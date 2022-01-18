import 'package:practice/models/user_model.dart';
import 'package:practice/controllers/root_contoller.dart';
import 'package:practice/services/root_service.dart';

class LoginController extends BaseController{
  LoginController(RootService rootService) : super(rootService);

  Future<UserModel?> loginInfos({
    required String useremail,required String userpwd,
    required String username, required String phone
    }) async {
    final formData = {'useremail': useremail, 'userpwd': userpwd,
      'username': username,'phone': phone};

    final UserModel resp = await super.rootService.loginService.postLoginIngoBody(formData);
    print("resp.trId : ${resp.trId}");
    print("resp.resultMsg : ${resp.resultMsg}");
    print("resp.resultCode : ${resp.resultCode}");
    print("resp.resultData : ${resp.resultData}");
    update();
    return resp;
  }

  Future<UserModel?> registerUser({
    required String email,required String userpwd,
    required String userName, required String phoneNumber
  }) async {
    final formData = {'useremail': email, 'userpwd': userpwd,
      'username': userName,'phone': phoneNumber};

    final UserModel resp = await super.rootService.loginService.registerUser(formData);
    update();
    return resp;
  }


}