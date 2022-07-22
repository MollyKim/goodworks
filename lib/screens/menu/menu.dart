import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/layouts/default_layout.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();

    return DefaultLayout(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          titleSpacing: 20,
          title: Text(
            "나의세움",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: "AppleSDGothicNeo",
              color: Color(0xff2d9067),
            ),
          ),
          elevation: 0.0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.toNamed('/profile');
              },
              child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 27,
                          backgroundImage: NetworkImage(
                            userController.userModel.resultData?.userProfile
                                    ?.avatar?.smallUrl ??
                                "https://cdn.vm-united.com/statics/defaultImage/user/userAvatar.png",
                          ),
                        ),
                        SizedBox(
                          width: 19,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userController.userModel.resultData?.userName ?? "",
                              style: TextStyle(
                                  fontFamily: "AppleSDGothicNeo",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "청년부",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/ic/ic_selected.svg',
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/setting');
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.50,
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/ic/ic_setting.svg',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "설정",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
