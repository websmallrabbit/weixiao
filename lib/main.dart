import 'package:flutter/material.dart';
import 'package:weixiao/components/page_scaffold.dart';
import 'package:weixiao/demos/index.dart';
import 'package:weixiao/pages/register_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: RegisterPage(),
      ),
    );
  }
}
