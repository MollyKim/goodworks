import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/church_controller.dart';
import 'package:practice/controllers/pray_controller.dart';
import 'package:practice/controllers/user_controller.dart';
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
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  PrayController prayController = Get.find();
  ChurchController churchController = Get.find();
  UserController userController = Get.find();
  late final Future callPrayApis;

  String year = '2022';
  String month = '07';
  late String time = year + '-' + month;

  final pickerData2 = '''
[
    [
        2021,
        2022
    ],
    [
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12
    ]
]
    ''';

  @override
  void initState() {
    callPrayApis = getPray();
    super.initState();
  }

  getPray() async {
    try {
      await prayController.getPrayListData(userController.userSession!,
          churchId: churchController.churchModel.resultData?.id ?? 1,
          time: time);
    } catch (e) {
      print("error!! in pray : $e");
    }

    if (prayController.prayList.resultCode == "0000" &&
        prayController.prayList.resultData?.length != 0) {
      return true;
    } else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
      length: 1, // 2
      vsync: this,
    );
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: FutureBuilder(
          future: callPrayApis,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData && snapshot.data == true) {
                return NestedScrollView(
                  controller: scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        elevation: 0,
                        backgroundColor: Colors.white,
                        pinned: true,
                        flexibleSpace: AppBar(
                          elevation: 0,
                          titleSpacing: 20,
                          backgroundColor: Colors.white,
                          centerTitle: false,
                          title: Text("기도"),
                          titleTextStyle: context.textStyleCustom.copyWith(
                            color: context.forest80,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
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
                        onRefresh: () {
                          _onRefresh();
                        },
                        onLoading: () {
                          _onLoading();
                        },
                        child: ListView.separated(
                          itemCount:
                              prayController.prayList.resultData?.length ?? 0,
                          separatorBuilder: (context, index) {
                            return CustomSeparator();
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return PrayPostList(index: index);
                          },
                        ),
                      ),
                      // ListView.separated(
                      //   itemCount: 5,
                      //   separatorBuilder: (context, index) {
                      //     return CustomSeparator();
                      //   },
                      //   itemBuilder: (BuildContext context, int index) {
                      //     return PrayPostList();
                      //   },
                      // ),
                    ],
                  ),
                );
              } else {
                return NoData(
                  title: "현재 작성된 기도제목이 없습니다",
                  content: "교회 및 공동체 지체들의 기도 제목을\n함께 나누고 기도해요.",
                );
              }
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: context.forest80,
              ));
            }
          }),
    );
  }

  pickDate() {
    return GestureDetector(
      onTap: () {
        Picker(
            adapter: PickerDataAdapter<String>(
                pickerdata: new JsonDecoder().convert(pickerData2),
                isArray: true),
            hideHeader: true,
            title: new Text("날짜 선택"),
            cancelText: '취소',
            confirmText: '선택',
            onConfirm: (Picker picker, List value) {
              print(value.toString());
              setState(() {
                year = picker.getSelectedValues().first;
                month = picker.getSelectedValues().last;
                getPray();
              });
              print(picker.getSelectedValues().first);
            }).showDialog(context);
      },
      child: Container(
        width: 62,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xff2d9067),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              month,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: "AppleSDGothicNeo",
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            SvgPicture.asset(
              'assets/ic/ic_bottom.svg',
            )
          ],
        ),
      ),
    );
  }

  void _onRefresh() async {
    try {
      await prayController.getPrayListData(userController.userSession!,
          churchId: churchController.churchModel.resultData?.id ?? 1,
          time: time);
    } catch (e) {
      print("error!! in pray : $e");
    }
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }
}
