import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:get/get.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/themes/extensions.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final PageController _pageController = PageController();

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
          SizedBox(
            height: 500,
            child: OnBoard(
              pageIndicatorStyle: PageIndicatorStyle(
                width: 100,
                inactiveColor: context.forest50!.withOpacity(0.5),
                activeColor: context.forest50,
                inactiveSize: Size(8, 8),
                activeSize: Size(8, 8),
              ),
              pageController: _pageController,
              skipButton: const SizedBox(),
              nextButton: const SizedBox(),
              onBoardData: [
                const OnBoardModel(
                  title: "",
                  description: "",
                  imgUrl: "assets/img/img_onbording1.png",
                ),
                const OnBoardModel(
                  title: "",
                  description: "",
                  imgUrl: "assets/img/img_onbording2.png",
                ),
                const OnBoardModel(
                  title: "",
                  description: "",
                  imgUrl: "assets/img/img_onbording3.png",
                ),
                const OnBoardModel(
                  title: "",
                  description: "",
                  imgUrl: "assets/img/img_onbording4.png",
                ),
                const OnBoardModel(
                  title: "",
                  description: "",
                  imgUrl: "assets/img/img_onbording5.png",
                ),
              ],
            ),
          ),

          // SvgPicture.asset(
          //   'assets/img/img_logo.svg',
          // ),
          // const SizedBox(height: 90),
          // Container(
          //   child: Text(
          //     "교회와 공동체\n그리고 나의 신앙을 세움",
          //     textAlign: TextAlign.center,
          //     style: context.textStyleCustom.copyWith(
          //       color: context.forest50,
          //       fontSize: 16,
          //     ),
          //   ),
          // ),

          const SizedBox(height: 100),
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
          )
        ],
      ),
    ));
  }
}
