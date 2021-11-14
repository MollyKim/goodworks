import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/layouts/default_layout.dart';

class LoginSelectChurch extends StatefulWidget {
  @override
  _LoginSelectChurchState createState() => _LoginSelectChurchState();
}

class _LoginSelectChurchState extends State<LoginSelectChurch> {
  // List<int> list = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 150,
          ),
          Container(
            child: Text(
              "출석하고 있는 교회를 선택해주세요.",
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
            height: 150,
            // width: 200,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/login_sign_up');
            },
            child: Container(
                height: 350,
                width: 350,
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 0.7,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    initialPage: 2,
                    autoPlay: true,
                  ),
                  items: imageSliders,
                )),
          ),
        ],
      ),
    ]));
  }
}

//
final List<String> imgList = [
  '',
  '',
  '',
  '',
  '',
];
//
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: Image(
                width: 280,
                height: 360,
                image: AssetImage('assets/img/img_logo_church.jpg')),
          ),
        ))
    .toList();
