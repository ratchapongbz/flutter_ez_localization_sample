import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LocalizationProvider extends ChangeNotifier {
  var _currentLocale = const Locale('en');

  Locale get currentLocale => _currentLocale;

  Future<void> changeLocale(BuildContext context, Locale newLocale) async {
    await context.setLocale(newLocale);
    _currentLocale = newLocale;
    notifyListeners();
  }
}
