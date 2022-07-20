import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:practice/layouts/default_layout.dart';

class WriteCommunityPost extends StatefulWidget {
  @override
  _WriteCommunityPostState createState() => _WriteCommunityPostState();
}

class _WriteCommunityPostState extends State<WriteCommunityPost> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            "게시글 작성",
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
            GestureDetector(
              onTap: (){

              },
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Center(
                    child: Text(
                      "완료",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: "AppleSDGothicNeo",
                        color: Color(0xff2d9067),
                      ),
                    )),
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, left: 20, right: 20, bottom: 15),
              child: TextField(
                decoration: new InputDecoration.collapsed(
                    hintText: "제목",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: "AppleSDGothicNeo",
                    )),
              ),
            ),
            Divider(
              thickness: 1.5,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, left: 20, right: 20, bottom: 15),
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: "공동체와 나누도 싶은 이야기를 작성 해보세요.",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15)),
              ),
            )),
            Divider(
              thickness: 1.5,
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, left: 20, right: 20, bottom: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/ic/ic_photo.svg"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "사진 등록 0/10",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
