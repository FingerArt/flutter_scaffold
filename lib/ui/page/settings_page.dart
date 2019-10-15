import 'package:flutter/material.dart';
import 'package:flutter_scaffold/core/i10n/localization_intl.dart';
import 'package:flutter_scaffold/core/provider/base_view.dart';
import 'package:flutter_scaffold/core/scoped_models/settings_model.dart';

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
        child: BaseView<SettingsModel>(
          builder: (ctx, settings, child) => Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("切换语言"),
                    DropdownButton<Lang>(
                      onChanged: (newLang) => settings.changeLang(newLang),
                      items: <DropdownMenuItem<Lang>>[
                        DropdownMenuItem(child: Text("跟随系统"), value: Lang.auto),
                        DropdownMenuItem(child: Text("中文"), value: Lang.zh_CN),
                        DropdownMenuItem(child: Text("英文"), value: Lang.en),
                      ],
                      value: settings.lang,
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("切换主题"),
                    DropdownButton<ThemeModel>(
                      onChanged: (newModel) => settings.changeTheme(newModel),
                      items: <DropdownMenuItem<ThemeModel>>[
                        DropdownMenuItem(child: Text("跟随系统"), value: ThemeModel.auto),
                        DropdownMenuItem(child: Text("正常模式"), value: ThemeModel.light),
                        DropdownMenuItem(child: Text("暗黑模式"), value: ThemeModel.dark),
                      ],
                      value: settings.themeModel,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
