import 'package:practice/services/user/user_model.dart';
import 'package:practice/controllers/root_contoller.dart';
import 'package:practice/services/root_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends BaseController {
  UserController(RootService rootService) : super(rootService);

  UserModel userModel = UserModel();
  UserOutModel userOutModel = UserOutModel();
  String? userSession;

  SharedPreferences? _sharedPreferences;

  getSession() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    userSession = _sharedPreferences?.getString('session');
  }

  logout() async {
    await _sharedPreferences?.remove("session");
    update();
  }

  sendOTP(String id, String phoneNumber) async {
    final Map<String, dynamic> data = {"seumId": id, "phoneNumber": phoneNumber};
    await super.rootService.loginService.sendOTP(data);
  }

  validateOTP(String id, String phoneNumber, String otp) async {
    final Map<String, dynamic> data = {
      "seumId": id,
      "phoneNumber": phoneNumber,
      "otp": int.parse(otp),
    };
    await super.rootService.loginService.validateOTP(data);
  }

  registerUser(
      {required String email, required String userpwd, required String userName, required String phoneNumber}) async {
    final Map<String, dynamic> data = {
      "seumId": email,
      "password": userpwd,
      "userName": userName,
      "phoneNumber": phoneNumber
    };

    userModel = await super.rootService.loginService.registerUser(data);
    userSession = userModel.resultData?.tokens?[0];
    if (userSession != null) {
      _sharedPreferences?.setString('session', userSession!);
    }
    update();
  }

  loginUser(String email, String password) async {
    final formData = {
      'seumId': email,
      'password': password,
    };
    userModel = await super.rootService.loginService.loginUser(formData);
    userSession = userModel.resultData?.tokens?[0];
    if (userSession != null) {
      _sharedPreferences?.setString('session', userSession!);
    }
    update();
  }

  outUser(String userId) async {
    userOutModel = await super.rootService.loginService.outUser(userId);

    update();
  }
}
