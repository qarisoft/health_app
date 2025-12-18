import 'package:flutter/material.dart';
import 'package:health_app/l10n/app_localizations.dart';

extension AppEx on BuildContext {
  // Navigations
  Future<T?> toNamed<T>(String routeName) async =>
      await Navigator.of(this).pushNamed(routeName);

  Future<T?> to<T>(Widget w) async =>
      await Navigator.of(this).push(MaterialPageRoute(builder: (context) => w));

  void pop<T extends Object?>([T? results]) {
    Navigator.of(this).pop(results);
  }
  //

  AppLocalizations get tr => AppLocalizations.of(this)!;

  ThemeData get theme => Theme.of(this);

  bool get isArabic => tr.localeName == 'ar';
}

extension Loger on Object? {
  void log() {
    if (this != null) {
      print('###: ${toString()}');
    }
  }
}

void xlog(Object o) {
  print('###: $o');
}
