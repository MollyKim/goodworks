import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/church_controller.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/themes/extensions.dart';

class LoginWelcome extends StatelessWidget {
  final ChurchController churchController = Get.find();
  final UserController userController = Get.find();

  renderUserPicture() {
    return Container(
      child: SvgPicture.asset(
        'assets/img/img_user_picture.svg',
        width: 180,
        height: 180,
        // fit: BoxFit.none,
      ),
    );
  }

  renderText(BuildContext context) {
    return SizedBox(
        width: 273,
        height: 68,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: "샬롬! ",
              style: context.textStyleCustom
                  .copyWith(fontSize: 18, color: context.forest80),
              children: [
                TextSpan(
                  text:
                      "${churchController.churchModel.resultData?.metaCommunity?.title ?? "내수동 교회"} ",
                  style: context.textStyleCustom.copyWith(
                      fontSize: 18,
                      color: context.forest80,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                  "세움에 오신\n",
                  style: context.textStyleCustom.copyWith(
                      fontSize: 18,
                      color: context.forest80,
                     ),
                ),
                TextSpan(
                  text:
                  "${userController.userModel.resultData?.seumId ?? "ooo"} ",
                  style: context.textStyleCustom.copyWith(
                      fontSize: 18,
                      color: context.forest80,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                  "성도님을 환영합니다.",
                  style: context.textStyleCustom.copyWith(
                    fontSize: 18,
                    color: context.forest80,
                  ),
                ),
              ]),
        )

        // Text(
        //   "샬롬! ${churchController.churchModel.resultData?.metaCommunity?.title ?? ""} 세움에 오신\n${userController.userModel.resultData?.email ?? ""} 성도님을 환영합니다.",
        //   textAlign: TextAlign.center,
        //   style: context.textStyleCustom.copyWith(
        //     fontSize: 18,
        //     color: context.forest80
        //   ),
        // ),
        );
  }

  renderBottomButton(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 315,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
            primary: context.forest80,
          ),
          onPressed: () {
            Get.toNamed('/main');
          },
          child: Text(
            "입장하기",
            textAlign: TextAlign.center,
            style: context.textStyleCustom.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: context.uiBackground!,
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 90,
              ),
              renderUserPicture(),
              Container(
                height: 35,
              ),
              renderText(context),
              Container(
                height: 60,
              ),
              renderBottomButton(context)
            ],
          ),
        ),
      ),
    );
  }
}
