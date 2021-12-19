import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/bottomNavigationBarController.dart';
import 'package:practice/controllers/login_controller.dart';
import 'package:practice/screens/community/community_post_detail.dart';
import 'package:practice/screens/home/home.dart';
import 'package:practice/screens/login/login.dart';
import 'package:practice/screens/login/login_fail.dart';
import 'package:practice/screens/login/login_select_church.dart';
import 'package:practice/screens/login/login_sign_up.dart';
import 'package:practice/screens/login/login_welcome.dart';
import 'package:practice/screens/main.dart';
import 'screens/home/post_detail.dart';
import 'package:practice/services/root_service.dart';

void main() {
  runApp(Root());
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  void initState() {
    super.initState();

    initControllers();
  }

  initControllers() {
    final service = initService();
    Get.put(LoginController(service));
    Get.put(BottomNaviController());
  }

  initService() {
    RootService rootService = RootService();
    return rootService;
  }

  List<GetPage> renderPages() {
    final services = initService();

    return [
      GetPage(
        name: '/',
        page: () => Main(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/home',
        page: () => Home(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/home_post_detail',
        page: () => HomePostDetail(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/login',
        page: () => Login(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/login_select_church',
        page: () => LoginSelectChurch(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/community_post_detail',
        page: () => CommunityPostDetail(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/login_sign_up',
        page: () => LoginSignUp(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/login_fail',
        page: () => LoginFail(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/login_welcome',
        page: () => LoginWelcome(),
        transition: Transition.rightToLeft,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FlutterStudy',
      initialRoute: '/login',
      debugShowCheckedModeBanner: false,
      getPages: renderPages(),
    );
  }
}
