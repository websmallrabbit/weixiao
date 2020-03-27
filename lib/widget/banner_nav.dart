import 'package:flutter/material.dart';
import 'package:weixiao/model/common_model.dart';
import 'package:weixiao/util/common.dart';

class BannerNav extends StatelessWidget {
  final List<CommonModel> subNavList;

  const BannerNav({Key key, @required this.subNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            //AppBar渐变遮罩背景
            colors: [
              ColorsUtil.hexColor(0xFFAF2C),
              ColorsUtil.hexColor(0xFFD072)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          children: <Widget>[_header(), _getSchoolFri()],
        ));
//    return Container(
//      child: Padding(
//        padding: EdgeInsets.all(7),
//        child: _items(context),
//      )
//    );
  }

//  _items(BuildContext context) {
//    if (subNavList == null) return null;
//    List<Widget> items = [];
//    subNavList.forEach((model) {
//      items.add(_item(context, model));
//    });
//    int separate = (subNavList.length / 2 + 0.5).toInt();
//    return Column(
//      children: <Widget>[
//        Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: items.sublist(0, separate),
//        ),
//        Padding(
//          padding: EdgeInsets.only(top: 10),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: items.sublist(separate, subNavList.length),
//          ),
//        )
//      ],
//    );
//  }
//
//  Widget _item(BuildContext context, CommonModel model) {
//    return Expanded(
//      flex: 1,
//      child: GestureDetector(
//        onTap: () {
//          Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) => WebView(
//                      url: model.url,
//                      statusBarColor: model.statusBarColor,
//                      hideAppBar: model.hideAppBar)));
//        },
//        child: Column(
//          children: <Widget>[
//            Image.network(
//              model.icon,
//              width: 18,
//              height: 18,
//            ),
//            Padding(
//              padding: EdgeInsets.only(top: 3),
//              child: Text(
//                model.title,
//                style: TextStyle(fontSize: 12),
//              ),
//            )
//          ],
//        ),
//      ),
//    );
//  }

  _getSchoolFri() {
    return Scrollbar(
        child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(0.0),
      child: Container(
        child: Row(
          //动态创建一个List<Widget>
          children: <Widget>[
            _items(),
            _items(),
            _items(),
            _items(),
            _items(),
            _items(),
          ],
        ),
      ),
    ));
  }

  _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Text(
            '可能是您的校友',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 0.5),
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    '查看更多',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                )))
      ],
    );
  }

  Widget _items() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 10, 20),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                border: Border.all(color: Colors.white, width: 2.5),
              ),
              child: ClipOval(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.network(
                    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1585317698161&di=637ec57ec57f108bed18f50a90d578cb&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201504%2F16%2F20150416H1301_ic3GT.jpeg',
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
              child: Text(
                '李桑榆',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: Text(
                '云南大学12级',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
