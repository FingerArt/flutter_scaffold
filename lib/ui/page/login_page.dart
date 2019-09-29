import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/core/enums/view_state.dart';
import 'package:flutter_scaffold/core/provider/base_view.dart';
import 'package:flutter_scaffold/core/scoped_models/login_model.dart';
import 'package:flutter_scaffold/ui/page/widget/button_loading.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter scaffold"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Welcome to flutter scaffold.',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                decoration: InputDecoration(labelText: "用户名", hintText: "请输入用户名", contentPadding: EdgeInsets.all(0)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                decoration: InputDecoration(labelText: "密码", hintText: "请输入密码", contentPadding: EdgeInsets.all(0)),
              ),
            ),
            BaseView<LoginModel>(
              builder: (ctx, model, child) => ButtonLoading(
                "登陆",
                isLoading: model.isBusy,
                onTap: () => model.login("", ""),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
