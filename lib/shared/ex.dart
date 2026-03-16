// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/accounts_provider.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/l10n/app_localizations.dart';

// extension AppEx on BuildContext {
//   // Navigations
//
// }

extension AppEx on BuildContext {
  // Navigations
  Future<T?> toNamed<T>(String routeName) async =>
      await Navigator.of(this).pushNamed(routeName);

  Future<T?> to<T>(Widget w) async =>
      await Navigator.of(this).push(MaterialPageRoute(builder: (context) => w));


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
  // Future<T?> toNamed<T>(String routeName) async =>
  //     await Navigator.of(this).pushNamed(routeName);
  //
  // Future<T?> to<T>(Widget w) async =>
  //     await Navigator.of(this).push(MaterialPageRoute(builder: (context) => w));

  void pop<T extends Object?>([T? results]) {
    Navigator.of(this).pop(results);
  }

  Future<bool> mayPop<T extends Object?>([T? results]) {
    return Navigator.of(this).maybePop(results);
  }
  //
  //
  // AppLocalizations get tr => AppLocalizations.of(this)!;
  //
  // ThemeData get theme => Theme.of(this);
  //
  // bool get isArabic => tr.localeName == 'ar';
}

extension BoolEx on bool? {
  bool isN() {
    return this ?? false;
  }
}

extension Loger on Object? {
  void log([String s = '']) {
    if (this != null) {
      print('###: $s :=> ${toString()}');
    }
  }

  bool notNull() => this != null;
}

void xlog(Object? o) {
  print('###: $o');
}

extension ToJson on String? {
  Map<String, dynamic>? toJson() {
    if (this != null && toString().isNotEmpty) {
      return jsonDecode(toString());
    }
    return null;
  }
}

extension JsEncoder on Map<String, dynamic> {
  String jsencode() => jsonEncode(this);
}


extension LogOutExt on Ref{
  void invalidateAllAuthProviders(){
    invalidate(authRecordStateProvider);
    invalidate(accountProvider);
    invalidate(allAcountsProvider);
  }
}