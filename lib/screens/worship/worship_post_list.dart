import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/worship_controller.dart';
import 'package:practice/services/worship/worship_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WorshipPostList extends StatefulWidget {
  final int? index;

  const WorshipPostList({Key? key, this.index}) : super(key: key);

  @override
  _WorshipPostListState createState() => _WorshipPostListState();
}

class _WorshipPostListState extends State<WorshipPostList> {
  late WorshipController worshipController = Get.find();
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // worshipController.getWorshipDetailData(
    //     churchId: "1", worshipId: worshipController.worshipList.resultData?[widget.index!.toInt()].id.toString() ?? "");

    print('phil111');
    print(widget.index);
    _controller = YoutubePlayerController(
      initialVideoId: 'YmrMtEj5T-I',
      flags: const YoutubePlayerFlags(
        hideControls: true,
        // hideThumbnail: ,
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        // isLive: true,
        // forceHD: false,
        // enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Color(0xff2d9067),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 3,
                ),
                child: Text(
                  "예배",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(
                // width: 57,
                height: 13,
                child: Text(
                  ///시간
                  "${worshipController.worshipList.resultData?[widget.index!.toInt()].worshipDate}",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            width: 350,
            // height: 19,
            child: Text(
              "${worshipController.worshipList.resultData?[widget.index!.toInt()].title}",
              maxLines: 3,

              ///본문
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: "AppleSDGothicNeo",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          //Player

          GestureDetector(
            onTap: () {
              print('phill');
              Get.toNamed('/player', arguments: [
                worshipController.worshipList.resultData![widget.index!.toInt()].playInfo!.videoId.toString(),
                widget.index
              ]);
            },
            child: Stack(
              children: [
                // Container(
                //   color: Colors.yellow,
                //   width: double.infinity,
                //   height: 200,
                //   child: Center(
                //     child: Text(
                //       '썸네일 사진',
                //       style: TextStyle(fontSize: 20, color: Colors.black),
                //     ),
                //   ),
                // ),
                CachedNetworkImage(
                    // 'assets/ic/ic_photo.svg',
                    // width: 460,
                    // height: 260,
                    imageUrl: worshipController
                        .worshipList.resultData![widget.index!.toInt()].contentDetail!.thumbnail!.url
                        .toString()),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, right: 10),
                    width: 60,
                    height: 20,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        worshipController.worshipList.resultData![widget.index!.toInt()].contentDetail!.duration
                            .toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
