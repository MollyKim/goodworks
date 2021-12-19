import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:share/share.dart';

class CommunityPostDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios, size: 20,color: Colors.black,)),
        actions: [
          GestureDetector(
              onTap: (){
                Share.share('check out my website https://example.com');
              },
              child: Icon(Icons.share,size: 20,color: Colors.black,)),
          SizedBox(width: 15,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:8.0,left: 20,right: 20),
                  child: Row(
                    children: [
                      Icon(Icons.ac_unit),
                      SizedBox(width: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("홍길동",style: TextStyle(
                              fontFamily: "AppleSDGothicNeo",
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),),
                          Text("2시간 전"),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(top:8.0,left: 20,right: 20),
                  child: Text("제목",
                    style: TextStyle(
                        fontFamily: "AppleSDGothicNeo",
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 15,),
                Divider(thickness: 2,),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(top:8.0,left: 20,right: 20),
                  child: Text("text",
                    style: TextStyle(
                      fontFamily: "AppleSDGothicNeo",
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
            renderPostDetailPicture(),
            Padding(
              padding: const EdgeInsets.only(top:8.0,left: 20,right: 20,bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/ic/ic_comment.svg"),
                  SizedBox(width: 5,),
                  Text("2")
                ],
              ),
            ),
            Divider(thickness: 0.5,),
            renderComments(),
            Divider(thickness: 0.5,),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        child: Container(
          padding: const EdgeInsets.only(top:20.0,left: 20,right: 20,bottom: 20),
          child: TextField(
            decoration: new InputDecoration.collapsed(
                hintText:  "댓글을 작성해주세요."
            ),
           ),
        ),
      ),
    );
  }

  renderComments() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.only(top:8.0,left: 20,right: 20,bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite_border),
                  SizedBox(width: 5),
                  Text("홍길동")
                ],
              ),
              Text("ㅅㄷㄴㅅ ㅅㄷ먼ㅇ라ㅓㅣ낭ㄹㅁㄴㄹ아ㅓ\ndslkjflskdjflsjdlf")
            ],
          ),
      );
    },
    itemCount: 3,
    separatorBuilder: (BuildContext context, int index) {
        return Divider(thickness: 0.5,);
    },);
  }
  renderPostDetailPicture(){
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 3,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
              height: 300,
              color: Color(0xff2d9067),
            ),
            SizedBox(height: 15,),
          ],
        );
      },
    );
  }
}
