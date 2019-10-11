import 'package:flutter/material.dart';
import 'package:flutter_scaffold/ui/page/article_list_page.dart';
import 'package:flutter_scaffold/ui/page/home_page.dart';
import 'package:flutter_scaffold/ui/page/login_page.dart';

const ROUTE_LOGIN = '/login';
const ROUTE_HOME = '/home';
const ROUTE_ARTICLE_LIST = '/article_list';

Map<String, WidgetBuilder> routers = {
  ROUTE_LOGIN: (BuildContext context) => LoginPage(),
  ROUTE_HOME: (BuildContext context) => HomePage(),
  ROUTE_ARTICLE_LIST: (BuildContext context) => ArticleListPage(),
};
