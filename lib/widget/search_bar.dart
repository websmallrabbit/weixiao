import 'package:flutter/material.dart';
import 'package:weixiao/util/common.dart';

enum SearchBarType { home, normal, homeLight }

class SearchBar extends StatefulWidget {
  final bool enabled;
  final bool hideLeft;
  final SearchBarType searchBarType;
  final String hint;
  final String defaultText;
  final void Function() leftButtonClick;
  final void Function() rightButtonClick;
  final void Function() speakClick;
  final void Function() inputBoxClick;
  final ValueChanged<String> onChanged;

  const SearchBar(
      {Key key,
        this.enabled = true,
        this.hideLeft,
        this.searchBarType = SearchBarType.normal,
        this.hint,
        this.defaultText,
        this.leftButtonClick,
        this.rightButtonClick,
        this.speakClick,
        this.inputBoxClick,
        this.onChanged})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool showClear = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.defaultText != null) {
      setState(() {
        _controller.text = widget.defaultText;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBarType.normal
        ? _genNormalSearch()
        : _genHomeSearch();
  }

  _genNormalSearch() {
    return Container(
      child: Row(children: <Widget>[
        _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(6, 5, 10, 5),
              child: widget?.hideLeft ?? false
                  ? null
                  : Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
                size: 26,
              ),
            ),
            widget.leftButtonClick),
        Expanded(
          flex: 1,
          child: _inputBox(),
        ),
      ]),
    );
  }

  _genHomeSearch() {
    return Container(
      child: Row(children: <Widget>[
        _wrapTap(
            Container(
                padding: EdgeInsets.fromLTRB(20, 25, 5, 5),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.notifications_none,
                      color: Colors.grey,
                      size: 24,
                    )
                  ],
                )),
            widget.leftButtonClick),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 20, 30, 0),
            child: _searchBar(),
          ),
        ),
      ]),
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
            size: 20,
            color: Colors.orange,
          ),
          Expanded(
            flex: 1,
            child: TextField(
                controller: _controller,
                onChanged: _onChanged,
                autofocus: true,
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  border: InputBorder.none,
                  hintText: widget.hint ?? '',
                  hintStyle: TextStyle(fontSize: 15),
                )
            ),
          )
        ],
      ),
    );
  }

  _wrapTap(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) callback();
      },
      child: child,
    );
  }

  _onChanged(String text) {
    if (text.length > 0) {
      setState(() {
        showClear = true;
      });
    } else {
      setState(() {
        showClear = false;
      });
    }
    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
  }

  _homeFontColor() {
    return widget.searchBarType == SearchBarType.homeLight
        ? Colors.black54
        : Colors.white;
  }
}
