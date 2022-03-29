import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/screens/login/login.dart';

class LoginFail extends StatefulWidget {
  const LoginFail({Key? key}) : super(key: key);

  @override
  _LoginFailState createState() => _LoginFailState();
}

class _LoginFailState extends State<LoginFail> {
  renderTitleText() {
    return SizedBox(
      width: 315,
      child: Text(
        "죄송합니다...",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xff2d9067),
          fontSize: 24,
          fontFamily: "Apple SD Gothic Neo",
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  renderUserPicture() {
    return Container(
      child: SvgPicture.asset(
        'assets/img/img_fail.svg',
        width: 140,
        height: 170,
        // fit: BoxFit.none,
      ),
    );
  }

  renderText() {
    return SizedBox(
      width: 315,
      child: Text(
        "입력하신 휴대폰 번호로는\n교인 정보를 찾을 수 없습니다. \n로그인하려면 본 교회에 문의 부탁드립니다.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xff2d9067),
          fontSize: 14,
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
            Get.offAll(Login());
          },
          child: Text(
            "확인",
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
              renderTitleText(),
              Container(
                height: 25,
              ),
              renderUserPicture(),
              Container(
                height: 50,
              ),
              renderText(),
              Container(
                height: 30,
              ),
              renderBottomButton()
            ],
          ),
        ),
      ),
    );
  }
}
