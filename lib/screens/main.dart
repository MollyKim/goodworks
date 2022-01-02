import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/bottomNavigationBarController.dart';
import 'package:practice/layouts/default_bottom.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/models/login_model.dart';
import 'package:practice/screens/community/community.dart';
import 'package:practice/screens/home/home.dart';
import 'package:practice/screens/menu/menu.dart';
import 'package:practice/screens/pray/pray.dart';
import 'package:practice/screens/worship/worship.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

// Future<PostLoginInfoModel?> login() async{
//   final LoginController loginController = Get.find();
//   final PostLoginInfoModel? resp = await loginController.loginInfos(
//     uid: 'phil',
//     passwd: 'qweqwe123',);
// return resp;
// }

class _MainState extends State<Main> {
  PostLoginInfoModel? result;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      bottomNavigationBar: DefaultBottomNaviBar(),
      body: GetBuilder<BottomNaviController>(
        init: BottomNaviController(),
        builder: (s) => IndexedStack(
          index: s.selectedIndex,
          children: <Widget>[
            Home(),
            Worship(),
            Pray(),
            Community(),
            Menu(),
          ],
        ),
      ),
    );
  }
}
