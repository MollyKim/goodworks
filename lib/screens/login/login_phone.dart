import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/layouts/default_layout.dart';

class LoginPhone extends StatefulWidget {
  @override
  _LoginPhoneState createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<LoginPhone> {
  bool signUpFlag = false;
  bool phoneFlag = false;
  bool phoneOTPFlag = false;

  int timerMaxSeconds = 180;
  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(1, '0')}:${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  final interval = const Duration(seconds: 1);
  late Timer timer;

  startTimeout(int milliseconds) {
    var duration = interval;
    timer = Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick > 179) {
          currentSeconds = 180;
        }
        if (currentSeconds >= milliseconds) timer.cancel();
      });
    });
  }

  renderPhone() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            // width: 346,
            child: Text(
              "휴대폰 번호를 인증하여 로그인합니다.",
              style: TextStyle(
                color: Color(0xff2d9067),
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 42,
            // width: 315,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Color(0xff90c79c),
                width: 0.50,
              ),
              color: Color(0xffcde3d6),
            ),
            child: TextFormField(
              style: TextStyle(
                color: Color(0xff1a442b),
              ),
              cursorColor: Color(0xff2d9067),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              autofocus: true,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                LengthLimitingTextInputFormatter(11),
              ],
              decoration: InputDecoration(
                suffix: Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: phoneFlag
                      ? SvgPicture.asset(
                          'assets/ic/ic_check.svg',
                        )
                      : Container(
                          height: 1,
                          width: 1,
                        ),
                ),
                //클릭시 Label 올라 가는 애니메이션 제거
                floatingLabelBehavior: FloatingLabelBehavior.always,
                //isDense : label, hint 간격 조절
                isDense: true,
                fillColor: Colors.transparent,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 10, left: 12),
                // labelText: '이름',
                hintText: '휴대폰 번호를 입력해주세요(숫자만 입력)',
                hintStyle: TextStyle(
                  color: Color(0xff629677),
                  fontSize: 14,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  if (value == '01022449379') {
                    signUpFlag = true;
                  } else {
                    signUpFlag = false;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  renderPhoneButton() {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
            primary: Color(0xff2d9067),
          ),
          onPressed: () {
            setState(() {
              phoneFlag = true;
              startTimeout(180);
            });
            // Get.toNamed('/login_select_church');
          },
          child: Text(
            "인증 문자 받기",
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

  renderPhoneOTP() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: 42,
              // width: 315,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xff90c79c),
                  width: 0.50,
                ),
                color: Color(0xffcde3d6),
              ),
              child: TextFormField(
                style: TextStyle(
                  color: Color(0xff1a442b),
                ),
                cursorColor: Color(0xff2d9067),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                autofocus: true,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  LengthLimitingTextInputFormatter(6),
                ],
                decoration: InputDecoration(
                  //클릭시 Label 올라 가는 애니메이션 제거
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  //isDense : label, hint 간격 조절
                  isDense: true,
                  fillColor: Colors.transparent,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(top: 10, left: 12),
                  // labelText: '이름',
                  hintText: '인증번호 6자리를 입력해주세요.',
                  hintStyle: TextStyle(
                    color: Color(0xff629677),
                    fontSize: 14,
                  ),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 12, bottom: 6),
              child: Text(
                timerText,
                style: TextStyle(
                  color: Color(0xff245d3a),
                  fontSize: 14,
                  fontFamily: "AppleSDGothicNeo",
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
        Container(
          height: 10,
        )
      ],
    );
  }

  renderPhoneOTPButton() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 45,
            // width: 315,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                  primary: Color(0xff2d9067),
                ),
                onPressed: () {
                  setState(() {
                    timer.cancel();
                    startTimeout(180);
                  });
                  // Get.toNamed('/login_select_church');
                },
                child: Text(
                  "재전송",
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
        Container(
          width: 7,
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 45,
            // width: 315,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                  primary: Color(0xff2d9067),
                ),
                onPressed: () {
                  setState(() {
                    phoneOTPFlag = true;
                    timer.cancel();
                  });
                  Get.offAllNamed('/main');
                },
                child: Text(
                  "인증 완료",
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
      ],
    );
  }

  renderIDLogin() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '휴대폰 번호가 바뀌었나요?',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/login_id');
            },
            child: Text(
              "아이디 로그인",
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Color(0xff2d9067),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 19),
      child: Column(
        children: [
          SizedBox(
            height: 130,
          ),
          renderPhone(),
          SizedBox(
            height: 15,
          ),
          phoneOTPFlag
              ? Container()
              : phoneFlag
                  ? renderPhoneOTP()
                  : Container(),
          phoneOTPFlag
              ? Container()
              : phoneFlag
                  ? renderPhoneOTPButton()
                  : renderPhoneButton(),
          SizedBox(
            height: 15,
          ),
          renderIDLogin(),
        ],
      ),
    ));
  }
}