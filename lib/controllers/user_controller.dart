import 'package:practice/services/user/user_model.dart';
import 'package:practice/controllers/root_contoller.dart';
import 'package:practice/services/root_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends BaseController {
  UserController(RootService rootService) : super(rootService);

  UserModel userModel = UserModel();
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

  registerUser(
      {required String email,
      required String userpwd,
      required String userName,
      required String phoneNumber}) async {
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
}
