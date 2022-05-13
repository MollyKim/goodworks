import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/themes/extensions.dart';

class LoginSelectChurch extends StatefulWidget {
  @override
  _LoginSelectChurchState createState() => _LoginSelectChurchState();
}

class _LoginSelectChurchState extends State<LoginSelectChurch> {
  // List<int> list = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // 동작이 안되서 상위에 center 감싸줌
          children: [
            SizedBox(height: 150),
            Text(
              "출석하고 있는 교회를 선택해주세요.",
              textAlign: TextAlign.center,
              style: context.textStyleCustom.copyWith(
                color: context.forest80,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
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
                      initialPage: 0,
                      autoPlay: true,
                    ),
                    items: imageSliders,
                  )),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

//
final List<String> imgList = [
  'assets/img/img_logo_church.jpg',
  'assets/img/img_rural_church.jpg',
  'assets/img/img_urban_church.jpg',
];
//
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            // margin: EdgeInsets.all(5.0),
            child: Image(
                // width: 280,
                // height: 360,
                image: AssetImage(item)),
          ),
        ))
    .toList();
