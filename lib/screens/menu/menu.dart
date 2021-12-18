import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/layouts/default_layout.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
          height: 43,
          child: Text(
            "나의 세움",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff2d9067),
              fontSize: 20,
              fontFamily: "AppleSDGothicNeo",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/ic/ic_photo.svg',
                  ),
                  SizedBox(
                    width: 19,
                  ),
                  Column(
                    children: [
                      Text(
                        "홍길동",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "Apple SD Gothic Neo",
                          fontWeight: FontWeight.w700,
                        ),
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
