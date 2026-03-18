// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/accounts_provider.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/features/home/data/providers/dashboard_summary.dart';
import 'package:health_app/l10n/app_localizations.dart';

extension CacheExtension on Ref {
  /// Keeps the provider alive for a specified [duration] after the last listener is removed.
  /// If a new listener is added before the timer completes, the timer is canceled and the state is kept.
  void cacheTheState({Duration? duration, bool forever = false}) {
    // Prevent the provider from being disposed immediately
    final link = keepAlive();
    Timer? timer;
    final Duration duration_ = duration ?? Duration(minutes: 5);

    // Triggered when the last UI element stops listening to this provider
    onCancel(() {
      if (forever) return;
      timer?.cancel();
      timer = Timer(duration_, () {
        // Timer completed without new listeners. Allow the provider to be destroyed.
        link.close();
      });
    });

    // if (forever) {
    //   return;
    // }
    // Triggered if a new UI element starts listening before the timer finishes
    onResume(() {
      timer?.cancel();
    });

    // Triggered when the provider is completely destroyed (e.g., via ref.invalidate)
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
