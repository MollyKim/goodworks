import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/layouts/default_layout.dart';

class LoginWelcome extends StatefulWidget {
  const LoginWelcome({Key? key}) : super(key: key);

  @override
  _LoginWelcomeState createState() => _LoginWelcomeState();
}

class _LoginWelcomeState extends State<LoginWelcome> {
  renderUserPicture() {
    return Container(
      child: SvgPicture.asset(
        'assets/img/img_user_picture.svg',
        width: 180,
        height: 180,
        // fit: BoxFit.none,
      ),
    );
  }

  renderText() {
    return SizedBox(
      width: 273,
      height: 68,
      child: Text(
        "샬롬! {churchName} 세움에 오신\n{userName} 성도님을 환영합니다.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xff2d9067),
          fontSize: 18,
          fontFamily: "Apple SD Gothic Neo",
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  renderBottomButton() {
    return SizedBox(
      height: 50,
      width: 315,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
            primary: Color(0xff2d9067),
          ),
          onPressed: () {
            Get.toNamed('/home');
          },
          child: Text(
            "입장하기",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "AppleSDGothicNeo",
              fontWeight: FontWeight.w500,
              letterSpacing: 1.80,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 90,
              ),
              renderUserPicture(),
              Container(
                height: 35,
              ),
              renderText(),
              Container(
                height: 60,
              ),
              renderBottomButton()
            ],
          ),
        ),
      ),
    );
  }
}
