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

class _MainState extends State<Main> {
  UserModel? result;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNaviController>(
        init: BottomNaviController(),
        builder: (controller) {
          return DefaultLayout(
            body: IndexedStack(
              index: controller.selectedIndex,
              children: <Widget>[
                Home(),
                Worship(),
                Pray(),
                Community(),
                Menu(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedFontSize: 0,
              unselectedFontSize: 0,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: <BottomNavigationBarItem>[
                bottomStyle('assets/ic/ic_home', controller.selectedIndex, 0),
                bottomStyle(
                    'assets/ic/ic_worship', controller.selectedIndex, 1),
                bottomStyle('assets/ic/ic_pray', controller.selectedIndex, 2),
                bottomStyle(
                    'assets/ic/ic_community', controller.selectedIndex, 3),
                bottomStyle('assets/ic/ic_my', controller.selectedIndex, 4),
              ],
              currentIndex: controller.selectedIndex,
              onTap: controller.onItemTapped,
              backgroundColor: Colors.white,
            ),
          );
        });
  }

  bottomStyle(String icon, int selectedIndex, int myIndex) {
    return BottomNavigationBarItem(
      icon: myIndex == selectedIndex
          ? Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SvgPicture.asset(icon + "_active.svg"),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SvgPicture.asset(icon + ".svg"),
            ),
      label: "",
    );
  }
}
