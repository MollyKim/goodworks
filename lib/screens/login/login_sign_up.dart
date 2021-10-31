import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/layouts/default_layout.dart';

class LoginSignUp extends StatefulWidget {
  @override
  _LoginSignUpState createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  bool totalFlag = false;

  bool necessaryFlagOne = false;
  bool necessaryFlagTwo = false;
  bool necessaryFlagThree = false;

  totalFlagChange() {
    print('totalFlagChange');
    setState(() {
      totalFlag = !totalFlag;
      necessaryFlagOne = totalFlag;
      necessaryFlagTwo = totalFlag;
      necessaryFlagThree = totalFlag;
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
              color: Color(0xff2d9067),
            ),
            cursorColor: Color(0xff2d9067),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            autofocus: true,
            inputFormatters: [
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
              hintText: '이메일 주소를 입력해주세요',
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
              color: Color(0xff2d9067),
            ),
            // initialValue: widget.initialValue,
            cursorColor: Color(0xff2d9067),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            autofocus: true,
            inputFormatters: [
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
              color: Color(0xff2d9067),
            ),
            // initialValue: widget.initialValue,
            cursorColor: Color(0xff2d9067),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            autofocus: true,
            inputFormatters: [
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
              color: Color(0xff2d9067),
            ),
            // initialValue: widget.initialValue,
            cursorColor: Color(0xff2d9067),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            autofocus: true,
            inputFormatters: [
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
              color: Color(0xff2d9067),
            ),
            cursorColor: Color(0xff2d9067),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            autofocus: true,
            inputFormatters: [
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
              setState(() {});
            },
          ),
        ),
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

  renderTotalAgree() {
    return InkWell(
      onTap: () {
        totalFlagChange();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 24,
              height: 24,
              child: !totalFlag
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
      onTap: () {
        totalFlagChange();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 24,
              height: 24,
              child: !totalFlag
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
      onTap: () {
        totalFlagChange();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 24,
              height: 24,
              child: !totalFlag
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
          onPressed: () {
            Get.toNamed('/home');
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
              height: 20,
            ),
            renderPhoneButton(),
            Container(
              height: 40,
            ),
            // SvgPicture.asset(
            //   'assets/img/img_logo.svg',
            //   // color: Colors.amberAccent,
            //   width: 105,
            //   height: 109,
            // ),
            // SvgPicture.asset(
            //   'assets/ic/ic_checkbox_on.svg',
            //   width: 24,
            //   height: 24,
            //   // fit: BoxFit.none,
            // ),
            // SvgPicture.asset(
            //   'assets/img/img_logo.svg',
            //   // color: Colors.amberAccent,
            //   width: 105,
            //   height: 109,
            // ),
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