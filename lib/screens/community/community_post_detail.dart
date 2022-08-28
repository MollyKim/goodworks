import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/components/baseToast.dart';
import 'package:practice/controllers/community_controller.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/themes/extensions.dart';
import 'package:practice/util/getTimeAgo.dart';
import 'package:share/share.dart';

class CommunityPostDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CommunityController communityController = Get.find();
    UserController userController = Get.find();
    var index = Get.arguments;

    return DefaultLayout(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: context.forest80,
            )),
        centerTitle: true,
        title: Text("모임",
        style: TextStyle(color: Colors.black),),
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: buildBottomSheet);
            },
            child: SvgPicture.asset(
              'assets/ic/ic_more_horiz.svg',
              color: context.forest80,
              width: 30,
              height: 30,
            ),
          ),
          // GestureDetector(
          //     onTap: () {
          //       Share.share('check out my website https://example.com');
          //     },
          //     child: Icon(
          //       Icons.share,
          //       size: 20,
          //       color: Colors.black,
          //     )),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
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
                      Text(
                        userController.userModel.resultData?.userName ?? "",
                        style: TextStyle(
                            fontFamily: "AppleSDGothicNeo",
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(getTimeAge(communityController
                          .communityList.resultData?[index].createdAt),
                        style: TextStyle(
                          color: context.gray04,
                          fontFamily: "AppleSDGothicNeo",
                          fontSize: 12,),
                      ),
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
                    height: 10
                  ),
                  Text(
                    communityController.communityList.resultData?[index].introduce ??
                        "게시글 본문 표시되는 곳 \n최대 다섯줄 까지 적용",
                    style: TextStyle(
                      fontFamily: "AppleSDGothicNeo",
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            communityController.communityList.resultData?[index].attachments != null
            ? renderPostDetailPicture(communityController, index) : Container(),
            // Padding(
            //   padding: const EdgeInsets.only(
            //       top: 8.0, left: 20, right: 20, bottom: 8),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       SvgPicture.asset("assets/ic/ic_comment.svg"),
            //       SizedBox(
            //         width: 5,
            //       ),
            //       Text("2")
            //     ],
            //   ),
            // ),
            // Divider(
            //   thickness: 0.5,
            // ),
            // renderComments(),
            // Divider(
            //   thickness: 0.5,
            // ),
          ],
        ),
      ),
      // bottomNavigationBar: GestureDetector(
      //   child: Container(
      //     padding:
      //         const EdgeInsets.only(top: 20.0, left: 20, right: 20, bottom: 20),
      //     child: TextField(
      //       decoration: new InputDecoration.collapsed(hintText: "댓글을 작성해주세요."),
      //     ),
      //   ),
      // ),
    );
  }

  renderComments() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding:
              const EdgeInsets.only(top: 8.0, left: 20, right: 20, bottom: 8),
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
        return Divider(
          thickness: 0.5,
        );
      },
    );
  }

  renderPostDetailPicture( CommunityController communityController, int index) {

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: communityController.communityList.resultData![index].attachments!.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int imageIndex) {
        return  Container(
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: communityController.communityList.resultData![index].attachments![imageIndex].fileinfo.url!,
            height: 100.0,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                Icon(Icons.error),
          ),
        );
      },
    );
  }

  Widget buildBottomSheet(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      GestureDetector(
        onTap: (){
          BaseToast(text: '기능 준비중입니다.').showToast(context);
          Get.back();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 159,
            vertical: 24,
          ),
          child: Text(
            "수정",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff2d9067),
              fontSize: 18,
              fontFamily: "Apple SD Gothic Neo",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 11,
      ),
      GestureDetector(
        onTap: () {

        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff2d9067),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 159,
            vertical: 24,
          ),
          child: Text(
            "삭제",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "AppleSDGothicNeo",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 19,
      ),
    ]);
  }

}
