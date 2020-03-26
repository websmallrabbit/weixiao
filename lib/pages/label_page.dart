import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weixiao/navigator/tab_navigator.dart';
import 'package:weixiao/pages/home_page.dart';
import 'package:weixiao/util/common.dart';

String title = '选择我的形象';

class LabelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverCustomHeaderDelegate(
                title: title,
                collapsedHeight: 40,
                expandedHeight: 300,
                paddingTop: MediaQuery.of(context).padding.top,
                coverImgUrl:
                    'https://img.zcool.cn/community/01c6615d3ae047a8012187f447cfef.jpg@1280w_1l_2o_100sh.jpg'),
          ),
          SliverFillRemaining(
            child: FilmContent(),
          ),
        ],
      ),
    );
  }
}

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final String coverImgUrl;
  final String title;
  String statusBarMode = 'dark';

  SliverCustomHeaderDelegate({
    this.collapsedHeight,
    this.expandedHeight,
    this.paddingTop,
    this.coverImgUrl,
    this.title,
  });

  @override
  double get minExtent => this.collapsedHeight + this.paddingTop;

  @override
  double get maxExtent => this.expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  void updateStatusBarBrightness(shrinkOffset) {
    if (shrinkOffset > 50 && this.statusBarMode == 'dark') {
      this.statusBarMode = 'light';
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ));
    } else if (shrinkOffset <= 50 && this.statusBarMode == 'light') {
      this.statusBarMode = 'dark';
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));
    }
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
        .clamp(0, 255)
        .toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
          .clamp(0, 255)
          .toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    this.updateStatusBarBrightness(shrinkOffset);
    return Container(
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(child: Image.network(this.coverImgUrl, fit: BoxFit.cover)),
          Positioned(
            left: 0,
            top: this.maxExtent / 2,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00000000),
                    Color(0x90000000),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: this.makeStickyHeaderBgColor(shrinkOffset),
              child: SafeArea(
                bottom: false,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Stack(
                    children: <Widget>[
                      IconButton(
                        alignment: Alignment.topCenter,
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: this
                              .makeStickyHeaderTextColor(shrinkOffset, true),
                          size: 20,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 5,
                        child: Center(
                          child: Text(
                            this.title,
                            style: TextStyle(
                                color: this.makeStickyHeaderTextColor(
                                    shrinkOffset, false),
                                fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FilmContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final size =MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: Text(
                      '选择的越多推荐的校友越多哦',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF999999),
                      ),
                    ),
                  ),
                ],
              )),
        ),
        Container(
            child: Stack(
          children: <Widget>[
            Container(
              child: _labelItem('有梦想', 30.0, 160.0),
            ),
            Container(
              child: _labelItem('运动达人', 200.0, 130.0),
            ),
            Container(
              child: _labelItem('艺术系', 40.0, 220.0),
            ),
            Container(
              child: _labelItem('数据控', 150.0, 200.0),
            ),
            Container(
              child: _labelItem('数码控', 260.0, 220.0),
            ),
            Container(
              child: _labelItem('二次元', 160.0, 270.0),
            ),
            Container(
              child: _labelItem('学渣级', 70.0, 330.0),
            ),
            Container(
              child: _labelItem('吃货妹', 270.0, 330.0),
            ),
          ],
        )),
        Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 60,
                left: MediaQuery.of(context).size.width / 2 - 40,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                        new MaterialPageRoute(
                            builder: (context) => new TabNavigator()
                        )
                    );
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: LinearGradient(
                        //AppBar渐变遮罩背景
                        colors: [
                          ColorsUtil.hexColor(0xFF9E00),
                          ColorsUtil.hexColor(0xFFBC35)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
//                    border: Border.all(color: Color(0xFFFF0000), width: 0.5),
                      // 边色与边宽度
// 生成俩层阴影，一层绿，一层黄， 阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(1.0, 1.0),
                            blurRadius: 1.0,
                            spreadRadius: 1.0),
                      ],
                    ),
                    child: Icon(
                      Icons.trending_flat,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                )
              )
            ],
          ),
        )
      ],
    );
  }

//  _ForEachItem() {
//    return Container(
//      child: _labelItem(name, left, top),
//    )
//  }

  _labelItem(name, left, top) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            //设置四周边框
            border: new Border.all(width: 1, color: Colors.black12),
          ),
          child: GestureDetector(
            onTap: () {},
            child: Text(
              name,
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          )),
    );
  }
}
