import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_scaffold/core/routers.dart';

/// 首页
class HomePage extends StatelessWidget {
  final List<Tetrad<Widget, String, List<Color>, String>> menus = [
    Tetrad(Icon(Icons.list, color: Colors.white), "文章列表(RefreshIndicator)", [Color(0xFFABDCFF), Color(0xFF0396FF)], ROUTE_ARTICLE_LIST),
    Tetrad(Icon(Icons.list, color: Colors.white), "文章列表(CustomRefreshState)", [Color(0xFFFFE985), Color(0xFFFA742B)], ROUTE_ARTICLE_CUSTOM_LIST),
    Tetrad(Icon(Icons.palette, color: Colors.white), "绘图", [Color(0xFFFEB692), Color(0xFFEA5455)], ROUTE_HOME),
    Tetrad(Icon(Icons.settings, color: Colors.white), "设置", [Color(0xFFEE9AE5), Color(0xFF5961F9)], ROUTE_SETTINGS),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter scaffold"),
      ),
      body: ListView.separated(
        itemBuilder: _buildItem,
        itemCount: menus.length,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: _buildSeparator,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(menus[index].fourth),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          gradient: LinearGradient(
            colors: menus[index].third,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: <Widget>[
              menus[index].first,
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(menus[index].second, style: TextStyle(color: Colors.white)),
              )
            ]),
            Icon(Icons.chevron_right, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildSeparator(BuildContext context, int index) {
    return Container(height: 15);
  }
}

class Tetrad<FIRST, SECOND, THIRD, FOURTH> {
  FIRST first;
  SECOND second;
  THIRD third;
  FOURTH fourth;

  Tetrad(this.first, this.second, this.third, this.fourth);
}
