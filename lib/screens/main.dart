import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/bottomNavigationBarController.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/services/user/user_model.dart';
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
  UserModel? result;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNaviController>(
        init: BottomNaviController(),
        builder: (controller) {
        return DefaultLayout(
            body: IndexedStack(
              index: 0,
              children: <Widget>[
                Home(),
                Worship(),
                Pray(),
                Community(),
                Menu(),
              ],
            ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              bottomStyle('assets/ic/ic_home',controller.selectedIndex,0),
              bottomStyle('assets/ic/ic_worship',controller.selectedIndex,1),
              bottomStyle('assets/ic/ic_pray',controller.selectedIndex,2),
              bottomStyle('assets/ic/ic_community',controller.selectedIndex,3),
              bottomStyle('assets/ic/ic_my',controller.selectedIndex,4),
            ],
            currentIndex: controller.selectedIndex,
            onTap: controller.onItemTapped,
            backgroundColor: Colors.white,
          ),
        );
      }
    );
  }
  bottomStyle(String icon,int selectedIndex,int myIndex){
    return BottomNavigationBarItem(
      icon: myIndex == selectedIndex
          ? SvgPicture.asset(icon+"_active.svg")
          : SvgPicture.asset(icon+".svg"),
      label:"",
    );
  }
}
