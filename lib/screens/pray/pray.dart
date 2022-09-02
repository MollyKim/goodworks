import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/church_controller.dart';
import 'package:practice/controllers/community_controller.dart';
import 'package:practice/controllers/pray_controller.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/screens/community/post_list.dart';
import 'package:practice/screens/nodata.dart';
import 'package:practice/screens/pray/pray_post_list.dart';
import 'package:practice/themes/extensions.dart';
import 'package:practice/util/seperator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Pray extends StatefulWidget {
  const Pray({Key? key}) : super(key: key);

  @override
  _PrayState createState() => _PrayState();
}

class _PrayState extends State<Pray> with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  CommunityController communityController = Get.find();
  PrayController prayController = Get.find();
  ChurchController churchController = Get.find();
  UserController userController = Get.find();
  late final Future callPrayApis;

  @override
  void initState() {
    callPrayApis = getPray();
    super.initState();
  }

  getPray() async {
    try {
      print('phil getPray 000');
      await prayController.getPrayListData(userController.userSession!,
          churchId: churchController.churchModel.resultData?.id.toString() ?? "1");
      print('phil getPray 001');
      await prayController.getPrayDetailData(userController.userSession!,
          churchId: churchController.churchModel.resultData?.id.toString() ?? "1", prayerID: "1");
      await communityController.getCommunityUserListTwo(
          churchId: churchController.churchModel.resultData?.id.toString() ?? "1", communityId: communityController.communityList.resultData![0].id.toString());
    } catch (e) {
      print("error!! in pray : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final RefreshController _refreshController = RefreshController(initialRefresh: false);

    void _onRefresh() async {
      try {
        prayController.getPrayListData(userController.userSession!,
            churchId: churchController.churchModel.resultData?.id.toString() ?? "1");
      } catch (e) {
        print("error!! in community : $e");
      }
      await Future.delayed(Duration(milliseconds: 1000));
      _refreshController.refreshCompleted();
    }

    void _onLoading() async {
      await Future.delayed(Duration(milliseconds: 1000));
      // if(mounted)
      //   setState(() {});
      _refreshController.loadComplete();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        titleSpacing: 20,
        title: Text(
          "기도",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: "AppleSDGothicNeo",
            color: Color(0xff2d9067),
          ),
        ),
        elevation: 0.0,
      ),
      body: GetBuilder<PrayController>(
        builder: (context) {
          return SafeArea(
            top: true,
            bottom: true,
            child: SmartRefresher(
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
              onRefresh: () {
                _onRefresh();
              },
              onLoading: () {
                _onLoading();
              },
              child: ListView.separated(
                itemCount: prayController.prayList.resultData?.length ?? 1,
                separatorBuilder: (context, index) {
                  return CustomSeparator();
                },
                itemBuilder: (BuildContext context, int index) {
                  return PrayPostList(
                    index: index,
                  );
                },
              ),
            ),
          );
        }
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.toNamed("/pray_community_post");
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0x3f000000),
                blurRadius: 6,
                spreadRadius: 0.5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: SvgPicture.asset(
            'assets/ic/ic_write.svg',
          ),
        ),
      ),
    );
  }
}
