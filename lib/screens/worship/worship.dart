import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/church_controller.dart';
import 'package:practice/controllers/user_controller.dart';
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
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  WorshipController worshipController = Get.find();
  ChurchController churchController = Get.find();
  UserController userController = Get.find();

  late final Future callWorshipApis;

  @override
  void initState() {
    callWorshipApis = getWorship();
    super.initState();
  }

  getWorship() async {
    try {
      await worshipController.getWorshipTypeData(userController.userSession!,
          churchId: churchController.churchModel.resultData?.id.toString() ?? '1');
      await worshipController.getWorshipData(userController.userSession!,
          churchId: churchController.churchModel.resultData?.id.toString() ?? '1');
      // await worshipController.getWorshipDetailData(userController.userSession!,
      //     churchId: churchController.churchModel.resultData?.id.toString() ?? '1',
      // worshipId: '1');



    } catch (e) {
      print("error!! in worship : $e");
    }
    print('phil10');
    print('worshipController');
    print(worshipController.worshipTypeList);
    print(worshipController.worshipTypeList.trID);
    print(worshipController.worshipTypeList.resultData);
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
          return <Widget>[];
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
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: ListView.separated(
                itemCount: worshipController.worshipList.resultData?.length ?? 1,
                separatorBuilder: (context, index) {
                  return CustomSeparator();
                },
                itemBuilder: (BuildContext context, int index) {
                  return WorshipPostList(index: index);
                },
              ),
            ),
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
