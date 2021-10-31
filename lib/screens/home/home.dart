import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:practice/screens/home/list_tile.dart';
import 'package:practice/screens/home/tab_bar_delegate.dart';
import 'package:fluttertoast/fluttertoast.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
   ScrollController scrollController = ScrollController();

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
                flexibleSpace: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: Image.network(
                          "http://via.placeholder.com/350x150",
                          fit: BoxFit.cover,
                        )),
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: StickyTabBarDelegate(
                  child: TabBar(
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
              ),
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: <Widget>[
              ListTileContents(),
              ListTileContents(),
              ListTileContents(),
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


}
