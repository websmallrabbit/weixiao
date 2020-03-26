import 'package:flutter/material.dart';
import 'package:weixiao/demos/index.dart';
import 'package:weixiao/util/common.dart';
import 'package:weixiao/components/page_scaffold.dart';

class SchoolPage extends StatefulWidget {
  @override
  _SchoolPageState createState() => _SchoolPageState();
}

class _SchoolPageState extends State<SchoolPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    final height =size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 56),
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '选择学校',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: ColorsUtil.hexColor(0x333333)),
                      ),
                      Text(
                        '列表搜索不到?',
                        style: TextStyle(
                            fontSize: 14, color: ColorsUtil.hexColor(0xBDBDBD)),
                      )
                    ],
                  ))),
          Container(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
            child: _searchBar(),
          ),
          _getCityPage(height),
        ],
      ),
    );
  }

  _searchBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorsUtil.hexColor(0xF7F7F7),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _inputBox(),
          )
        ],
      ),
    );
  }

  _inputBox() {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            size: 24,
            color: Colors.orange,
          ),
          Expanded(
            flex: 1,
            child: TextField(
                controller: _controller,
                onChanged: _onChanged,
                autofocus: true,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  border: InputBorder.none,
                  hintText: '请输入学校名称搜索',
                  hintStyle: TextStyle(fontSize: 15),
                )
            ),
          )
        ],
      ),
    );
  }

  void _onChanged(String value) {}

  _getCityPage(height) {
    print(height);
    return Column(
      children: <Widget>[
        Container(
          height: height-150,
          child: CitySelectRoute(),
        )
      ],
    );
  }
}

//class _GetCityPage extends s {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: CitySelectRoute(),
//    );
//  }
//}
