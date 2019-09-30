import 'package:flutter/material.dart';
import 'package:flutter_scaffold/core/get_it.dart';
import 'package:flutter_scaffold/core/routers.dart';
import 'package:flutter_scaffold/ui/page/login_page.dart';

void main() {
  setupGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
      routes: routers,
    );
  }
}
