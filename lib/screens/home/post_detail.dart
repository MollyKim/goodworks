import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:share/share.dart';

class HomePostDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return DefaultLayout(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
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
            children: [
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 20,right: 20),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xff2d9067),
                              border: Border.all(
                                  color: Colors.transparent,
                                  width: 3.0),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.0)),
                            ),
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text("교회 소식",style: TextStyle(color: Colors.white),),
                            ),
                          ),
                          Text("2 시간 전")
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text("제목",
                        style: TextStyle(
                            fontFamily: "AppleSDGothicNeo",
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15,),
                      Divider(thickness: 2,),
                      SizedBox(height: 15,),
                      Text("text\n\n\n\ntext",
                        style: TextStyle(
                          fontFamily: "AppleSDGothicNeo",
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
              renderPostDetailPicture(),
            ],
          ),
        ),
    );
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
