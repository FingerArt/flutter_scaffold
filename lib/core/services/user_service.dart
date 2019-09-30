import 'package:flutter_scaffold/core/get_it.dart';
import 'package:flutter_scaffold/core/models/user.dart';
import 'package:flutter_scaffold/core/services/api/api.dart';

/// 用户服务
class UserService {
  var _api = getIt<Api>();

  User currentUser;

  login(String username, String password) async {
    currentUser = await _api.login(username, password);
  }
}
