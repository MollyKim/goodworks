import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/bottomNavigationBarController.dart';
import 'package:practice/controllers/login_controller.dart';
import 'package:practice/controllers/status_bar.dart';
import 'package:practice/layouts/default_bottom.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/models/login_model.dart';
import 'package:practice/screens/community/community.dart';
import 'package:practice/screens/home/home.dart';
import 'package:practice/services/root_service.dart';

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
            Center(
              child: Text(s.selectedIndex.toString()),
            ),
            Center(
              child: Text(s.selectedIndex.toString()),
            ),
            Community(),
            Center(
              child: Text(s.selectedIndex.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
