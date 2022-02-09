import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/church_controller.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/services/church/church_model.dart';
import 'post_list.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
   final ScrollController scrollController = ScrollController();
   final RefreshController _refreshController = RefreshController(initialRefresh: false);
   String test = "";
   final ChurchController churchController = Get.find();
   ChurchModel? churchModel = ChurchModel();

  @override
  void initState() {
    getFeed();
    super.initState();
  }

  getFeed() async{
    churchModel = await churchController.getChurchData(churchId: "1");
    test = "test";
    // setState(() {});
    //겟빌더로 감싸서 교회정보들을 담는 모델 만들어서 넣을지?
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return
      DefaultLayout(
        appBar: AppBar(
          elevation: 2.0,
          titleSpacing: 0,
          backgroundColor: Colors.white,
          title: Text(test),//Text(churchModel?.resultData?.metaCommunity?.title ?? ""),
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontFamily: "AppleSDGothicNeo",
            fontWeight: FontWeight.w700,
            color: Color(0xff2d9067),
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SvgPicture.asset(
              'assets/ic/ic_appbar.svg',
            ),
          ),
        ),
        body: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 150.0,
                pinned: false,
                flexibleSpace: Image.network(
                  "http://via.placeholder.com/350x150",
                  fit: BoxFit.cover,
                ),
              ),
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
                  unselectedLabelStyle:
                  TextStyle(
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
                    Tab(text: '주보'),
                    Tab(text: '교회소식'),
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
                header:	MaterialClassicHeader(),
                // header: WaterDropHeader(),
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                child: ListView.separated(
                  itemCount: 2,
                  separatorBuilder: (context, index) {
                    return Divider(thickness: 5.0,color: Colors.grey[600],);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return HomePostList();
                  },),
              ),
              ListView.separated(
                itemCount: 1,
                separatorBuilder: (context, index) {
                  return Divider(thickness: 2.0,);
                },
                itemBuilder: (BuildContext context, int index) {
                  return HomePostList();
                },),
              ListView.separated(
                itemCount: 1,
                separatorBuilder: (context, index) {
                  return Divider(thickness: 2.0,color: Colors.grey[800],);
                },
                itemBuilder: (BuildContext context, int index) {
                  return HomePostList();
                },),
            ],
          ),
        ),
      );
  }

   void _onRefresh() async{
     await Future.delayed(Duration(milliseconds: 1000));
     _refreshController.refreshCompleted();
   }

   void _onLoading() async{
     await Future.delayed(Duration(milliseconds: 1000));
     if(mounted)
       setState(() {});
     _refreshController.loadComplete();
   }
}
