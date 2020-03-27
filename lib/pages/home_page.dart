import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:weixiao/dao/home_dao.dart';
import 'package:weixiao/model/common_model.dart';
import 'package:weixiao/model/grid_nav_model.dart';
import 'package:weixiao/model/home_model.dart';
import 'package:weixiao/model/sales_box_model.dart';
import 'package:weixiao/pages/loading_container.dart';
import 'package:weixiao/pages/search_page.dart';
import 'package:weixiao/util/common.dart';
import 'package:weixiao/util/navigator_util.dart';
import 'package:weixiao/widget/banner_nav.dart';
import 'package:weixiao/widget/grid_nav.dart';
import 'package:weixiao/widget/local_nav.dart';
import 'package:weixiao/widget/sales_box.dart';
import 'package:weixiao/widget/school_friend.dart';
import 'package:weixiao/widget/search_bar.dart';
import 'package:weixiao/widget/sub_nav.dart';
import 'package:weixiao/widget/webview.dart';

const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = '请输入用户姓名或学校名称搜索';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double appBarAlpha = 0;
  String resultString = '';
  List<CommonModel> localNavList = [];
  List<CommonModel> subNavList = [];
  List<CommonModel> bannerList = [];
  GridNavModel gridNavModel;
  SalesBoxModel salesBoxModel;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _handleRefresh();
    Future.delayed(Duration(milliseconds: 600), () {
//      FlutterSplashScreen.hide();
    });
  }

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }

  Future<Null> _handleRefresh() async {
    try {
      TravelModel model = await HomeDao.fetch();
      setState(() {
        localNavList = model.localNavList;
        gridNavModel = model.gridNav;
        subNavList = model.subNavList;
        bannerList = model.bannerList;
        salesBoxModel = model.salesBox;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });
      print(e);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: LoadingContainer(
          isLoading: _loading,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 90),
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: RefreshIndicator(
                      onRefresh: _handleRefresh,
                      child: NotificationListener(
                        onNotification: (scrollNotification) {
                          if (scrollNotification is ScrollUpdateNotification &&
                              scrollNotification.depth == 0) {
                            //滚动且是列表滚动的时候
                            _onScroll(scrollNotification.metrics.pixels);
                          }
                        },
                        child: _listView,
                      )),
                ),
              ),
              _appBar
            ],
          )),
    );
  }


  Widget get _appBar {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              //AppBar渐变遮罩背景
              colors: [Colors.white, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 90.0,
            decoration: BoxDecoration(
              color: Color.fromARGB((appBarAlpha * 255).toInt(), 255, 175, 44),
            ),
            child: SearchBar(
              searchBarType: appBarAlpha > 0.2
                  ? SearchBarType.homeLight
                  : SearchBarType.home,
              inputBoxClick: _jumpToSearch,
              speakClick: _jumpToSpeak,
              hint: SEARCH_BAR_DEFAULT_TEXT,
              leftButtonClick: () {},
            ),
          ),
        ),
      ],
    );
  }

  Widget get _listView {
    return ListView(
      children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              BannerNav(subNavList: subNavList),
              Positioned(
                  top: 180,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: GestureDetector(
                              onTap: () {},
                              child: Image(
                                image: AssetImage("images/active.png"),
                                height: 100,
                              ),
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: SubNav(subNavList: subNavList)),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: SchoolFriend(subNavList: subNavList)),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: SalesBox(salesBox: salesBoxModel)),
                      ],
                    ),
                  )
              ),
            ],
          ),
        )
      ],
    );
  }

  _jumpToSearch() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SearchPage(
        hint: SEARCH_BAR_DEFAULT_TEXT,
      );
    }));
  }

  _jumpToSpeak() {}




}
