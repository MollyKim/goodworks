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
      initialVideoId: 'dyRsYk0LyA8',
      flags: const YoutubePlayerFlags(
        hideControls: true,
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: true,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         foregroundColor: Colors.black,
//         backgroundColor: Colors.white,
//         title: Text(
//           '기도',
//           style: TextStyle(fontSize: 20.0),
//         ),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//
//                   // Get.toNamed('/player', arguments: 'lQ-bjS-S4wQ');
//                   Get.toNamed('/full_screen', arguments: 'dyRsYk0LyA8');
//                   // Player('dyRsYk0LyA8', 'Video Title');
//                 },
//                 child: Text('Full Screen')),
//             YoutubePlayer(
//               thumbnail:Container(child: Text('ThumbNail'),),
//               key: ObjectKey(_controller),
//               controller: _controller,
//               actionsPadding: const EdgeInsets.only(left: 16.0),
//               bottomActions: [
//
//                 CurrentPosition(),
//                 const SizedBox(width: 10.0),
//                 ProgressBar(isExpanded: true),
//                 const SizedBox(width: 10.0),
//                 RemainingDuration(),
//                 FullScreenButton(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
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
              "2021_1123(화)내수동교회 새벽예배",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: "Apple SD Gothic Neo",
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
              Get.toNamed('/player', arguments: 'dyRsYk0LyA8');
            },
            child: YoutubePlayer(
              thumbnail: Container(
                child: Text('ThumbNail'),
              ),
              key: ObjectKey(_controller),
              controller: _controller,
              // actionsPadding: const EdgeInsets.only(left: 16.0),
              // bottomActions: [
              //   CurrentPosition(),
              //   const SizedBox(width: 10.0),
              //   ProgressBar(isExpanded: true),
              //   const SizedBox(width: 10.0),
              //   RemainingDuration(),
              //   FullScreenButton(),
              // ]
            ),
          ),
        ],
      ),
    );
  }
}
