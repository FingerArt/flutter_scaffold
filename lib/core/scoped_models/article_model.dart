import 'package:flutter_scaffold/core/get_it.dart';
import 'package:flutter_scaffold/core/models/article.dart';
import 'package:flutter_scaffold/core/scoped_models/base_list_model.dart';
import 'package:flutter_scaffold/core/services/api/api.dart';
import 'package:flutter_scaffold/core/services/user_service.dart';

class ArticleModel extends BaseListModel<Article> {
  var _api = getIt<Api>();
  var _userSer = getIt<UserService>();

  @override
  Future<List<Article>> loadDate() async {
    var userId = _userSer.currentUser.id;
    return await _api.getArticles(userId);
  }
}
