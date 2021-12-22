import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/bottomNavigationBarController.dart';
import 'package:practice/controllers/login_controller.dart';
import 'package:practice/screens/community/community_post_detail.dart';
import 'package:practice/screens/community/write_community_post.dart';
import 'package:practice/screens/home/home.dart';
import 'package:practice/screens/login/login.dart';
import 'package:practice/screens/login/login_fail.dart';
import 'package:practice/screens/login/login_id.dart';
import 'package:practice/screens/login/login_phone.dart';
import 'package:practice/screens/login/login_select_church.dart';
import 'package:practice/screens/login/login_sign_up.dart';
import 'package:practice/screens/login/login_welcome.dart';
import 'package:practice/screens/main.dart';
import 'package:practice/screens/menu/menu.dart';
import 'package:practice/screens/menu/password_reset.dart';
import 'package:practice/screens/menu/profile.dart';
import 'package:practice/screens/menu/setting.dart';
import 'package:practice/screens/splash.dart';
import 'package:practice/screens/worship/player.dart';
import 'package:practice/screens/worship/worship.dart';
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
        name: '/worship',
        page: () => Worship(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/player',
        page: () => Player(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/menu',
        page: () => Menu(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/profile',
        page: () => Profile(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/setting',
        page: () => Setting(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/password_reset',
        page: () => PasswordReset(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/login',
        page: () => Login(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/login_phone',
        page: () => LoginPhone(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/login_id',
        page: () => LoginID(),
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
        name: '/write_community_post',
        page: () => WriteCommunityPost(),
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
    return FutureBuilder(
      future: Init.instance.initialize(),
    builder: (context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return MaterialApp(home: Splash());
      }
      else {
        return  GetMaterialApp(
          title: 'FlutterStudy',
          initialRoute: '/login',
          debugShowCheckedModeBanner: false,
          getPages: renderPages(),
        );
      }
    }
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 2));
  }
}