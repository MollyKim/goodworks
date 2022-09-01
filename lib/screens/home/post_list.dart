import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/feed_controller.dart';
import 'package:practice/services/feed/feed_list_model.dart';
import 'package:practice/util/feedType.dart';
import 'package:practice/util/getTimeAgo.dart';

class HomePostList extends StatelessWidget {
  HomePostList(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    FeedController feedController = Get.find();
    List<FeedListAttachment> images = feedController.feeds?[index].attachments ?? [];
    int itemCount = isImage(images).length;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        // await feedController.getFeedDetail(
        //     churchId:
        //     feedController.feeds?[index].churchId ?? 1,
        //     communityID: feedController.feeds?[index].communityId ?? 1,
        //     feedID: feedController.feeds?[index].attachments?[0].feedId ?? "1000001817fb1bf46ecbba4ebaea4eb8b88ed8bb020ed94bceb939c014");
        Get.toNamed("/home_post_detail", arguments: index);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
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
                      border: Border.all(color: Colors.transparent, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    height: 30,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                          getFeedType(feedController.feeds?[index].feedType),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Text(getTimeAge(
                      feedController.feeds?[index].createdAt))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(feedController.feeds?[index].title ?? "공지사항",
                style: TextStyle(
                    fontFamily: "AppleSDGothicNeo",
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Text(
                feedController.feeds?[index].content ?? "",
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "AppleSDGothicNeo",
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              itemCount != 0 ? GridView.builder(
                  primary: false,
                  itemCount: itemCount > 3 ? 3 : itemCount,
                  padding: EdgeInsets.all(0),
                  semanticChildCount: 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 150,
                      crossAxisCount: itemCount > 3 ? 3 : itemCount,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 5),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int picIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: itemCount > 3 && index == 2
                          ? Stack(
                              alignment: AlignmentDirectional.center,
                              fit: StackFit.expand,
                              children: <Widget>[
                                CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl:isImage(images)[picIndex],
                                  height: 100.0,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                Container(
                                  color: Colors.black.withOpacity(.7),
                                  child: Center(
                                    child: Text(
                                      "+${itemCount - picIndex}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 40),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Container(
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: feedController
                                        .feeds?[index]
                                        .attachments?[0]
                                        .fileInfo.url
                                         ??
                                    "",
                                height: 100.0,
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                    );
                  }) : Container(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
  List<String> isImage(List<FeedListAttachment>? attachments) {
    List<String> images = [];

    attachments?.forEach((e) {
      if (e.attachType == "image") {
        images.add(e.fileInfo.url!);
      }});

    return images;
  }
}

