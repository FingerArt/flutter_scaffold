import 'package:flutter_scaffold/core/get_it.dart';
import 'package:flutter_scaffold/core/scoped_models/base_model.dart';
import 'package:flutter_scaffold/core/services/user_service.dart';
import 'package:logger/logger.dart';

class LoginModel extends BaseModel {
  var _userService = getIt<UserService>();

  /// 登陆
  ///
  /// [username] 用户名
  /// [password] 密码
  login(String username, String password) async {
    Logger().d("login [$username, $password]");
    setState(ViewState.Busy);
    await _userService.login(username, password);
    setState(ViewState.Success);
  }

}
