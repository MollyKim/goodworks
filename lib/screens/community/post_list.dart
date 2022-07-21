import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/community_controller.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/screens/home/post_list.dart';
import 'package:practice/themes/extensions.dart';
import 'package:practice/util/getTimeAgo.dart';

class CommunityPostList extends StatelessWidget {
  CommunityPostList(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    CommunityController communityController = Get.find();
    return GestureDetector(
      onTap: () {
        Get.toNamed("/community_post_detail");
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
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
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            userController.userModel.resultData?.userProfile
                                    ?.avatar?.smallUrl ??
                                "https://cdn.vm-united.com/statics/defaultImage/user/userAvatar.png",
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userController.userModel.resultData?.userName ??
                                  "",
                              style: TextStyle(
                                  fontFamily: "AppleSDGothicNeo",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Text(getTimeAge(communityController
                      .communityList.resultData?[index].createdAt),
                    style: TextStyle(
                      color: context.gray04,
                        fontFamily: "AppleSDGothicNeo",
                        fontSize: 12,),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                communityController.communityList.resultData?[index].title ??
                    "제목 없음",
                style: TextStyle(
                    fontFamily: "AppleSDGothicNeo",
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                communityController.communityList.resultData?[index].introduce ??
                    "게시글 본문 표시되는 곳 \n최대 다섯줄 까지 적용",
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
              GridView.builder(
                  primary: false,
                  itemCount: listOfUrls.length > 3 ? 3 : listOfUrls.length,
                  padding: EdgeInsets.all(0),
                  semanticChildCount: 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 150,
                      crossAxisCount:
                          listOfUrls.length > 3 ? 3 : listOfUrls.length,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 5),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: listOfUrls.length > 3 && index == 2
                          ? Stack(
                              alignment: AlignmentDirectional.center,
                              fit: StackFit.expand,
                              children: <Widget>[
                                CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: listOfUrls[index],
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
                                      "+${listOfUrls.length - index}",
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
                                imageUrl: listOfUrls[index],
                                height: 100.0,
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
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
