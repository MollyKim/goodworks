import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/bottomNavigationBarController.dart';

class DefaultBottomNaviBar extends StatelessWidget {
  const DefaultBottomNaviBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNaviController>( // init only first time
      builder: (s) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '기도'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '예배'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '공동체'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
              label: '나의 세움'
          ),
        ],
        unselectedLabelStyle: TextStyle(color: Colors.blue,fontSize: 14),
        selectedLabelStyle: TextStyle(color: Colors.pink,fontSize: 14),
        currentIndex: s.selectedIndex,
        onTap: (index) => s.onItemTapped(index),
        selectedItemColor: Colors.green,
        backgroundColor: Colors.grey,
      ),
    );
  }
  //
  // Widget bottomNaviBarItem(String title) {
  //   return Expanded(
  //     flex: 40,
  //     child: GestureDetector(
  //       onTap: () {
  //
  //       },
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Icon(Icons.add),
  //           // Image.asset(
  //           //   icon,
  //           //   fit: BoxFit.fill,
  //           // ),
  //           Text(
  //             title,
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // goToHomeViewFloatingActBtn() {
  //   return Container(
  //       margin: EdgeInsets.only(top: 35),
  //       child: FloatingActionButton(
  //         child: Text('Clone'),
  //         onPressed: () {},
  //       ));
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   // final theme = ThemeFactory.of(context).theme;
  //
  //   return Container(
  //     height: 60,
  //     decoration: BoxDecoration(
  //         // color: theme.secondaryBgColor,
  //         borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(30), topRight: Radius.circular(30)),
  //         boxShadow: [
  //           BoxShadow(
  //               color: Color(0xFF42000000), spreadRadius: 0, blurRadius: 10),
  //         ]),
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(30),
  //         topRight: Radius.circular(30),
  //       ),
  //       child: Row(
  //         children: [
  //           bottomNaviBarItem('홈'),
  //           bottomNaviBarItem('기도'),
  //           bottomNaviBarItem( '예배'),
  //           bottomNaviBarItem('공동체'),
  //           bottomNaviBarItem('나의 세움'),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}