import 'dart:convert';

import 'package:practice/services/user/user_model.dart';
import 'package:practice/controllers/root_contoller.dart';
import 'package:practice/services/root_service.dart';

class UserController extends BaseController{
  UserController(RootService rootService) : super(rootService);

  UserModel userModel = UserModel();

  registerUser({
    required String email,required String userpwd,
    required String userName, required String phoneNumber
  }) async {

    final Map<String, dynamic> data = {"seumId": email, "password": userpwd,
      "userName": userName,"phoneNumber": phoneNumber};

    userModel = await super.rootService.loginService.registerUser(data);
    update();
  }

  loginUser(String email, String password) async{
    final formData = {'email': email, 'password': password,};
    userModel = await super.rootService.loginService.loginUser(formData);
    update();
    }


}