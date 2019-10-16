import 'dart:ui';

import 'package:flutter_scaffold/core/i10n/localization_intl.dart';
import 'package:flutter_scaffold/core/scoped_models/base_model.dart';

class LocaleModel extends BaseModel {
  var _supportedLocales = L.delegate.supportedLocales;
  Lang _lang = Lang.auto;

  get lang => _lang;

  Locale get locale => _supportedLocales.firstWhere((e) => _supportedLocales.indexOf(e) == _lang.index, orElse: () => null);

  switchLang(Lang lang) {
    _lang = lang;
    setState(ViewState.Success);
  }
}

enum Lang { zh_CN, en, auto }
