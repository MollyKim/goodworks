import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/themes/extensions.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF60A979),
            const Color(0xFF2E9067),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [



          SvgPicture.asset(
            'assets/img/img_logo.svg',
          ),
          const SizedBox(height: 90),
          Container(
            child: Text(
              "교회와 공동체\n그리고 나의 신앙을 세움",
              textAlign: TextAlign.center,
              style: context.textStyleCustom.copyWith(
                color: context.forest50,
                fontSize: 16,
              ),
            ),
          ),



          const SizedBox(height: 140),
          SizedBox(
            height: 50,
            width: 298,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  primary: context.forest50,
                ),
                onPressed: () {
                  Get.toNamed('/login_select_church');
                },
                child: Text(
                  "시작하기",
                  textAlign: TextAlign.center,
                  style: context.textStyleCustom.copyWith(
                      color: context.forest80,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                )),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '이미 계정이 있나요?',
                style: context.textStyleCustom.copyWith(
                  color: context.forest60,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/login_phone');
                },
                child: Text(
                  "로그인",
                  style: context.textStyleCustom.copyWith(
                    color: context.forest50,
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
