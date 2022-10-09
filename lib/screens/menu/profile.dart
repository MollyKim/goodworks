import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice/components/baseToast.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/layouts/default_layout.dart';
import 'dart:io';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    XFile? image;

    return DefaultLayout(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          titleSpacing: 0,
          // backgroundColor: Color(0xff1a442b),
          title: Text(
            "내정보",
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
            GestureDetector(
              onTap: () async {
                image = (await ImagePicker().pickImage(source: ImageSource.gallery))!;
                setState(() {});
              },
              child: Container(
                height: 134,
                child: Center(
                  child: image == null
                      ? CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            userController.userModel.resultData?.userProfile?.avatar?.smallUrl ??
                                "https://cdn.vm-united.com/statics/defaultImage/user/userAvatar.png",
                          ),
                        )
                      : Image.file(
                          File(image!.path),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
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
              height: 60,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "이름",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    userController.userModel.resultData?.userName.toString() ?? "",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: "AppleSDGothicNeo",
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
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
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "소속",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "청년부",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: "AppleSDGothicNeo",
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    // width: 350,
                    child: Text(
                      "소속 부서의 수정이 필요하다면 담당 교역자에게 문의 바랍니다.",
                      style: TextStyle(
                        color: Color(0xff929292),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                ],
              ),
            ),
            Container(
              height: 4,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffb7b7b7),
                  width: 4,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "아이디",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    userController.userModel.resultData?.seumId.toString() ?? "",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: "AppleSDGothicNeo",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
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
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "휴대폰 번호",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        userController.userModel.resultData?.phoneNumber.toString() ?? "",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: "AppleSDGothicNeo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      // Text(
                      //   "변경",
                      //   textAlign: TextAlign.right,
                      //   style: TextStyle(
                      //     color: Color(0xff2d9067),
                      //     fontSize: 14,
                      //     fontFamily: "Apple SD Gothic Neo",
                      //     fontWeight: FontWeight.w700,
                      //   ),
                      // )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 0.3,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffb7b7b7),
                  width: 0.7,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/password_reset', arguments: [
                  userController.userModel.resultData?.seumId.toString(),
                  userController.userSession.toString(),
                ]);
                // BaseToast(text: '기능 준비중입니다.').showToast(context);
                // Get.back();
              },
              // onTap: () {
              //   Get.toNamed('/password_reset');
              // },
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "비밀번호 변경",
                      style: TextStyle(
                        color: Color(0xff2d9067),
                        fontSize: 16,
                        fontFamily: "Apple SD Gothic Neo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
