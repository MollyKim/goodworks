import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practice/layouts/default_noInternet.dart';
import 'package:get/get.dart';
import 'main.dart';
import 'package:practice/controllers/church_controller.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Init.instance.initialize(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              backgroundColor: Color(0xff2d9067),
              body: Center(
                child: SvgPicture.asset(
                  'assets/ic/ic_splash.svg',
                  //color: Colors.white,
                ),
              ),
            );
          }
          else if(snapshot.hasData) {
            print(snapshot.data);
            return Main();
          }
          else {
            print(snapshot.data);
            return DefaultNoInternetScreen();
          }
        }
    );

  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    ChurchController churchController = Get.find();

    //세션 검사 및 교회 정보 받아오기
    // await churchController.getChurchData(churchId: "1");
    return true;
  }
}