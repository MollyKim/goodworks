import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/screens/login/login_select_church.dart';

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed("/post_detail");
      },
      child: Padding(
        padding: const EdgeInsets.only(top:8.0,left: 15,right: 15),
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
              Text("10.03 주보 제목",
                style: TextStyle(
                    fontFamily: "AppleSDGothicNeo",
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Text("게시글 본문 표시되는 곳 \n최대 다섯줄 까지 적용",
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "AppleSDGothicNeo",
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10,),
              CarouselSlider(
                options: CarouselOptions(
                  pageSnapping: false,
                  // aspectRatio: 0.7,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 2,
                  autoPlay: false,
                ),
                items: imageSliders,
              )
            ],
          ),
        ),
      ),
    );
  }
}
