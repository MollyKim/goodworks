import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:practice/screens/community/post_list.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Community extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RefreshController _refreshController = RefreshController(initialRefresh: false);

    void _onRefresh() async{
      await Future.delayed(Duration(milliseconds: 1000));
      _refreshController.refreshCompleted();
    }

    void _onLoading() async{
      await Future.delayed(Duration(milliseconds: 1000));
      // if(mounted)
      //   setState(() {});
      _refreshController.loadComplete();
    }


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text("청년부",style: TextStyle(
          fontWeight: FontWeight.bold,fontSize: 20,
          fontFamily: "AppleSDGothicNeo",
          color: Color(0xff2d9067),
        ),),
        elevation: 2.0,
      ),
        body: SafeArea(
            top: true,
            bottom: true,
            child: SmartRefresher(
              enablePullDown: true,
              controller: _refreshController,
              header:	ClassicHeader(
                height: 100,
                idleIcon: CupertinoActivityIndicator(radius: 13.0,),
                idleText: "",
                refreshingIcon: CupertinoActivityIndicator(radius: 13.0,),
                releaseIcon: CupertinoActivityIndicator(radius: 13.0,),
                completeIcon: null,
                completeText: "",
                completeDuration: Duration.zero,
                releaseText: "",
                refreshingText: "",),
              // header: CircularProgressIndicator(),
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return Divider(thickness: 2.0,);
                },
                itemBuilder: (BuildContext context, int index) {
                  return CommunityPostList();
                },),
            ),
        ),
      floatingActionButton: GestureDetector(
        onTap: (){
          Get.toNamed("/write_community_post");
        },
        child: SvgPicture.asset(
          'assets/ic/ic_write.svg',
        ),
      ),
    );


  }

}
