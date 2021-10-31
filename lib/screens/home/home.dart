import 'package:flutter/material.dart';
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
    TabController tabController = TabController(length: 2, vsync: this);

    return
      DefaultLayout(
        appBar: AppBar(title: Text('icon'),),
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
                    labelColor: Colors.black,
                    controller: tabController,
                    tabs: <Widget>[
                      Tab(text: '전체'),
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
