
import 'package:flutter_scaffold/core/models/user.dart';

abstract class Api {
  Future<User> login(String username, String password);
}