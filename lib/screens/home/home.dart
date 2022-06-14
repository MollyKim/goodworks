import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/church_controller.dart';
import 'package:practice/controllers/feed_controller.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/themes/extensions.dart';
import 'post_list.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  final RefreshController _totalRefreshController =
      RefreshController(initialRefresh: false);
  final RefreshController _juboRefreshController =
      RefreshController(initialRefresh: false);
  final RefreshController _newsRefreshController =
      RefreshController(initialRefresh: false);
  final FeedController feedController = Get.find();
  final ChurchController churchController = Get.find();

  @override
  void initState() {
    // getFeed("total");
    super.initState();
  }

  getFeed(String subject) async {
    await feedController.getFeedListData(churchId: "1", communityID: "?");
    setState(() {});
    //겟빌더로 감싸서 교회정보들을 담는 모델 만들어서 넣을지?
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return DefaultLayout(
      body: FutureBuilder(
        future: getFeed("total"),
        builder: (context,snapShot) {
          if(snapShot.hasData) {
              return NestedScrollView(
                controller: scrollController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      expandedHeight: 150.0,
                      pinned: false,
                      flexibleSpace: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: churchController.churchModel.resultData
                                ?.metaCommunity!.coverImage!.smallUrl ??
                            "https://cdn.vm-united.com/dev/user/1/community/cover/2021-11-25/small.bGUVRfg3e422_Image%20from%20iOS.jpg",
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      elevation: 0,
                      backgroundColor: Colors.white,
                      pinned: true,
                      flexibleSpace: AppBar(
                        elevation: 0.5,
                        titleSpacing: 0,
                        backgroundColor: Colors.white,
                        title: Text(churchController.churchModel.resultData
                                ?.metaCommunity!.title! ??
                            "내수동교회"),
                        titleTextStyle: context.textStyleCustom.copyWith(
                          color: context.forest100,
                          fontWeight: FontWeight.bold,
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              churchController.churchModel.resultData
                                      ?.metaCommunity?.coverImage?.smallUrl ??
                                  "https://cdn.vm-united.com/dev/user/1/community/cover/2021-11-25/small.bGUVRfg3e422_Image%20from%20iOS.jpg",
                            ),
                          ),
                        ),
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
                        unselectedLabelColor: context.gray02,
                        unselectedLabelStyle: context.textStyleCustom.copyWith(
                          fontSize: 16,
                        ),
                        labelColor: context.forest90,
                        labelStyle: context.textStyleCustom.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
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
                      controller: _totalRefreshController,
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
                        _onRefresh("total");
                      },
                      onLoading: () {
                        _onLoading("total");
                      },
                      child: ListView.separated(
                        itemCount:
                            feedController.feedList.resultData?.length ?? 1,
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 5.0,
                            color: Colors.grey[600],
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return HomePostList(index);
                        },
                      ),
                    ),
                    SmartRefresher(
                      enablePullDown: true,
                      controller: _juboRefreshController,
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
                        _onRefresh("jubo");
                      },
                      onLoading: () {
                        _onLoading("jubo");
                      },
                      child: ListView.separated(
                        itemCount: 1,
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 2.0,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return HomePostList(index);
                        },
                      ),
                    ),
                    SmartRefresher(
                      enablePullDown: true,
                      controller: _newsRefreshController,
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
                        _onRefresh("news");
                      },
                      onLoading: () {
                        _onLoading("news");
                      },
                      child: ListView.separated(
                        itemCount: 1,
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 2.0,
                            color: Colors.grey[800],
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return HomePostList(index);
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          else {
            return Center(child: CircularProgressIndicator());
          }
          }
      ),
    );
  }

  void _onRefresh(String subject) async { // 위로 새로고침 호출
    switch (subject) {
      case "total" :
        {
          await Future.delayed(Duration(milliseconds: 1000));
          getFeed(subject);
          _totalRefreshController.refreshCompleted();
          break;
        }
      case "jubo" :
        {
          getFeed(subject);
          _juboRefreshController.refreshCompleted();
          break;
        }
      case "news" :
        {
          getFeed(subject);
          _newsRefreshController.refreshCompleted();
          break;
        }
      default : {
        _totalRefreshController.refreshCompleted();
        _juboRefreshController.refreshCompleted();
        _newsRefreshController.refreshCompleted();
        break;
      }
    }
  }

  void _onLoading(String subject) async { // 커서 호출
    switch (subject) {
      case "total" :
        {print("123");
          await Future.delayed(Duration(milliseconds: 1000));
          getFeed(subject);
          _totalRefreshController.loadComplete();
          break;
        }
      case "jubo" :
        {
        _juboRefreshController.loadComplete();
        break;
        }
      case "news" :
        {
          _newsRefreshController.loadComplete();
          break;
        }
      default : {
        _totalRefreshController.loadComplete();
        _juboRefreshController.loadComplete();
        _newsRefreshController.loadComplete();
        break;
      }
    }

  }
}
