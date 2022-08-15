import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/pray_controller.dart';
import 'package:practice/themes/extensions.dart';
import 'package:practice/util/getTimeAgo.dart';

class PrayPostList extends StatelessWidget {
  const PrayPostList({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    PrayController prayController = Get.find();

    return GestureDetector(
      onTap: () {},
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
                    CachedNetworkImage(
                        // 'assets/ic/ic_photo.svg',
                        width: 30,
                        height: 30,
                        imageUrl: prayController.prayList.resultData![index].avatar!.smallUrl.toString()),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          prayController.prayList.resultData?[index].userName.toString() ?? "",
                          style: TextStyle(fontFamily: "AppleSDGothicNeo", fontSize: 14, fontWeight: FontWeight.bold),
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
                Text(
                  getTimeAge(prayController.prayList.resultData?[index].createdAt ?? ""),
                  style: TextStyle(
                    color: context.gray04,
                    fontFamily: "AppleSDGothicNeo",
                    fontSize: 12,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "2022.06.05",
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
          Get.offNamed("/pray_post_correction");
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
      Container(
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
            fontFamily: "Apple SD Gothic Neo",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      SizedBox(
        height: 19,
      ),
    ]);
  }
}
