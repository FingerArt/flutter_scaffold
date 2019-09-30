import 'package:flutter/material.dart';
import 'package:flutter_scaffold/ui/page/home_page.dart';
import 'package:flutter_scaffold/ui/page/login_page.dart';

const ROUTE_LOGIN = '/login';
const ROUTE_HOME = '/home';

Map<String, WidgetBuilder> routers = {
  ROUTE_LOGIN: (BuildContext context) => LoginPage(),
  ROUTE_HOME: (BuildContext context) => HomePage(),
};
