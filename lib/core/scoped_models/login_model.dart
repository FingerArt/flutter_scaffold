import 'package:flutter_scaffold/core/get_it.dart';
import 'package:flutter_scaffold/core/scoped_models/base_model.dart';
import 'package:flutter_scaffold/core/services/api/api.dart';

class LoginModel extends BaseModel {
  var _api = getIt<Api>();

  /// 登陆
  ///
  /// [username] 用户名
  /// [password] 密码
  login(String username, String password) async {
    setState(ViewState.Busy);
    await _api.login(username, password);
    setState(ViewState.Success);
  }
}
