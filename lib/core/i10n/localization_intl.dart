import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../generated/i10n/messages_all.dart'; //1

class L {
  static Future<L> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    //2
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return new L();
    });
  }

  static L of(BuildContext context) {
    return Localizations.of<L>(context, L);
  }

  static const delegate = AppLocalizationsDelegate();

  String get settingsLabel => Intl.message('设置', name: 'settingsLabel');
}

//Locale代理类
class AppLocalizationsDelegate extends LocalizationsDelegate<L> {
  const AppLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => supportedLocales.indexWhere((e) => e.languageCode == locale.languageCode) >= 0;

  List<Locale> get supportedLocales => [
        const Locale("zh", ''),
        const Locale("en", ''),
      ];

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<L> load(Locale locale) {
    //3
    return L.load(locale);
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
