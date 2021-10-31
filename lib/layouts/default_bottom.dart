import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/bottomNavigationBarController.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultBottomNaviBar extends StatelessWidget {
  const DefaultBottomNaviBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNaviController>( // init only first time
      builder: (s) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          bottomStyle('assets/ic/ic_home.svg'),
          bottomStyle('assets/ic/ic_pray.svg'),
          bottomStyle('assets/ic/ic_worship.svg'),
          bottomStyle('assets/ic/ic_community.svg'),
          bottomStyle('assets/ic/ic_my.svg'),
        ],
        currentIndex: s.selectedIndex,
        onTap: (index) => s.onItemTapped(index),
        backgroundColor: Colors.white,
      ),
    );
  }

  bottomStyle(String icon){
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(icon),
      label:"",
    );
  }

}

