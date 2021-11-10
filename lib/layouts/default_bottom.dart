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
          bottomStyle('assets/ic/ic_home',s.selectedIndex,0),
          bottomStyle('assets/ic/ic_pray',s.selectedIndex,1),
          bottomStyle('assets/ic/ic_worship',s.selectedIndex,2),
          bottomStyle('assets/ic/ic_community',s.selectedIndex,3),
          bottomStyle('assets/ic/ic_my',s.selectedIndex,4),
        ],
        currentIndex: s.selectedIndex,
        onTap: (index) => s.onItemTapped(index),
        backgroundColor: Colors.white,
      ),
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

