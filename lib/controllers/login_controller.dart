import 'package:practice/services/user/user_model.dart';
import 'package:practice/controllers/root_contoller.dart';
import 'package:practice/services/root_service.dart';

class LoginController extends BaseController{
  LoginController(RootService rootService) : super(rootService);

  UserModel userModel = UserModel();

  registerUser({
    required String email,required String userpwd,
    required String userName, required String phoneNumber
  }) async {
    final formData = {'seumId': email, 'password': userpwd,
      'userName': userName,'phoneNumber': phoneNumber};

    userModel = await super.rootService.loginService.registerUser(formData);
    update();
  }


}