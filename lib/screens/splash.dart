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
  @override
  void initState() {

    super.initState();
  }

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
          else if(snapshot.connectionState == ConnectionState.done) {
            print(snapshot.hasData);print(snapshot.data);print("0000000");
            if(snapshot.data != null) {
              return Main();
            }
           else{
              return Login();
            }
          }
          else {
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

    UserController userController = Get.find();
    await userController.getSession();

    print("session : ${userController.userSession}");
    try {
      if (userController.userSession != null) {
        ChurchController churchController = Get.find();
        String token = "Bearer ${userController.userSession}";

        await churchController.getChurchData(token, churchId: "1");
        await userController.loginUser("drumgrammer", "abcd1234ABCD");
      }
    } catch(e) {
      print("error in splash : $e");
    }
    return userController.userSession;
  }
}
