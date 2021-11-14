import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'post_list.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
   ScrollController scrollController = ScrollController();
   RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return
      DefaultLayout(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          backwardsCompatibility: false,
          title: Text('내수동교회'),
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontFamily: "AppleSDGothicNeo",
            fontWeight: FontWeight.w700,
            color: Color(0xff2d9067),
          ),
          leading: SvgPicture.asset(
            'assets/ic/ic_appbar.svg',
          ),
        ),
        body: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 150.0,
                pinned: false,
                flexibleSpace: Image.network(
                  "http://via.placeholder.com/350x150",
                  fit: BoxFit.cover,
                ),
              ),
              SliverAppBar(
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
                    Tab(text: '기도'),
                    Tab(text: '기도'),
                    Tab(text: '기도'),
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
                    return Divider(thickness: 2.0,);
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
                  return Divider(thickness: 2.0,);
                },
                itemBuilder: (BuildContext context, int index) {
                  return HomePostList();
                },),
              Container(color: Colors.blue,
                  child: ElevatedButton(
                    onPressed: (){
                      Fluttertoast.showToast(
                          msg: "This is Center Short Toast",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }, child: Text("button"),
                  )),
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
