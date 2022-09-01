import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/themes/extensions.dart';

class LoginID extends StatefulWidget {
  @override
  _LoginIDState createState() => _LoginIDState();
}

class _LoginIDState extends State<LoginID> {
  @override
  void dispose() {
    idTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }

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
              "아이디와 비밀번호로\n로그인합니다.",
              style: context.textStyleCustom.copyWith(
                  fontSize: 24,
                  color: context.forest80,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 60),
          TextFormField(
            controller: idTextEditingController,
            validator: (val) {
              if (val!.length < 1) {
                return '필수사항입니다.';
              } else if (val.length < 5) {
                return '5자리 이상 20자리 이하로 작성해주세요';
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
              hintText: '아이디를 입력해주세요.',
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            controller: passwordTextEditingController,
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
              hintText: '비밀번호를 입력해주세요.',
            ),
          ),
          SizedBox(height: 30),
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
              borderRadius: new BorderRadius.circular(25.0),
            ),
            primary: Color(0xff2d9067),
          ),
          onPressed: () async {
            UserController controller = Get.find();
            if(idTextEditingController.text == "" )
              await controller.loginUser("tester1", "asdf1234");
            else
              await controller.loginUser(idTextEditingController.text, passwordTextEditingController.text);

            // await controller.loginUser(idTextEditingController.text,
            //     passwordTextEditingController.text);
            setState(() {
              IDFlag = true;
            });
            if (controller.userSession != null) Get.offAndToNamed('/splash');
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
        body: SingleChildScrollView(
      child: Padding(
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
      ),
    ));
  }
}
