import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/layouts/default_layout.dart';

class LoginID extends StatefulWidget {
  @override
  _LoginIDState createState() => _LoginIDState();
}

class _LoginIDState extends State<LoginID> {
  bool IDFlag = false;
  TextEditingController idTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  renderID() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            // width: 346,
            child: Text(
              "아이디와 비밀번호로 로그인합니다.",
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Color(0xff90c79c),
                width: 0.50,
              ),
              color: Color(0xffcde3d6),
            ),
            child: TextFormField(
              controller: idTextEditingController,
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
                hintText: '이메일 아이디를 입력해주세요',
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
          SizedBox(
            height: 15,
          ),
          Container(
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Color(0xff90c79c),
                width: 0.50,
              ),
              color: Color(0xffcde3d6),
            ),
            child: TextFormField(
              controller: passwordTextEditingController,
              style: TextStyle(
                color: Color(0xff1a442b),
              ),
              // initialValue: widget.initialValue,
              obscureText: true,
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
                hintText: '비밀번호를 입력해주세요',
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
        ],
      ),
    );
  }

  renderIDButton() {
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
            UserController controller = Get.find();
            controller.loginUser(idTextEditingController.text, passwordTextEditingController.text);
            setState(() {
              IDFlag = true;
            });
            Get.offAllNamed('/main');
          },
          child: Text(
            "로그인",
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
      padding: EdgeInsets.symmetric(horizontal: 19),
      child: Column(
        children: [
          SizedBox(
            height: 130,
          ),
          renderID(),
          SizedBox(
            height: 15,
          ),
          renderIDButton(),
        ],
      ),
    ));
  }
}
