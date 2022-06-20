import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/components/base_bottomSheet.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/util/getTimeAgo.dart';
import 'package:share/share.dart';
import 'package:practice/controllers/feed_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomePostDetail extends StatelessWidget {
  final FeedController feedController = Get.find();
  final now = DateTime.now();

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
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:8.0,left: 20,right: 20),
                    child: Row(
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
                            child: Text(feedType(feedController.feed.resultData?.feedType ?? 1),
                              style: TextStyle(color: Colors.white,fontFamily: "AppleSDGothicNeo",
                                fontSize: 18,),),
                          ),
                        ),
                        Text(getTimeAge(feedController.feed.resultData?.createdAt))
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:8.0,left: 20),
                        child: Text(feedController.feed.resultData?.title ?? "제목",
                          style: TextStyle(
                              fontFamily: "AppleSDGothicNeo",
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: BaseBottomSheet);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top:8.0,left: 20,right: 20),
                          child: Icon(Icons.more_horiz_outlined, size: 20)
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Divider(thickness: 2,),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0,left: 20,right: 20),
                    child: Text(feedController.feed.resultData?.content ?? "내용\n\n\n\n내용",
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
            ],
          ),
        ),
    );
  }
  renderPostDetailPicture(){
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: feedController.feed.resultData?.attachments?.length ?? 2,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: feedController.feedList.resultData?[index].attachments![index].fileInfo.smallUrl!
                ?? "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
                height: 300.0,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 15,),
          ],
        );
      },
    );
  }

  String feedType(int typeNum) {
    switch(typeNum) {
      case 1:
        return "교회 소식";
      default: return "소식";
    }
  }

}
