import 'package:flutter_scaffold/core/scoped_models/login_model.dart';
import 'package:flutter_scaffold/core/services/api/api.dart';
import 'package:flutter_scaffold/core/services/api/fake_api.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

setUp() {
  getIt.registerLazySingleton<Api>(() => FakeApi());
  getIt.registerFactory<LoginModel>(() => LoginModel());
}
