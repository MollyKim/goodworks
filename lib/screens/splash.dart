import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/layouts/default_noInternet.dart';
import 'package:get/get.dart';
import 'package:practice/screens/login/login.dart';
import 'main.dart';
import 'package:practice/controllers/church_controller.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late final Future callApis;

  @override
  void initState() {
    callApis = initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: callApis,
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
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null && snapshot.data == true) {
              return Main();
            } else {
              return Login();
            }
          } else {
            return DefaultNoInternetScreen();
          }
        });
  }

  Future initialize() async {
    UserController userController = Get.find();
    await userController.getSession();

    print("session : ${userController.userSession}");
    try {
      if (userController.userSession != null) {
        ChurchController churchController = Get.find();
        String token = "Bearer ${userController.userSession}";
        await userController.loginUser("tester1", "asdf1234");

        await churchController.getChurchData(token,
            churchId: churchController.churchModel.resultData?.id ?? 1);
        if (userController.userModel.resultCode == "0000")
          return true;
        else
          return false;
      }
      else return false;
    } catch (e) {
      print("error!! in splash : $e");
    }

  }
}
