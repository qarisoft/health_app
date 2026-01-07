import 'dart:convert';

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

  double w(int fr) {
    return MediaQuery.widthOf(this) * fr * 0.01;
  }

  double h(int fr) {
    return MediaQuery.heightOf(this) * fr * 0.01;
  }
}

extension Loger on Object? {
  void log([String s='']) {
    if (this != null) {
      print('###: $s :=> ${toString()}');
    }
  }

  bool notNull() => this != null;
}

void xlog(Object o) {
  print('###: $o');
}

extension ToJson on String? {
  Map<String, dynamic> toJson() => jsonDecode(toString());
}

extension JsEncoder on Map<String, dynamic> {
  String jsencode() => jsonEncode(this);
}
