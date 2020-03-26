import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weixiao/pages/school_page.dart';
import 'package:weixiao/util/common.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _checkdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Container(
                height: 130,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 80),
                child: ClipOval(
                  child: Image.network(
                      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2692809760,3266574367&fm=26&gp=0.jpg',
                      height: 130,
                      width: 130,
                      fit: BoxFit.cover),
                ),
              )),
          Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Text(
                  '手机验证',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
              )),
          Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: Text(
                  '请输入您的手机号码，登录或注册人人网',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w300),
                ),
              )),
          Form(
            key: _formKey, //设置globalKey，用于后面获取FormState
            autovalidate: true, //开启自动校验
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(40, 59, 40, 0),
                    child: TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.orange,
                      decoration: InputDecoration(
                        labelText: '请输入手机号',
                        //设置输入框前面有一个电话的按钮 suffixIcon
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        labelStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        suffix: _getCheckBtn(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ), //                  suffix: _getCheckBtn()
                      ),
                      // 校验用户名
//                        validator: (v) {
//                          return v
//                              .trim()
//                              .length > 0 ? null : "用户名不能为空";
//                        }
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(40, 30, 40, 0),
                    child: TextFormField(
                      controller: _checkdController,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.orange,
                      decoration: InputDecoration(
                        labelText: '请输入验证码',
                        //设置输入框前面有一个电话的按钮 suffixIcon
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        labelStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                      obscureText: true,
                      //校验密码
//                          validator: (v) {
//                            return v
//                                .trim()
//                                .length > 5 ? null : "密码不能少于6位";
//                          }
                    ),
                  ),
                ),
                // 登录按钮
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 60, 40, 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          child: Text("下一步"),
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: () {
                            // 通过_formKey.currentState 获取FormState后，
                            // 调用validate()方法校验用户名密码是否合法，校验
                            // 通过后再提交数据。
                            if ((_formKey.currentState as FormState)
                                .validate()) {
                              //验证通过提交数据
                              _login(context);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          _threeLogin()
        ],
      ),
    );
  }

  _getCheckBtn() {
    return GestureDetector(
      onTap: () {
        print('123');
      },
      child: Text('获取验证码', style: TextStyle(color: Colors.orange)),
    );
  }

  _threeLogin() {
    return Container(
        width: 180,
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
              },
              tooltip: '微信登录',
              heroTag: '1',
              elevation: 0,
              highlightElevation: 6,
              backgroundColor: ColorsUtil.hexColor(0xD0D6DA),
              child: Image(
                image: AssetImage("images/wechat.png"),
                height: 30,
                width: 30,
                color: Colors.white,
              ),
            ), // This trailing
            FloatingActionButton(
              onPressed: () {},
              tooltip: 'qq登录',
              elevation: 0,
              heroTag: '2',
              highlightElevation: 6,
              backgroundColor: ColorsUtil.hexColor(0xD0D6DA),
              child: Image(
                image: AssetImage("images/qq_icon.png"),
                height: 30,
                width: 30,
                color: Colors.white,
              ),
            ), // This trailing
          ],
        ));
  }

  _login(BuildContext context) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new SchoolPage()
        )
    );
  }
}


