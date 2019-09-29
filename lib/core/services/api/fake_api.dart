import 'package:flutter_scaffold/core/models/user.dart';

import 'api.dart';

class FakeApi extends Api {
  @override
  Future<User> login(String username, String password) {
    return Future.delayed(Duration(seconds: 3), () => User(username: username, name: "hello"));
  }
}