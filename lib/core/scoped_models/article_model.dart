import 'package:flutter_scaffold/core/get_it.dart';
import 'package:flutter_scaffold/core/models/article.dart';
import 'package:flutter_scaffold/core/scoped_models/base_model.dart';
import 'package:flutter_scaffold/core/services/api/api.dart';

class ArticleModel extends BaseModel {
  var _api = getIt<Api>();

  List<Article> articles = [];

  getArticles() async {
    await tryRun(() async {
      var result = await _api.getArticles();
      articles.clear();
      articles.addAll(result);
    });
  }
}
