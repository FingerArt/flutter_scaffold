import 'package:flutter/material.dart';
import 'package:flutter_scaffold/core/i10n/localization_intl.dart';
import 'package:flutter_scaffold/core/scoped_models/locale_model.dart';
import 'package:flutter_scaffold/core/scoped_models/theme_model.dart';
import 'package:provider/provider.dart';

/// 设置页
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L.of(context).settingsLabel),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(L.of(context).switchLanguageLabel),
                  DropdownButton<Lang>(
                    onChanged: (newLang) => Provider.of<LocaleModel>(context).switchLang(newLang),
                    items: <DropdownMenuItem<Lang>>[
                      DropdownMenuItem(child: Text("跟随系统"), value: Lang.auto),
                      DropdownMenuItem(child: Text("中文"), value: Lang.zh_CN),
                      DropdownMenuItem(child: Text("英文"), value: Lang.en),
                    ],
                    value: Provider.of<LocaleModel>(context).lang,
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(L.of(context).switchThemeLabel),
                  DropdownButton<ThemeCase>(
                    onChanged: (newModel) => Provider.of<ThemeModel>(context).switchTheme(newModel),
                    items: <DropdownMenuItem<ThemeCase>>[
                      DropdownMenuItem(child: Text("跟随系统"), value: ThemeCase.auto),
                      DropdownMenuItem(child: Text("正常模式"), value: ThemeCase.light),
                      DropdownMenuItem(child: Text("暗黑模式"), value: ThemeCase.dark),
                    ],
                    value: Provider.of<ThemeModel>(context).themeModel,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
