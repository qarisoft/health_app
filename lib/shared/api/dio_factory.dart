// ignore_for_file: unused_import, dead_code

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/services/storage.dart';
import 'package:health_app/di.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const apiUrlKey = 'apiUrlKey_1';

String get _getUrl =>
    appStorage.getString(apiUrlKey) ?? 'http://10.0.2.2:7164/api';

Dio dioFactory() {
  Dio dio = Dio();

  Duration timeOut = const Duration(minutes: 10); // 60 seconds

  Map<String, String> headers = {
    AppHeaders.contentType: AppHeaders.applicationJson,
    AppHeaders.accept: AppHeaders.applicationJson,
  };

  dio.options = BaseOptions(
    baseUrl: _getUrl,
    headers: headers,
    receiveTimeout: timeOut,
    sendTimeout: timeOut,
    connectTimeout: timeOut,
  );

  return dio;
}

class DioFactory {
  Future<bool> isServerAlive() async {
    final dio = getDio(geust: true);

    final response = await dio.get(
      '/App_Check/ping', // <-- Replace this with your actual endpoint path
      options: Options(
        receiveTimeout: const Duration(seconds: 3),
        sendTimeout: const Duration(seconds: 3),
      ),
    );

    return response.statusCode == 200;
  }

  final AppStorage _storage;

  DioFactory(this._storage);

  Dio getDio({bool geust = false}) {
    Dio dio = Dio();

    // 1. Fetch values from local storage
    String language = _storage.getappLoale();
    String? token = _storage.getUserToken();

    // 2. Define Timeouts
    Duration timeOut = const Duration(seconds: 60); // 60 seconds

    // 3. Set Base Options
    Map<String, String> headers = {
      AppHeaders.contentType: AppHeaders.applicationJson,
      AppHeaders.accept: AppHeaders.applicationJson,
      AppHeaders.defaultLanguage: language,
    };
    if (!geust && token != null) {
      headers.addEntries([MapEntry(AppHeaders.authorization, "Bearer $token")]);
    }

    dio.options = BaseOptions(
      baseUrl: _getUrl,
      headers: headers,
      receiveTimeout: timeOut,
      sendTimeout: timeOut,
      connectTimeout: timeOut,
      validateStatus: (int? status) {
        return status != null && status > 0;
      },
    );

    // dio.interceptors.add(
    //   PrettyDioLogger(
    //     requestHeader: true,
    //
    //   ),
    // );
    return dio;
  }
}
