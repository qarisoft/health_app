// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/accounts_provider.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/features/home/data/providers/dashboard_summary.dart';
import 'package:health_app/l10n/app_localizations.dart';
import 'package:health_app/shared/functions.dart';

import '../features/home/ui/pages/p.dart' show patientSelectedPageIndexProvider;

extension CacheExtension on Ref {
  void cacheTheState({Duration? duration, bool forever = false}) {
    final link = keepAlive();
    Timer? timer;
    final Duration duration_ = duration ?? Duration(minutes: 5);

    onCancel(() {
      if (forever) return;
      timer?.cancel();
      timer = Timer(duration_, () {
        link.close();
      });
    });

    onResume(() {
      timer?.cancel();
    });

    onDispose(() {
      timer?.cancel();
    });
  }
}

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

  void pop<T extends Object?>([T? results]) {
    Navigator.of(this).maybePop(results);
  }

  Future<bool> mayPop<T extends Object?>([T? results]) {
    return Navigator.of(this).maybePop(results);
  }
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

extension LogOutExt on WidgetRef {
  void invalidateAllAuthProviders() {
    invalidate(authRecordStateProvider);
    invalidate(accountProvider);
    invalidate(allAcountsProvider);
    invalidate(patientDashboardSummaryProvider);
    invalidate(patientSelectedPageIndexProvider);
    // invalidate(pa);
  }
}

extension UpdateAccount on Ref {
  void updateAccount() {
    invalidate(authRecordStateProvider);
    invalidate(accountProvider);
    invalidate(allAcountsProvider);
    invalidate(patientDashboardSummaryProvider);
    // invalidate(pa);
  }
}

extension BloodTypeEx on int {
  String bloodTypeString() {
    return BloodType.fromValue(this).symbol;
  }

  int get next => this + 1;

  BloodType bloodType() {
    return BloodType.fromValue(this);
  }
}
