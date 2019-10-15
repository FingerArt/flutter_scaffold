import 'package:flutter_scaffold/core/scoped_models/base_model.dart';

class SettingsModel extends BaseModel {
  Lang _lang = Lang.auto;
  ThemeModel _themeModel = ThemeModel.auto;

  get lang => _lang;

  get themeModel => _themeModel;

  changeLang(Lang lang) {
    _lang = lang;
    setState(ViewState.Success);
  }

  changeTheme(ThemeModel themeModel) {
    _themeModel = themeModel;
    setState(ViewState.Success);
  }
}

enum Lang { auto, zh_CN, en }
enum ThemeModel { auto, light, dark }
