import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/bottomNavigationBarController.dart';
import 'package:practice/controllers/login_controller.dart';
import 'package:practice/layouts/default_bottom.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/models/login_model.dart';
import 'package:practice/services/root_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

Future<PostLoginInfoModel?> login() async{
  final LoginController loginController = Get.find();
  final PostLoginInfoModel? resp = await loginController.loginInfos(
    uid: 'phil',
    passwd: 'qweqwe123',);
return resp;
}

class _HomeState extends State<Home> {
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
            Center(
              child: Text(s.selectedIndex.toString()),
            ),
            Center(
              child: Text(s.selectedIndex.toString()),
            ),
            Center(
              child: Text(s.selectedIndex.toString()),
            ),
            Center(
              child: Text(s.selectedIndex.toString()),
            ),
            Center(
              child: Text(s.selectedIndex.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
