import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/bottomNavigationBarController.dart';
import 'package:practice/controllers/church_controller.dart';
import 'package:practice/controllers/community_controller.dart';
import 'package:practice/controllers/feed_controller.dart';
import 'package:practice/controllers/pray_controller.dart';
import 'package:practice/controllers/user_controller.dart';
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
import 'package:practice/screens/pray/pray.dart';
import 'package:practice/screens/pray/pray_community_post.dart';
import 'package:practice/screens/pray/pray_post_correction.dart';
import 'package:practice/screens/splash.dart';
import 'package:practice/screens/worship/player.dart';
import 'package:practice/screens/worship/worship.dart';
import 'package:practice/services/root_service.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'screens/home/post_detail.dart';

void main() {
  timeago.setLocaleMessages('ko', timeago.KoMessages());

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
    Get.put(UserController(service));
    Get.put(BottomNaviController());
    Get.put(ChurchController(service));
    Get.put(CommunityController(service));
    Get.put(FeedController(service));
    Get.put(PrayController(service));
  }

  initService() {
    RootService rootService = RootService();
    return rootService;
  }

  List<GetPage> renderPages() {
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
        name: '/pray',
        page: () => Pray(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/pray_community_post',
        page: () => PrayCommunityPost(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: '/pray_post_correction',
        page: () => PrayPostCorrection(),
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
      GetPage(
        name: '/splash',
        page: () => Splash(),
        transition: Transition.rightToLeft,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/splash', //'/splash',
      debugShowCheckedModeBanner: false,
      getPages: renderPages(),
    );
  }
}
