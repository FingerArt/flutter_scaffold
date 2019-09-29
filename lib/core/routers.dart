import 'package:flutter/material.dart';
import 'package:flutter_scaffold/ui/page/login_page.dart';

const ROUTE_LOGIN = '/login';

Map<String, WidgetBuilder> routers = {
  ROUTE_LOGIN: (BuildContext context) => LoginPage(),
};
