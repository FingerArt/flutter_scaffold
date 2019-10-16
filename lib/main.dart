import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_scaffold/core/get_it.dart';
import 'package:flutter_scaffold/core/i10n/localization_intl.dart';
import 'package:flutter_scaffold/core/provider/base_view.dart';
import 'package:flutter_scaffold/core/routers.dart';
import 'package:flutter_scaffold/core/scoped_models/locale_model.dart';
import 'package:flutter_scaffold/core/scoped_models/theme_model.dart';
import 'package:flutter_scaffold/ui/page/login_page.dart';

void main() {
  setupGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView2<ThemeModel, LocaleModel>(
      builder: (ctx, themeModel, localeModel, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: themeModel.theme(),
        darkTheme: themeModel.theme(platformDarkMode: true),
        home: LoginPage(),
        routes: routers,
        locale: localeModel.locale,
        localizationsDelegates: [
          L.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: L.delegate.supportedLocales,
      ),
    );
  }
}
