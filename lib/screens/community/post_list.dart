import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/screens/home/post_list.dart';
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
              GridView.builder(
                  primary: false,
                  itemCount: listOfUrls.length > 3 ? 3 : listOfUrls.length,
                  padding: EdgeInsets.all(0),
                  semanticChildCount: 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 150,
                      crossAxisCount: listOfUrls.length > 3 ? 3 : listOfUrls.length,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 5),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: listOfUrls.length> 3 && index == 2
                          ? Stack(
                        alignment: AlignmentDirectional.center,
                        fit: StackFit.expand,
                        children: <Widget>[
                          CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: listOfUrls[index],
                            height: 100.0,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                          Container(
                            color: Colors.black.withOpacity(.7),
                            child: Center(
                              child: Text(
                                "+${listOfUrls.length - index}",
                                style: TextStyle(color: Colors.white, fontSize: 40),
                              ),
                            ),
                          ),
                        ],
                      )
                          : Container(
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: listOfUrls[index],
                          height: 100.0,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
