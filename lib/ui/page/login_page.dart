import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/core/provider/base_view.dart';
import 'package:flutter_scaffold/core/routers.dart';
import 'package:flutter_scaffold/core/scoped_models/login_model.dart';
import 'package:flutter_scaffold/ui/page/widget/button_loading.dart';

/// 登陆页
class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordInputController = TextEditingController();
  TextEditingController _usernameInputController = TextEditingController();

  GlobalKey<FormState> _keyLoginForm = GlobalKey();

  GlobalKey<ScaffoldState> _keyScaffold = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyScaffold,
      appBar: AppBar(
        title: Text("Flutter scaffold"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _keyLoginForm,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Welcome to flutter scaffold.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: _usernameInputController,
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "请输入用户名",
                    hintStyle: TextStyle(fontSize: 13),
                    contentPadding: EdgeInsets.zero,
                  ),
                  validator: _usernameValidator,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: TextFormField(
                  controller: _passwordInputController,
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "请输入密码",
                    hintStyle: TextStyle(fontSize: 13),
                    contentPadding: EdgeInsets.zero,
                  ),
                  validator: _passwordValidator,
                ),
              ),
              BaseView<LoginModel>(
                builder: (ctx, model, child) => ButtonLoading(
                  "登录",
                  isLoading: model.isBusy,
                  onTap: () => _onLoginTap(model),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _usernameValidator(String value) {
    if (value.isEmpty) {
      return "用户名不能为空";
    }
    return null;
  }

  String _passwordValidator(String value) {
    if (value.isEmpty) {
      return "密码不能为空";
    }
    return null;
  }

  _onLoginTap(LoginModel model) async {
    if (_keyLoginForm.currentState.validate()) {
      var isOK = await model.login(_usernameInputController.text, _passwordInputController.text);
      if (isOK) {
        Navigator.of(context).pushReplacementNamed(ROUTE_HOME);
      } else {
        final snackBar = SnackBar(content: Text(model.errorMessage));
        _keyScaffold.currentState?.showSnackBar(snackBar);
      }
    }
  }
}
