import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:weixiao/pages/home_page.dart';
import 'package:weixiao/pages/my_page.dart';
import 'package:weixiao/pages/search_page.dart';
import 'package:weixiao/pages/travel_page.dart';
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.orange;
  int _currentIndex = 0;

  final PageController _controller = PageController(
    initialPage: 0
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomItem('首页', Entypo.renren, 0),
            _bottomItem('推荐', FontAwesome.heart, 1),
            _bottomItem('我的圈子', FontAwesome.soccer_ball_o, 2),
            _bottomItem('我的', Icons.account_circle, 3),
          ]),
    );
  }
  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: _defaultColor,
        ),
        activeIcon: Icon(
          icon,
          color: _activeColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex != index ? _defaultColor : _activeColor),
        ));
  }
}
