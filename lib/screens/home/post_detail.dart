import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/components/base_bottomSheet.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/util/feedType.dart';
import 'package:practice/util/getTimeAgo.dart';
import 'package:practice/controllers/feed_controller.dart';

class HomePostDetail extends StatelessWidget {
  final FeedController feedController = Get.find();
  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var index = Get.arguments;

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
                            //feedController.feeds?[index].createdAt
                            child: Text(getFeedType(feedController.feeds?[index].feedType),
                              style: TextStyle(color: Colors.white,fontFamily: "AppleSDGothicNeo",
                                fontSize: 18,),),
                          ),
                        ),
                        Text(getTimeAge(feedController.feeds?[index].createdAt))
                        // Text(getTimeAge(feedController.feed.resultData?.createdAt))
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top:8.0,left: 20),
                          child: Text(feedController.feeds?[index].title ?? "제목",
                            style: TextStyle(
                                fontFamily: "AppleSDGothicNeo",
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
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
                    child: Text(feedController.feeds?[index].content ?? "내용\n\n\n\n내용",
                      style: TextStyle(
                        fontFamily: "AppleSDGothicNeo",
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
              renderPostDetailPicture(index),
            ],
          ),
        ),
    );
  }
  renderPostDetailPicture(int index){
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: feedController.feeds?[index].attachments?.length ?? 0,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int picIndex) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            feedController.feeds?[index].attachments?[picIndex].fileInfo.smallUrl != null
            ? Container(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: feedController.feeds?[index].attachments?[picIndex].fileInfo.smallUrl!
                ?? "",
                height: 300.0,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ) : Container(),
            SizedBox(height: 15,),
          ],
        );
      },
    );
  }
}
