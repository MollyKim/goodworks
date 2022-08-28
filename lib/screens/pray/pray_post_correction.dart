import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/pray_controller.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/layouts/default_layout.dart';

class PrayPostCorrection extends StatefulWidget {
  const PrayPostCorrection({Key? key}) : super(key: key);

  @override
  _PrayPostCorrectionState createState() => _PrayPostCorrectionState();
}

class _PrayPostCorrectionState extends State<PrayPostCorrection> {
  TextEditingController contentTextEditingController = TextEditingController();
  UserController userController = Get.find();

  PrayController prayController = Get.find();
  String name = '윤하정';
  bool flag = true;
  bool flag2 = false;
  bool flag3 = false;
  bool flag4 = false;

  @override
  void initState() {
    contentTextEditingController.text = prayController.prayList.resultData?[Get.arguments].content.toString() ?? "";

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const PickerData2 = '''
[
    [
          "임지혜",      
          "임지혜",
          "임지혜",
          "임지혜",
          "임지혜",
          "임지혜"    
    ]
]
    ''';
    return DefaultLayout(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            "기도제목 수정",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: "AppleSDGothicNeo",
              color: Colors.black,
            ),
          ),
          elevation: 2.0,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.close_rounded,
                color: Colors.black,
              )),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Center(
                  child: GestureDetector(
                onTap: () async {
                  await prayController.putPrayUpdate(
                    churchId: "1",
                    prayerId: prayController.prayList.resultData?[Get.arguments].id.toString() ?? "",
                    content: contentTextEditingController.text,
                  );
                  await prayController.getPrayListData(userController.userSession!, churchId: "1");
                  Get.back();
                },
                child: Text(
                  "완료",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: "AppleSDGothicNeo",
                    color: Color(0xff2d9067),
                  ),
                ),
              )),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    prayController.prayList.resultData?[Get.arguments].communityName ?? "",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "AppleSDGothicNeo",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/ic/ic_photo.svg',
                        width: 60,
                        height: 60,
                      ),
                      Text(
                        prayController.prayList.resultData?[Get.arguments].userName.toString() ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: "AppleSDGothicNeo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Divider(
              thickness: 1.5,
            ),

            // prayController.prayList.resultData?[index].content.toString() ?? "목장"
            Expanded(
              child: TextField(
                onChanged: (val) {
                  contentTextEditingController.text = val;
                },
                maxLines: 30,
                controller: contentTextEditingController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: "기도 내용을 작성해주세요.",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15)),
              ),
            ),
          ],
        ));
  }
}
