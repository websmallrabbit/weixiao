import 'package:flutter/material.dart';
import 'package:weixiao/model/common_model.dart';
import 'package:weixiao/util/common.dart';
import 'package:weixiao/widget/webview.dart';

class SchoolFriend extends StatelessWidget {
  final List<CommonModel> subNavList;

  const SchoolFriend({Key key, @required this.subNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6)),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '校友圈',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add_circle_outline,
                              color: Colors.orange, size: 14),
                          Container(
                            margin: EdgeInsets.only(left: 4),
                            child: Text(
                              '更多圈子',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: (MediaQuery.of(context).size.width - 60) / 2,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('images/beijing.jpg'),
                                fit: BoxFit.cover,
                              )),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    '湖南工学院(120人)',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  width: MediaQuery.of(context).size.width,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        child: _iconItem(),
                                      ),
                                      Positioned(
                                        left: 25,
                                        top: 0,
                                        child: _iconItem(),
                                      ),
                                      Positioned(
                                        left: 50,
                                        top: 0,
                                        child: _iconItem(),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: (MediaQuery.of(context).size.width - 60) / 2,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('images/beijing.jpg'),
                                fit: BoxFit.cover,
                              )),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    '湖南工学院(120人)',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  width: MediaQuery.of(context).size.width,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        child: _iconItem(),
                                      ),
                                      Positioned(
                                        left: 25,
                                        top: 0,
                                        child: _iconItem(),
                                      ),
                                      Positioned(
                                        left: 50,
                                        top: 0,
                                        child: _iconItem(),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  _items(BuildContext context) {
    if (subNavList == null) return null;
    List<Widget> items = [];
//    subNavList.forEach((model){
////      items.add(_item(context, model));
//      items.add(_item('images/xing.png', '签到之星'));
//    });
//    items.add(_item('images/xing.png', '签到之星'));

    int separate = (subNavList.length / 2 + 0.5).toInt();
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.sublist(0, separate),
        ),
      ],
    );
  }

  Widget _item(icon, title, color) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
//        onTap: () {
//          Navigator.push(context,
//              MaterialPageRoute(builder: (context) => WebView(url: model.url, statusBarColor: model.statusBarColor, hideAppBar: model.hideAppBar))
//          );
//        },
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: ColorsUtil.hexColor(color)),
                child: ClipOval(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Image(image: AssetImage(icon)),
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: 3),
              child: Text(
                title,
                style: TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }

  _iconItem() {
    return Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: ClipOval(
          child: SizedBox(
            child: Image.network(
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1585317698161&di=637ec57ec57f108bed18f50a90d578cb&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201504%2F16%2F20150416H1301_ic3GT.jpeg',
            ),
          ),
        ));
  }
}
