import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/components/base_bottomSheet.dart';
import 'package:practice/controllers/pray_controller.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/themes/extensions.dart';
import 'package:practice/util/getTimeAgo.dart';

class PrayPostList extends StatelessWidget {
  PrayPostList({Key? key, required this.index}) : super(key: key);
  final int index;

  PrayController prayController = Get.find();
  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        prayController.prayList.resultData?[index].avatar!.smallUrl.toString() ?? "",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (prayController.prayList.resultData?[index].communityId == 2)
                          Text(
                            "청년부",
                            style: TextStyle(fontFamily: "AppleSDGothicNeo", fontSize: 14, fontWeight: FontWeight.bold),
                          )
                        else
                          Container(
                            child: Text(
                              prayController.prayList.resultData?[index].userName.toString() ?? "",
                              style:
                                  TextStyle(fontFamily: "AppleSDGothicNeo", fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        Text(
                          prayController.prayList.resultData?[index].communityName.toString() ?? "목장",
                          style: TextStyle(
                            color: context.gray04,
                            fontFamily: "AppleSDGothicNeo",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    (prayController.prayList.resultData?[index].communityId.toString() != '2' &&
                            (userController.userModel.resultData?.userName ==
                                prayController.prayList.resultData?[index].userName.toString()))
                        ? showModalBottomSheet(
                            backgroundColor: Colors.transparent, context: context, builder: buildBottomSheet)
                        : showModalBottomSheet(
                            backgroundColor: Colors.transparent, context: context, builder: BaseBottomSheet);
                  },
                  child: SvgPicture.asset(
                    'assets/ic/ic_more_horiz.svg',
                    color: context.forest80,
                    width: 30,
                    height: 30,
                  ),
                )

                // Text(
                //   getTimeAge(prayController.prayList.resultData?[index].createdAt ?? ""),
                //   style: TextStyle(
                //     color: context.gray04,
                //     fontFamily: "AppleSDGothicNeo",
                //     fontSize: 12,
                //   ),
                // )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              getTimeAge(prayController.prayList.resultData?[index].createdAt ?? ""),
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              prayController.prayList.resultData?[index].content.toString() ?? "목장",
              style: TextStyle(
                fontFamily: "AppleSDGothicNeo",
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomSheet(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      GestureDetector(
        onTap: () {
          Get.toNamed("/pray_post_correction", arguments: this.index);
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
              fontFamily: "AppleSDGothicNeo",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 11,
      ),
      GestureDetector(
        onTap: () async {
          await prayController.deletePray(
              churchId: "1", prayerId: prayController.prayList.resultData?[this.index].id.toString() ?? "");
          await prayController.getPrayListData(userController.userSession!, churchId: "1");
          Get.back();
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
