import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/themes/extensions.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  final List<Widget> imageSliders = [
    Image.asset('assets/img/img_onbording1.png'),
    Image.asset('assets/img/img_onbording2.png'),
    Image.asset('assets/img/img_onbording3.png'),
    Image.asset('assets/img/img_onbording4.png'),
    Image.asset('assets/img/img_onbording5.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF60A979),
            const Color(0xFF2E9067),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
                aspectRatio: 0.9,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                initialPage: 0,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: imageSliders,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageSliders.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.forest50!
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
          const Spacer(),
          SizedBox(
            height: 50,
            width: 298,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  primary: context.forest50,
                ),
                onPressed: () {
                  Get.toNamed('/login_select_church');
                },
                child: Text(
                  "시작하기",
                  textAlign: TextAlign.center,
                  style: context.textStyleCustom.copyWith(
                      color: context.forest80,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                )),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '이미 계정이 있나요?',
                style: context.textStyleCustom.copyWith(
                  color: context.forest60,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/login_phone');
                },
                child: Text(
                  "로그인",
                  style: context.textStyleCustom.copyWith(
                    color: context.forest50,
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 80),
        ],
      ),
    ));
  }
}
