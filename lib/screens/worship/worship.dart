import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/worship_controller.dart';
import 'package:practice/screens/pray/pray_post_list.dart';
import 'package:practice/screens/worship/worship_post_list.dart';
import 'package:practice/util/seperator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Worship extends StatefulWidget {
  const Worship({Key? key}) : super(key: key);

  @override
  _WorshipState createState() => _WorshipState();
}

class _WorshipState extends State<Worship> with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  WorshipController worshipController = Get.find();

  String year = '2022';
  String month = '1';
  late final Future callWorshipApis;

  @override
  void initState() {
    callWorshipApis = getWorship();
    super.initState();
  }

  getWorship() async {
    try {} catch (e) {
      print("error!! in worship : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
      length: 1,
      vsync: this,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        backwardsCompatibility: false,
        // leadingWidth: 75,
        //TODO Adjust leading container width
        leading: Center(
            child: Text(
          '예배',
          style: TextStyle(
            color: Color(0xff2d9067),
            fontSize: 20,
            fontFamily: "AppleSDGothicNeo",
            fontWeight: FontWeight.w700,
          ),
        )),
      ),
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.white,
              pinned: true,
              flexibleSpace: TabBar(
                indicatorColor: Colors.transparent,
                isScrollable: true,
                labelPadding: EdgeInsets.only(left: 10, right: 10),
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: "AppleSDGothicNeo",
                  fontWeight: FontWeight.w700,
                ),
                labelColor: Color(0xff2d9067),
                labelStyle: TextStyle(
                  color: Color(0xff2d9067),
                  fontSize: 14,
                  fontFamily: "AppleSDGothicNeo",
                  fontWeight: FontWeight.w700,
                ),
                controller: tabController,
                tabs: <Widget>[
                  Tab(text: '전체'),
                  // Tab(text: '주일예배'),
                  // Tab(text: '새벽예배'),
                  // Tab(text: '금요예배'),
                  // Tab(text: '수요예배'),
                  // Tab(text: '주일학교'),
                  // Tab(text: '청년부'),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            SmartRefresher(
              enablePullDown: true,
              controller: _refreshController,
              header: ClassicHeader(
                height: 100,
                idleIcon: CupertinoActivityIndicator(
                  radius: 13.0,
                ),
                idleText: "",
                refreshingIcon: CupertinoActivityIndicator(
                  radius: 13.0,
                ),
                releaseIcon: CupertinoActivityIndicator(
                  radius: 13.0,
                ),
                completeIcon: null,
                completeText: "",
                completeDuration: Duration.zero,
                releaseText: "",
                refreshingText: "",
              ),
              // header: WaterDropHeader(),
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: ListView.separated(
                itemCount: 1,
                separatorBuilder: (context, index) {
                  return CustomSeparator();
                },
                itemBuilder: (BuildContext context, int index) {
                  return WorshipPostList();
                },
              ),
            ),
            // Container(
            //     color: Colors.blue,
            //     child: ElevatedButton(
            //       onPressed: () {
            //         Fluttertoast.showToast(
            //             msg: "This is Center Short Toast",
            //             toastLength: Toast.LENGTH_SHORT,
            //             gravity: ToastGravity.CENTER,
            //             timeInSecForIosWeb: 1,
            //             backgroundColor: Colors.red,
            //             textColor: Colors.white,
            //             fontSize: 16.0);
            //       },
            //       child: Text("button"),
            //     )),
          ],
        ),
      ),
    );
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }
}
//   late YoutubePlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = YoutubePlayerController(
//       initialVideoId: 'dyRsYk0LyA8',
//       flags: const YoutubePlayerFlags(
//         mute: false,
//         autoPlay: false,
//         disableDragSeek: false,
//         loop: false,
//         isLive: false,
//         forceHD: false,
//         enableCaption: true,
//       ),
//     );
//   }
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
