import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/login_controller.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/models/user_model.dart';

class LoginSignUp extends StatefulWidget {
  @override
  _LoginSignUpState createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  bool totalFlag = false;

  bool necessaryFlagOne = false;
  bool necessaryFlagTwo = false;

  bool phoneFlag = false;
  bool phoneOTPFlag = false;
  bool signUpFlag = false;

  int timerMaxSeconds = 180;
  int currentSeconds = 0;

  final interval = const Duration(seconds: 1);
  late Timer timer;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(1, '0')}:${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

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

  totalFlagChange() {
    print('totalFlagChange');
    setState(() {
      totalFlag = !totalFlag;
      necessaryFlagOne = totalFlag;
      necessaryFlagTwo = totalFlag;
    });
  }

  necessaryOneFlagChange() {
    setState(() {
      necessaryFlagOne = !necessaryFlagOne;
      if (necessaryFlagOne == true && necessaryFlagTwo == true) {
        totalFlag = true;
      }
      if (necessaryFlagOne == false) {
        totalFlag = false;
      }
    });
  }

  necessaryTwoFlagChange() {
    setState(() {
      necessaryFlagTwo = !necessaryFlagTwo;
      if (necessaryFlagOne == true && necessaryFlagTwo == true) {
        totalFlag = true;
      }
      if (necessaryFlagTwo == false) {
        totalFlag = false;
      }
    });
  }

  renderEmail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 0, bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "아이디",
              style: TextStyle(
                color: Color(0xff2d9067),
                fontSize: 14,
                fontFamily: "AppleSDGothicNeo",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Container(
          height: 46,
          width: 315,
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
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            autofocus: true,
            inputFormatters: [
              LengthLimitingTextInputFormatter(20),
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
              hintText: '5~20자로 입력해주세요',
              hintStyle: TextStyle(
                color: Color(0xff629677),
                fontSize: 16,
              ),
            ),
            // onChanged: (value) {
            //   setState(() {
            //   });
            // },
          ),
        ),
      ],
    );
  }

  renderPassword() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 0, bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "비밀번호",
              style: TextStyle(
                color: Color(0xff2d9067),
                fontSize: 14,
                fontFamily: "AppleSDGothicNeo",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Container(
          height: 46,
          width: 315,
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
            // initialValue: widget.initialValue,
            cursorColor: Color(0xff2d9067),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            autofocus: true,
            inputFormatters: [
              LengthLimitingTextInputFormatter(20),
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
              hintText: '영문, 숫자 8~20자 조합으로 입력해주세요',
              hintStyle: TextStyle(
                color: Color(0xff629677),
                fontSize: 16,
              ),
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  renderPasswordTwo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 0, bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "비밀번호 확인",
              style: TextStyle(
                color: Color(0xff2d9067),
                fontSize: 14,
                fontFamily: "AppleSDGothicNeo",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Container(
          height: 46,
          width: 315,
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
            // initialValue: widget.initialValue,
            cursorColor: Color(0xff2d9067),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            autofocus: true,
            inputFormatters: [
              LengthLimitingTextInputFormatter(20),
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
              hintText: '영문, 숫자 8~20자 조합으로 입력해주세요',
              hintStyle: TextStyle(
                color: Color(0xff629677),
                fontSize: 16,
              ),
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  renderName() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 0, bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "이름",
              style: TextStyle(
                color: Color(0xff2d9067),
                fontSize: 14,
                fontFamily: "AppleSDGothicNeo",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Container(
          height: 46,
          width: 315,
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
            // initialValue: widget.initialValue,
            cursorColor: Color(0xff2d9067),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            autofocus: true,
            inputFormatters: [
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
              hintText: '이름(본명)을 입력해주세요',
              hintStyle: TextStyle(
                color: Color(0xff629677),
                fontSize: 16,
              ),
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  renderPhone() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 0, bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "휴대폰 번호",
              style: TextStyle(
                color: Color(0xff2d9067),
                fontSize: 14,
                fontFamily: "AppleSDGothicNeo",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Container(
          height: 46,
          width: 315,
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
                fontSize: 16,
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
    );
  }

  renderPhoneOTP() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: 46,
              width: 315,
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
                    fontSize: 16,
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

  renderPhoneButton() {
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
            setState(() {
              phoneFlag = true;
              startTimeout(180);
            });
            // Get.toNamed('/login_select_church');
          },
          child: Text(
            "휴대폰 인증",
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

  renderPhoneOTPButton() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 50,
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
          flex: 1,
          child: SizedBox(
            height: 50,
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
                  // Get.toNamed('/login_select_church');
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

  renderTotalAgree() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        totalFlagChange();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 24,
              height: 24,
              child: totalFlag
                  ? SvgPicture.asset(
                'assets/ic/ic_checkbox_on.svg',
                width: 24,
                height: 24,
                // fit: BoxFit.none,
              )
                  : SvgPicture.asset(
                'assets/ic/ic_checkbox_off.svg',
                width: 24,
                height: 24,
                // fit: BoxFit.none,
              )),
          SizedBox(width: 8),
          Align(
            alignment: Alignment.center,
            child: Text(
              "전체 동의",
              style: TextStyle(
                color: Color(0xff1a442b),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  renderNecessaryOne() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        necessaryOneFlagChange();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 24,
              height: 24,
              child: necessaryFlagOne
                  ? SvgPicture.asset(
                'assets/ic/ic_checkbox_on.svg',
                width: 24,
                height: 24,
                // fit: BoxFit.none,
              )
                  : SvgPicture.asset(
                'assets/ic/ic_checkbox_off.svg',
                width: 24,
                height: 24,
                // fit: BoxFit.none,
              )),
          SizedBox(width: 8),
          Align(
            alignment: Alignment.center,
            child: Text(
              "서비스 이용약관에 동의합니다",
              style: TextStyle(
                color: Color(0xff1a442b),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  renderNecessaryTwo() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        necessaryTwoFlagChange();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 24,
              height: 24,
              child: necessaryFlagTwo
                  ? SvgPicture.asset(
                'assets/ic/ic_checkbox_on.svg',
                width: 24,
                height: 24,
                // fit: BoxFit.none,
              )
                  : SvgPicture.asset(
                'assets/ic/ic_checkbox_off.svg',
                width: 24,
                height: 24,
                // fit: BoxFit.none,
              )),
          SizedBox(width: 8),
          Align(
            alignment: Alignment.center,
            child: Text(
              "개인정보 처리방침에 동의합니다",
              style: TextStyle(
                color: Color(0xff1a442b),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  renderSignUpButton() {
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
          onPressed: () async{
            final LoginController loginController = Get.find();
            final UserModel? userModel = await loginController.registerUser(
                email: "", userpwd: "userpwd", userName: "userName", phoneNumber: "phoneNumber");

            if(userModel?.resultCode == "200"){
              Get.toNamed('/login_welcome');
            } else Get.toNamed('/login_fail');

          },
          child: Text(
            "가입하기",
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
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(children: [
                Container(
                  height: 40,
                ),
                renderEmail(),
                Container(
                  height: 20,
                ),
                renderPassword(),
                Container(
                  height: 20,
                ),
                renderPasswordTwo(),
                Container(
                  height: 20,
                ),
                renderName(),
                Container(
                  height: 20,
                ),
                renderPhone(),
                Container(
                  height: 10,
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
                Container(
                  height: 40,
                ),
                renderTotalAgree(),
                Container(
                  height: 10,
                ),
                renderNecessaryOne(),
                Container(
                  height: 10,
                ),
                renderNecessaryTwo(),
                Container(
                  height: 10,
                ),
                Container(
                  height: 40,
                ),
                renderSignUpButton(),
              ])),
        ));
  }
}