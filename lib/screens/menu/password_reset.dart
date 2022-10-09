import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/layouts/default_layout.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  UserController userController = Get.find();

  renderPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 0, bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "새 비밀번호",
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
              hintText: '영문, 숫자 8~20자 조합으로 입력해주세요.',
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

  newPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 0, bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "새 비밀번호 확인",
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
              hintText: '영문, 숫자 8~20자 조합으로 입력해주세요.',
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

  newPasswordTwo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 0, bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "현재 비밀번호",
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
              hintText: '현재 비밀번호를 입력해주세요',
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

  renderButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
            primary: Color(0xff2d9067),
          ),
          onPressed: () {
            userController.putUserPassword(
                userId: Get.arguments[0], session: Get.arguments[1], oldPassword: "asdf1234", newPassword: "asdf1235");
            Get.toNamed('/login_welcome');
          },
          child: Text(
            "비밀번호 변경",
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          titleSpacing: 0,
          // backgroundColor: Color(0xff1a442b),
          title: Text(
            "비밀번호 변경",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: "AppleSDGothicNeo",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 0.3,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffb7b7b7),
                  width: 0.7,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20, left: 20, top: 25),
              child: renderPassword(),
            ),
            Container(
              padding: EdgeInsets.only(right: 20, left: 20, top: 10),
              child: newPassword(),
            ),
            Container(
              padding: EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 20),
              child: newPasswordTwo(),
            ),
            Container(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: renderButton(),
            ),
          ],
        ));
  }
}
