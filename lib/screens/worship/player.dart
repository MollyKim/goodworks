import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Player extends StatefulWidget {
  @override
  PlayerState createState() => PlayerState();
}

class PlayerState extends State<Player> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: Get.arguments,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      ),
    );
    _controller.toggleFullScreenMode();
    // _controller.fitHeight(Mede);
  }

  youtubeHierarchy() {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.fill,
          child: YoutubePlayer(
            controller: _controller,
          ),
        ),
      ),
    );
  }

  renderContent() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: 160,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xff2d9067),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  "주일예배",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "21.09.26",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "아버지께서 내게 주시는 자\n박희천 원로목사",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: "AppleSDGothicNeo",
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        // onExitFullScreen: () {
        //   // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        //   SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        // },
        player: YoutubePlayer(
          // width:MediaQuery.of(context).size.width,
          aspectRatio: 16 / 7,
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

        builder: (context, player) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black,
                  )),
              title: Text(
                '예배',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                    child: Row(
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
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      // width: 350,
                      // height: 19,
                      child: Text(
                        "코로나시대 영성(59)_’휘파람’ 그리고 ‘구속' 스가랴 10:6-10",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "Apple SD Gothic Neo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  player,
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: SizedBox(
                      // width: 350,
                      child: Text(
                        "설교 본문 노출\n관리자페이지에서 입력한 설교 본문이 노출됩니다.\n노출됩니다.\n노출하세요. (4줄에서 다섯줄 입력 후) \n설교본문이 노출중\ndasgasd\nsadgadsg\nadsgds\ngdasg\nsaa\nsgas\ngs\ngadsgsg\nabjoasdhgoiwejafjoi",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 3.0,
                    color: Colors.grey[600],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "연관 컨텐츠",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "AppleSDGothicNeo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  renderContent(),
                  renderContent(),
                  renderContent(),

                ],
              ),
            )));
  }
}
