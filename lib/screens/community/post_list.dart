import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/screens/login/login_select_church.dart';

class CommunityPostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed("/community_post_detail");
      },
      child: Padding(
        padding: const EdgeInsets.only(top:8.0,left: 15,right: 15),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                  Icon(Icons.more_horiz_outlined)
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
