import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/church_controller.dart';
import 'package:practice/controllers/community_controller.dart';
import 'package:practice/screens/community/post_list.dart';
import 'package:practice/util/seperator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Community extends StatefulWidget {
  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  CommunityController communityController = Get.find();
  ChurchController churchController = Get.find();

  @override
  void initState() {
    getCommunity();
    super.initState();
  }

  getCommunity() async{
    try{
      communityController.getCommunityListData(churchId:  churchController.churchModel.resultData?.id ?? 1);
    } catch(e){
      print("error!! in community : $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    final RefreshController _refreshController =
        RefreshController(initialRefresh: false);

    void _onRefresh() async {
      try{
        communityController.getCommunityListData(churchId:  churchController.churchModel.resultData?.id ?? 1);
      } catch(e){
        print("error!! in community : $e");
      }
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
          "청년부",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: "AppleSDGothicNeo",
            color: Color(0xff2d9067),
          ),
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
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
            itemCount: communityController.communityList.resultData?.length ?? 1,
            separatorBuilder: (context, index) {
              return CustomSeparator();
            },
            itemBuilder: (BuildContext context, int index) {
              return CommunityPostList(index);
            },
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.toNamed("/write_community_post");
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
