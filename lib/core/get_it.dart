import 'package:flutter_scaffold/core/scoped_models/article_model.dart';
import 'package:flutter_scaffold/core/scoped_models/login_model.dart';
import 'package:flutter_scaffold/core/scoped_models/settings_model.dart';
import 'package:flutter_scaffold/core/services/api/api.dart';
import 'package:flutter_scaffold/core/services/api/fake_api.dart';
import 'package:flutter_scaffold/core/services/user_service.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

GetIt getIt = GetIt.instance;

setupGetIt() {
  /// LazySingleton
  getIt.registerLazySingleton<Api>(() => FakeApi());
  getIt.registerLazySingleton<UserService>(() => UserService());
  getIt.registerLazySingleton<Logger>(() => Logger());

  /// Factory
  getIt.registerFactory<LoginModel>(() => LoginModel());
  getIt.registerFactory<ArticleModel>(() => ArticleModel());
  getIt.registerFactory<SettingsModel>(() => SettingsModel());
}
