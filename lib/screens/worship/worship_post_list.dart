import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WorshipPostList extends StatefulWidget {
  const WorshipPostList({Key? key}) : super(key: key);

  @override
  _WorshipPostListState createState() => _WorshipPostListState();
}

class _WorshipPostListState extends State<WorshipPostList> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

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
                  "실시간 예배",
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
                  "21.11.22",
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
            height: 19,
            child: Text(
              ///본문
              "2021_1123(화)내수동교회 새벽예배",
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
              Get.toNamed('/player', arguments: 'YmrMtEj5T-I');
            },
            child: Stack(
              children: [
                Container(
                  color: Colors.yellow,
                  width: double.infinity,
                  height: 200,
                  child: Center(
                    child: Text(
                      '썸네일 사진',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                Positioned(
                  bottom:0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, right: 10),
                    width: 60,
                    height: 20,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        '3:35:27',
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
