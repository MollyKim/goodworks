import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/church_controller.dart';
import 'package:practice/controllers/pray_controller.dart';
import 'package:practice/controllers/user_controller.dart';
import 'package:practice/screens/pray/pray_post_list.dart';
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
  UserController userController = Get.find();

  String year = '2022';
  String month = '1';
  late String time = year+'-'+month;

  @override
  void initState() {
    // getPray();
    super.initState();
  }

  getPray() async {
    try {
      // await prayController.getPrayListData(churchId: userController.userModel.resultData?.churchId ?? 1, time: time);
    } catch (e) {
      print(e);
    }
    print('phil 003');
    print(prayController.prayList);
    setState(() {});
    //겟빌더로 감싸서 교회정보들을 담는 모델 만들어서 넣을지?
  }

  @override
  Widget build(BuildContext context) {
    const PickerData2 = '''
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

    TabController tabController = TabController(
      length: 2,
      vsync: this,
    );
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.toNamed("/pray_community_post");
        },
        child: SvgPicture.asset(
          'assets/ic/ic_write.svg',
        ),
      ),
      appBar: AppBar(
        elevation: 2.0,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        leading: Center(
            child: Text(
          '기도',
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
              bottom: PreferredSize(
                // Add this code
                preferredSize: Size.fromHeight(40.0), // Add this code
                child: Padding(
                  padding: EdgeInsets.only(right: 10, left: 10, bottom: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Picker(
                              adapter: PickerDataAdapter<String>(
                                  pickerdata:
                                      new JsonDecoder().convert(PickerData2),
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
                          width: 80,
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xff2d9067),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                year,
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
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Picker(
                              adapter: PickerDataAdapter<String>(
                                  pickerdata:
                                      new JsonDecoder().convert(PickerData2),
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
                      )
                    ],
                  ),
                ), // Add this code
              ),
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
                  Tab(text: '교회 기도'),
                  Tab(text: '소그룹 기도'),
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
                itemCount: 5,
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 3.0,
                    color: Colors.grey[600],
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return PrayPostList();
                },
              ),
            ),
            ListView.separated(
              itemCount: 5,
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 3.0,
                  color: Colors.grey[600],
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return PrayPostList();
              },
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
