import 'dart:convert';

import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/community_controller.dart';
import 'package:practice/controllers/pray_controller.dart';
import 'package:practice/layouts/default_layout.dart';

class PrayCommunityPost extends StatefulWidget {
  const PrayCommunityPost({Key? key}) : super(key: key);

  @override
  _PrayCommunityPostState createState() => _PrayCommunityPostState();
}

class _PrayCommunityPostState extends State<PrayCommunityPost> {
  var memberNum = 0;
  CommunityController communityController = Get.find();
  PrayController prayController = Get.find();

  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String?> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item!,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<int> _getDividersIndexes() {
    List<int> _dividersIndexes = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _dividersIndexes.add(i);
      }
    }
    return _dividersIndexes;
  }

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Text(
                    "${communityController.communityList.resultData![0].name}",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  items:
                      _addDividersAfterItems(communityController.communityList.resultData!.map((e) => e.name).toList()),
                  customItemsIndexes: _getDividersIndexes(),
                  customItemsHeight: 4,
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      print('phil memberNum ');
                      memberNum = communityController.communityList.resultData!
                          .map((e) => e.name)
                          .toList()
                          .indexOf(value.toString());
                      print(memberNum);

                      communityController.getCommunityUserList(
                          churchId: "1",
                          communityId: communityController.communityList.resultData![memberNum].id.toString());
                      selectedValue = value as String;

                    });
                  },
                  buttonHeight: 40,
                  buttonWidth: 170,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: communityController.communityList.resultData![memberNum].memberCount,
                itemBuilder: (BuildContext context, int index) {
                  print('phil test');
                  print(memberNum);

                  // Why network for web?
                  // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
                  return member(index);
                },
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

  Widget member(index) {
    bool flag = false;
    print('phil flag');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                flag = !flag;
                print(flag);

              });
            },
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
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
                  communityController.communityUserList.resultData?[index].userName.toString() ?? "",
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
    );
  }
}
