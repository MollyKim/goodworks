import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/layouts/default_layout.dart';

class PrayCommunityPost extends StatefulWidget {
  const PrayCommunityPost({Key? key}) : super(key: key);

  @override
  _PrayCommunityPostState createState() => _PrayCommunityPostState();
}

class _PrayCommunityPostState extends State<PrayCommunityPost> {
  String name = '윤하정';
  bool flag = true;
  bool flag2 = false;
  bool flag3 = false;
  bool flag4 = false;

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
            "기도제목 작성",
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
            GestureDetector(
              onTap: () {
                Picker(
                    adapter: PickerDataAdapter<String>(
                        pickerdata: new JsonDecoder().convert(PickerData2),
                        isArray: true),
                    hideHeader: true,
                    title: new Text("목장 선택"),
                    cancelText: '취소',
                    confirmText: '선택',
                    onConfirm: (Picker picker, List value) {
                      print(value.toString());
                      setState(() {
                        name = picker.getSelectedValues().first;
                      });
                      print(picker.getSelectedValues().first);
                    }).showDialog(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "$name 목장",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "AppleSDGothicNeo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 16),
                    SvgPicture.asset(
                      'assets/ic/ic_bottom_black.svg',
                      width: 15,
                      height: 8.50,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        flag = true;
                        flag2 = false;
                        flag3 = false;
                        flag4 = false;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        flag
                            ? SvgPicture.asset(
                                'assets/ic/ic_photo.svg',
                                width: 60,
                                height: 60,
                              )
                            : SvgPicture.asset(
                                'assets/ic/ic_photo_off.svg',
                                width: 60,
                                height: 60,
                              ),
                        Text(
                          "임지혜",
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
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        flag = false;
                        flag2 = true;
                        flag3 = false;
                        flag4 = false;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        flag2
                            ? SvgPicture.asset(
                                'assets/ic/ic_photo.svg',
                                width: 60,
                                height: 60,
                              )
                            : SvgPicture.asset(
                                'assets/ic/ic_photo_off.svg',
                                width: 60,
                                height: 60,
                              ),
                        Text(
                          "임지혜",
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
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        flag = false;
                        flag2 = false;
                        flag3 = true;
                        flag4 = false;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        flag3
                            ? SvgPicture.asset(
                                'assets/ic/ic_photo.svg',
                                width: 60,
                                height: 60,
                              )
                            : SvgPicture.asset(
                                'assets/ic/ic_photo_off.svg',
                                width: 60,
                                height: 60,
                              ),
                        Text(
                          "임지혜",
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
            Expanded(
              child: TextField(
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
