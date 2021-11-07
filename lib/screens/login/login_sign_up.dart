import 'package:animate_do/animate_do.dart';
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

  bool phoneButtonClicked = false;

  totalFlagChange() {
    print('totalFlagChange');
    setState(() {
      totalFlag = !totalFlag;
      necessaryFlagOne = totalFlag;
      necessaryFlagTwo = totalFlag;
      necessaryFlagThree = totalFlag;
    });
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
              phoneButtonClicked = true;
            });
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
            Get.toNamed('/');
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

  renderPhoneCertButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 50,
          width: 120,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                primary: Color(0xff2d9067),
              ),
              onPressed: () {
                // Get.toNamed('/home');
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
        SizedBox(width: 20,),
        SizedBox(
          height: 50,
          width: 170,
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
                "인증하기",
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
      ],
    );
  }

  renderTiles(String label, String hintText, ){
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 0, bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
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
              hintText: hintText,
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

  renderPhone(String label, String hintText,){
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 0, bottom: 5),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              label,
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
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            autofocus: true,
            inputFormatters: [
              // LengthLimitingTextInputFormatter(11),
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
              hintText: hintText,
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

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
            Container(
              height: 40,
            ),
            renderTiles("이메일 아이디","이메일 주소를 입력해 주세요"),
            Container(
              height: 20,
            ),
            renderTiles("비밀번호","영문, 숫자 8~20자 조합으로 입력해 주세요"),
            Container(
              height: 20,
            ),
            renderTiles("비밀번호 확인","영문, 숫자 8~20자 조합으로 입력해 주세요"),
            Container(
              height: 20,
            ),
            renderTiles("이름","이름(본명)을 입력해 주세요"),
            Container(
              height: 20,
            ),
            renderPhone("휴대폰 번호","휴대폰 번호를 입력해주세요(숫자만 입력)"),
            if(phoneButtonClicked)
              Column(
                children: [
                  SlideInDown(child: renderPhone("", "인증번호 6자리를 입력하세요"),duration: Duration(seconds: 1), ),
                  Container(
                    height: 10,
                  ),
                  SlideInDown(child: renderPhoneCertButton(),duration: Duration(seconds: 1) ),
                ],
              ),
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
              Container(
                height: 40,
              ),
          ])),
    ));
  }
}
