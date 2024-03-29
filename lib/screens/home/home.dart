import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/controllers/church_controller.dart';
import 'package:practice/controllers/feed_controller.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:practice/screens/nodata.dart';
import 'package:practice/themes/extensions.dart';
import 'package:practice/util/seperator.dart';
import 'post_list.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final ScrollController scrollController = ScrollController();
  final ScrollController scrollController2 = ScrollController();
  final RefreshController _totalRefreshController =
      RefreshController(initialRefresh: false);
  final RefreshController _juboRefreshController =
      RefreshController(initialRefresh: false);
  final RefreshController _newsRefreshController =
      RefreshController(initialRefresh: false);
  final FeedController feedController = Get.find();
  final ChurchController churchController = Get.find();
  late final Future callApis;
  bool flag = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    scrollController2.addListener(() async{
      if (scrollController2.position.pixels == scrollController2.position.maxScrollExtent && flag){
        flag = false;
       await _onLoading("total");
      }
    });
    callApis = getFeed("total");
    super.initState();
  }

  getFeed(String subject) async {
    if(!feedController.isLast) {
      try {
        await feedController.getFeedListData(
            churchId: churchController.churchModel.resultData?.id ?? 1);
      } catch (e) {
        print("error!! home get Feed: $e");
      }

      if (feedController.feeds != null &&
          feedController.feeds?.length != 0) {
        return true;
      } else
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(feedController.feeds?.length);
    print("-------");
    super.build(context);

    TabController tabController = TabController(length: 1, vsync: this);
    return DefaultLayout(
      body: FutureBuilder(
          future: callApis,
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.done) {
              if (snapShot.data == true) {
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
                                  ?.portraitImage?.fileInfo.smallUrl ??
                              "https://cdn.vm-united.com/statics/defaultImage/church/churchLandscapeUrban.png",
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        elevation: 0,
                        backgroundColor: Colors.white,
                        pinned: true,
                        flexibleSpace: AppBar(
                          elevation: 0,
                          titleSpacing: 0,
                          backgroundColor: Colors.white,
                          centerTitle: false,
                          title: Text(
                              churchController.churchModel.resultData?.name ??
                                  "교회"),
                          titleTextStyle: context.textStyleCustom.copyWith(
                            color: context.forest100,
                            fontWeight: FontWeight.bold,
                          ),
                          leading: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                churchController.churchModel.resultData
                                        ?.logoImage?.fileInfo.smallUrl ??
                                    "https://cdn.vm-united.com/statics/defaultImage/user/userAvatar.png",
                              ),
                            ),
                          ),
                        ),
                      ),
                      // SliverAppBar(
                      //   automaticallyImplyLeading: false,
                      //   elevation: 0.5,
                      //   backgroundColor: Colors.white,
                      //   pinned: true,
                      //   flexibleSpace: TabBar(
                      //     indicatorColor: Colors.transparent,
                      //     isScrollable: true,
                      //     labelPadding: EdgeInsets.only(left: 10, right: 10),
                      //     unselectedLabelColor: context.gray02,
                      //     unselectedLabelStyle:
                      //         context.textStyleCustom.copyWith(
                      //       fontSize: 16,
                      //     ),
                      //     labelColor: context.forest90,
                      //     labelStyle: context.textStyleCustom.copyWith(
                      //         fontSize: 16, fontWeight: FontWeight.bold),
                      //     controller: tabController,
                      //     tabs: <Widget>[
                      //       Tab(text: '전체'),
                      //       Tab(text: '주보'),
                      //       Tab(text: '교회소식'),
                      //     ],
                      //   ),
                      // ),
                    ];
                  },
                  body: GetBuilder<FeedController>(
                    builder: (controller) {
                      return TabBarView(
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
                            // onLoading: () {
                            //   _onLoading("total");
                            // },
                            child: ListView.separated(
                              controller: scrollController2,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount:
                                  feedController.feeds?.length ?? 1,
                              separatorBuilder: (context, index) {
                                return CustomSeparator();
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return HomePostList(index);
                              },
                            ),
                          ),
                        ],
                      );
                    }
                  ),
                );
              } else if (snapShot.data == false) {
                return NoData(title: "현재 작성된 게시물이 없습니다.",content: "",);
              } else
                return Center(
                    child: CircularProgressIndicator(
                  color: context.forest80,
                ));
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: context.forest80,
              ));
            }
          }),
    );
  }

  void _onRefresh(String subject) async {
    // 위로 새로고침 호출
    switch (subject) {
      case "total":
        {
          try {
            await feedController.getFeedListRefresh(
                churchId: churchController.churchModel.resultData?.id ?? 1);
          } catch (e) {
            print("error!! home get Feed: $e");
          }
          _totalRefreshController.refreshCompleted();
          break;
        }
      case "jubo":
        {
          await getFeed(subject);
          _juboRefreshController.refreshCompleted();
          break;
        }
      case "news":
        {
          await getFeed(subject);
          _newsRefreshController.refreshCompleted();
          break;
        }
      default:
        {
          _totalRefreshController.refreshCompleted();
          _juboRefreshController.refreshCompleted();
          _newsRefreshController.refreshCompleted();
          break;
        }
    }
  }

  Future<void> _onLoading(String subject) async {
    switch (subject) {
      case "total":
        {
         await getFeed(subject);
          _totalRefreshController.loadComplete();
          flag = true;
          break;
        }
      case "jubo":
        {
          _juboRefreshController.loadComplete();
          break;
        }
      case "news":
        {
          _newsRefreshController.loadComplete();
          break;
        }
      default:
        {
          _totalRefreshController.loadComplete();
          _juboRefreshController.loadComplete();
          _newsRefreshController.loadComplete();
          break;
        }
    }
  }
}
