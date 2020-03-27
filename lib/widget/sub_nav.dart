import 'package:flutter/material.dart';
import 'package:weixiao/model/common_model.dart';
import 'package:weixiao/util/common.dart';
import 'package:weixiao/widget/webview.dart';


class SubNav extends StatelessWidget{
  final List<CommonModel> subNavList;

  const SubNav({Key key, @required this.subNavList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6)
      ),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Row(
          children: <Widget>[
            _item('images/xing.png', '签到之星', 0xFFF9E9),
            _item('images/qi.png', '校社团', 0xFEFEFE),
            _item('images/qiu.png', '投票活动', 0xF0F8FF),
            _item('images/huo.png', '话题', 0xFFF0EF),
            _item('images/pin.png', '毕业季', 0xFFF4E5),
          ],
        ),
      )
    );
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
  Widget _item(icon, title, color)  {
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
                color: ColorsUtil.hexColor(color)
              ),
              child: ClipOval(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Image(
                    image: AssetImage(icon)
                  ),
                ),
              )
            ),
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

}