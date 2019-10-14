import 'package:flutter_scaffold/core/models/article.dart';
import 'package:flutter_scaffold/core/models/user.dart';
export 'package:flutter_scaffold/core/services/api/exceptions.dart';

abstract class Api {
  /// 登录
  ///
  /// [username] 用户名
  /// [password] 密码
  ///
  /// [User] 用户信息
  Future<User> login(String username, String password);

  /// 获取用户的文章列表
  ///
  /// [userId] 用户ID
  ///
  /// [List<Article>] 文章列表
  Future<List<Article>> getArticles(int userId);
}
