import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/layouts/default_layout.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // margin: EdgeInsets.only(right: 10),
            // padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              'assets/img/img_logo.svg',
              // color: Colors.amberAccent,
              width: 105,
              height: 109,
            ),
          ),
          Container(
            height: 16,
          ),
          Container(
            child: Text(
              "교회와 공동체\n그리고 나의 신앙을 세움",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff2d9067),
                fontSize: 18,
                fontFamily: "AppleSDGothicNeo",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            height: 16,
          ),
          Column(
            children: [
              Center(
                child: SizedBox(
                  height: 50,
                  width: 180,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        primary: Color(0xff2d9067),
                      ),
                      onPressed: () {
                        Get.toNamed('/login_select_church');
                      },
                      child: Text(
                        "시작하기",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "AppleSDGothicNeo",
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.80,
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '이미 계정이 있나요?',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed('/login_phone');
                    },
                    child: Text(
                      "로그인",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xff2d9067),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    ));
  }
}
