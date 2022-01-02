import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Worship extends StatefulWidget {
  const Worship({Key? key}) : super(key: key);

  @override
  _WorshipState createState() => _WorshipState();
}

class _WorshipState extends State<Worship> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: 'dyRsYk0LyA8',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          '기도',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {

                  // Get.toNamed('/player', arguments: 'lQ-bjS-S4wQ');
                  Get.toNamed('/full_screen', arguments: 'dyRsYk0LyA8');
                  // Player('dyRsYk0LyA8', 'Video Title');
                },
                child: Text('Full Screen')),
            YoutubePlayer(
              thumbnail:Container(child: Text('ThumbNail'),),
              key: ObjectKey(_controller),
              controller: _controller,
              actionsPadding: const EdgeInsets.only(left: 16.0),
              bottomActions: [

                CurrentPosition(),
                const SizedBox(width: 10.0),
                ProgressBar(isExpanded: true),
                const SizedBox(width: 10.0),
                RemainingDuration(),
                FullScreenButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
