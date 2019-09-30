import 'package:flutter_scaffold/core/scoped_models/login_model.dart';
import 'package:flutter_scaffold/core/services/api/api.dart';
import 'package:flutter_scaffold/core/services/api/fake_api.dart';
import 'package:flutter_scaffold/core/services/user_service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

setupGetIt() {
  /// LazySingleton
  getIt.registerLazySingleton<Api>(() => FakeApi());
  getIt.registerLazySingleton<UserService>(() => UserService());

  /// Factory
  getIt.registerFactory<LoginModel>(() => LoginModel());
}
