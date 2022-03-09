import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/feed_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomePostList extends StatelessWidget {
  HomePostList(this.index);
  final int index;
  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    FeedController feedController = Get.find();
    int itemCount = feedController.feedList.resultData?[index].attachments!.length ?? 1;

    return GestureDetector(
      onTap: () async{
        // await feedController.getFeedDetail(churchId: "churchId", communityID: "communityID", feedID: "feedID");
        Get.toNamed("/home_post_detail", arguments: index);
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
                      child: Text(feedController.feedList.resultData?[index].feedType!.toString() ?? "교회소식",
                        style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  Text(getTimeAge(feedController.feedList.resultData?[index].feedType!.toString()))
                  // Text(getTimeAge(feedController.feedList.resultData?[index].createdAt))
                ],
              ),
              SizedBox(height: 10,),
              // Text(feedController.feedList.resultData?[index].title ?? "공지사항",
              //   style: TextStyle(
              //       fontFamily: "AppleSDGothicNeo",
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold),
              // ),
              // SizedBox(height: 10,),
              Text(feedController.feedList.resultData?[index].content ?? "",
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
                  itemCount: itemCount
                      > 3
                      ? 3
                      : itemCount,
                  padding: EdgeInsets.all(0),
                  semanticChildCount: 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 150,
                      crossAxisCount:  itemCount
                          > 3
                          ? 3
                          : itemCount,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 5),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: itemCount > 3 && index == 2
                          ? Stack(
                          alignment: AlignmentDirectional.center,
                          fit: StackFit.expand,
                          children: <Widget>[
                            CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: feedController.feedList.resultData?[index].attachments![index].fileinfo.smallUrl!
                                ?? "",
                              height: 100.0,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            Container(
                              color: Colors.black.withOpacity(.7),
                              child: Center(
                                child: Text(
                                  "+${itemCount - index}",
                                  style: TextStyle(color: Colors.white, fontSize: 40),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: feedController.feedList.resultData?[index].attachments![index].fileinfo.smallUrl! ?? "",
                            height: 100.0,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                    );
                  }),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
  getTimeAge(String? feedTime) {
    if(feedTime == null)
      feedTime = DateTime.now().toString();
    DateTime feedTimeDatetime = DateTime.parse(feedTime);
    final difference = now.difference(feedTimeDatetime);
    return timeago.format(now.subtract(difference), locale: 'ko');
  }
}

List<String> listOfUrls= [
  "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
  "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
  "https://isha.sadhguru.org/blog/wp-content/uploads/2016/05/natures-temples.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/7/77/Big_Nature_%28155420955%29.jpeg",
  "https://s23574.pcdn.co/wp-content/uploads/Singular-1140x703.jpg",
];
