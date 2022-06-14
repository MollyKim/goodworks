import 'dart:async';
import 'package:practice/controllers/user_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/services/user/user_model.dart';
import 'package:practice/themes/extensions.dart';

class LoginSignUp extends StatefulWidget {
  @override
  _LoginSignUpState createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  TextEditingController idTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  TextEditingController otpTextEditingController = TextEditingController();

  bool totalFlag = false;

  bool necessaryFlagOne = false;
  bool necessaryFlagTwo = false;

  bool phoneFlag = false;
  bool phoneOTPFlag = false;
  bool signUpFlag = false;

  int timerMaxSeconds = 180;
  int currentSeconds = 0;
  final formKey = GlobalKey<FormState>();

  final interval = const Duration(seconds: 1);
  Timer? timer;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(1, '0')}:${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
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
              "이메일 아이디",
              style: context.textStyleCustom.copyWith(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        TextFormField(
          // controller: idTextEditingController,
          onChanged: (val) {
            idTextEditingController.text = val;
          },
          validator: (val) {
            if (val!.length < 1) {
              return '필수사항입니다.';
            }
            return null;
          },
          style: context.textStyleCustom
              .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          cursorColor: context.forest70,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          autofocus: true,
          inputFormatters: [
            LengthLimitingTextInputFormatter(20),
          ],
          // textAlign: TextAlign.start,
          decoration: InputDecoration(
            //클릭시 Label 올라 가는 애니메이션 제거
            floatingLabelBehavior: FloatingLabelBehavior.always,
            //isDense : lab!el, hint 간격 조절
            isDense: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.forest60!),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.forest90!),
            ),
            contentPadding:
                const EdgeInsets.only(left: 12, top: 11, bottom: 11),
            hintStyle: context.textStyleCustom.copyWith(
              color: context.forest70,
              fontSize: 14,
            ),
            hintText: '이메일 주소를 입력하세요.',
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
              style: context.textStyleCustom.copyWith(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        TextFormField(
          onChanged: (val) {
            passwordTextEditingController.text = val;
          },
          validator: (val) {
            if (val!.length < 1) {
              return '비밀번호는 필수사항입니다.';
            } else if (val.length > 20 ||
                val.length < 8 ||
                !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(val)) {
              return '영문, 숫자 8~20자 조합으로 입력해주세요.';
            }
            return null;
          },
          obscureText: true,
          style: context.textStyleCustom
              .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          cursorColor: context.forest70,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          autofocus: true,
          inputFormatters: [
            LengthLimitingTextInputFormatter(20),
          ],
          decoration: InputDecoration(
            //클릭시 Label 올라 가는 애니메이션 제거
            floatingLabelBehavior: FloatingLabelBehavior.always,
            //isDense : lab!el, hint 간격 조절
            isDense: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.forest60!),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.forest90!),
            ),
            contentPadding:
                const EdgeInsets.only(left: 12, top: 11, bottom: 11),
            hintStyle: context.textStyleCustom.copyWith(
              color: context.forest70,
              fontSize: 14,
            ),
            hintText: '영문, 숫자 8~20자 조합으로 입력해주세요.',
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
              style: context.textStyleCustom.copyWith(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        TextFormField(
          validator: (val) {
            if (val!.length < 1) {
              return '비밀번호는 필수사항입니다.';
            } else if (passwordTextEditingController.text != val) {
              return '비밀번호를 확인해주세요.';
            }
            return null;
          },
          obscureText: true,
          style: context.textStyleCustom
              .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          cursorColor: context.forest70,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          autofocus: true,
          inputFormatters: [
            LengthLimitingTextInputFormatter(20),
          ],
          decoration: InputDecoration(
            //클릭시 Label 올라 가는 애니메이션 제거
            floatingLabelBehavior: FloatingLabelBehavior.always,
            //isDense : lab!el, hint 간격 조절
            isDense: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.forest60!),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.forest90!),
            ),
            contentPadding:
                const EdgeInsets.only(left: 12, top: 11, bottom: 11),
            hintStyle: context.textStyleCustom.copyWith(
              color: context.forest70,
              fontSize: 14,
            ),
            hintText: '영문, 숫자 8~20자 조합으로 입력해주세요.',
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
              style: context.textStyleCustom.copyWith(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        TextFormField(
          onChanged: (val) {
            nameTextEditingController.text = val;
          },
          validator: (val) {
            if (val!.length < 1) {
              return '이름은 필수사항입니다.';
            }
            return null;
          },
          style: context.textStyleCustom
              .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          cursorColor: context.forest70,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          autofocus: true,
          inputFormatters: [
            LengthLimitingTextInputFormatter(6),
          ],
          decoration: InputDecoration(
            //클릭시 Label 올라 가는 애니메이션 제거
            floatingLabelBehavior: FloatingLabelBehavior.always,
            //isDense : lab!el, hint 간격 조절
            isDense: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.forest60!),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.forest90!),
            ),
            contentPadding:
                const EdgeInsets.only(left: 12, top: 11, bottom: 11),
            hintStyle: context.textStyleCustom.copyWith(
              color: context.forest70,
              fontSize: 14,
            ),
            hintText: '이름(본명)을 입력해주세요.',
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
              style: context.textStyleCustom.copyWith(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        TextFormField(
          onChanged: (val) {
            phoneNumberTextEditingController.text = val;
          },
          validator: (val) {
            if (val!.length < 1) {
              return '번호는 필수사항입니다.';
            }
            return null;
          },
          style: context.textStyleCustom
              .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          cursorColor: context.forest70,
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
            //isDense : lab!el, hint 간격 조절
            isDense: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.forest60!),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.forest90!),
            ),
            contentPadding:
                const EdgeInsets.only(left: 12, top: 11, bottom: 11),
            hintStyle: context.textStyleCustom.copyWith(
              color: context.forest70,
              fontSize: 14,
            ),
            hintText: '휴대폰 번호를 입력하세요.',
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
            TextFormField(
              controller: otpTextEditingController,
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
                //isDense : lab!el, hint 간격 조절
                isDense: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: context.forest60!),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: context.forest90!),
                ),
                contentPadding:
                    const EdgeInsets.only(left: 12, top: 11, bottom: 11),
                hintStyle: context.textStyleCustom.copyWith(
                  color: context.forest70,
                  fontSize: 14,
                ),
                hintText: '인증번호 6자리를 입력해주세요.',
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                timerText,
                style: context.textStyleCustom.copyWith(
                  color: context.forest90,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
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
      height: 24,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(12.0),
            ),
            primary: context.forest80,
          ),
          onPressed: () {
            startTimeout(180);
            setState(() {
              phoneFlag = true;
            });
            // Get.toNamed('/login_select_church');
          },
          child: Text(
            "인증요청",
            textAlign: TextAlign.center,
            style: context.textStyleCustom
                .copyWith(fontSize: 12, color: Colors.white),
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
                  primary: context.forest80,
                ),
                onPressed: () {
                  setState(() {
                    timer?.cancel();
                    startTimeout(180);
                  });
                  // Get.toNamed('/login_select_church');
                },
                child: Text("재전송",
                    textAlign: TextAlign.center,
                    style: context.textStyleCustom
                        .copyWith(fontSize: 18, color: Colors.white))),
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
                  primary: context.forest80,
                ),
                onPressed: () {
                  setState(() {
                    phoneOTPFlag = true;
                    timer?.cancel();
                  });
                  // Get.toNamed('/login_select_church');
                },
                child: Text("인증 완료",
                    textAlign: TextAlign.center,
                    style: context.textStyleCustom
                        .copyWith(fontSize: 18, color: Colors.white))),
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
              style: context.textStyleCustom.copyWith(
                color: Colors.black,
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
            child: Text.rich(
              TextSpan(
                text: '서비스 이용약관',
                style: context.textStyleCustom.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                  height: 1,
                  decoration: TextDecoration.underline,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '에 동의합니다.',
                    style: context.textStyleCustom.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      height: 1,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
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
            child: Text.rich(
              TextSpan(
                text: '개인정보 처리방침',
                style: context.textStyleCustom.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                  height: 1,
                  decoration: TextDecoration.underline,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '에 동의합니다.',
                    style: context.textStyleCustom.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      height: 1,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
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
            primary: context.forest80,
          ),
          onPressed: () async {
            // if(this.formKey.currentState!.validate()){
              final UserController loginController = Get.find();
              await loginController.registerUser(
                  email: "jkdrumgrammer12",//idTextEditingController.text,
                  userpwd: "abcd1234ABCD",//passwordTextEditingController.text,
                  userName: "가나다",//nameTextEditingController.text,
                  phoneNumber: "01027623661",//phoneNumberTextEditingController.text);
              );

              if(loginController.userModel.resultCode == "200"){
            Get.toNamed('/login_welcome');
              } else Get.toNamed('/login_fail');
            // }
          },
          child: Text("가입하기",
              textAlign: TextAlign.center,
              style: context.textStyleCustom
                  .copyWith(fontSize: 18, color: Colors.white))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              key: this.formKey,
              child: Column(children: [
                SizedBox(
                  height: 40,
                ),
                renderEmail(),
                SizedBox(
                  height: 20,
                ),
                renderPassword(),
                SizedBox(
                  height: 20,
                ),
                renderPasswordTwo(),
                SizedBox(
                  height: 20,
                ),
                renderName(),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    renderPhone(),
                    Positioned(
                        right: 13, bottom: 10, child: renderPhoneButton())
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                phoneOTPFlag
                    ? Container()
                    : phoneFlag
                        ? renderPhoneOTP()
                        : Container(),
                SizedBox(
                  height: 40,
                ),
                renderTotalAgree(),
                SizedBox(
                  height: 10,
                ),
                renderNecessaryOne(),
                SizedBox(
                  height: 10,
                ),
                renderNecessaryTwo(),
                SizedBox(
                  height: 10,
                ),
                renderSignUpButton(),
              ]),
            )),
      ),
    );
  }
}
