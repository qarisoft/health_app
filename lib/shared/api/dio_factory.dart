// ignore_for_file: unused_import, dead_code

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/services/storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio dioFactory() {
  Dio dio = Dio();

  Duration timeOut = const Duration(minutes: 10); // 60 seconds

  // 3. Set Base Options
  Map<String, String> headers = {
    AppHeaders.contentType: AppHeaders.applicationJson,
    AppHeaders.accept: AppHeaders.applicationJson,
  };

  dio.options = BaseOptions(
    baseUrl: K.baseUrl,
    headers: headers,
    receiveTimeout: timeOut,
    sendTimeout: timeOut,
    connectTimeout: timeOut,
    // validateStatus: (int? status) {
    //   return status != null && status > 0;
    // },
  );

  // 4. Interceptors (Logging)
  // Only show logs in Debug mode, never in Release mode
  // if (!kReleaseMode) {
  //   dio.interceptors.add(
  //     PrettyDioLogger(
  //       requestHeader: true,
  //       // requestBody: true,
  //       responseHeader: true,
  //       responseBody: true,
  //     ),
  //   );
  // }

  return dio;
}

class DioFactory {
  Future<bool> isServerAlive() async {
    // 1. Get a guest Dio instance (no auth token needed)
    final dio = getDio(geust: true);

    try {
      // 2. Call your ping endpoint.
      // We use the Options object to override the timeout just for this request.
      // 3 seconds is usually plenty of time for a simple ping.
      final response = await dio.get(
        '/App_Check/ping', // <-- Replace this with your actual endpoint path
        options: Options(
          receiveTimeout: const Duration(seconds: 3),
          sendTimeout: const Duration(seconds: 3),
        ),
      );

      // 3. If the server returns a 200 OK, it's alive.
      return response.statusCode == 200;
    } catch (e) {
      // If a DioException occurs (e.g., connection timeout, network error, 502 Bad Gateway)
      // we catch it and return false.
      return false;
    }
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
    // Use 10.0.2.2 for Android Emulator, localhost for iOS Simulator
    // final String _baseUrl = Platform.isAndroid
    //     ? 'http://10.0.2.2:7164/api'
    //     : 'http://localhost:7164/api';

    dio.options = BaseOptions(
      baseUrl: K.baseUrl,
      headers: headers,
      receiveTimeout: timeOut,
      sendTimeout: timeOut,
      connectTimeout: timeOut,
      validateStatus: (int? status) {
        // Return true to handle errors manually in your Repository,
        // or let Dio throw exceptions for status > 400.
        return status != null && status > 0;
      },
    );

    // 4. Interceptors (Logging)
    // Only show logs in Debug mode, never in Release mode
    // if (!kReleaseMode) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        // requestBody: true,
        // request: true,
        // responseHeader: true,
        // responseBody: true,
      ),
    );
    // }
    // pm-ea3e5492

    // 5. Authentication Interceptor (Optional)
    // Useful for refreshing tokens automatically on 401 errors
    //   dio.interceptors.add(
    //     InterceptorsWrapper(
    //       onError: (DioException e, handler) async {
    //         if (e.response?.statusCode == 401) {
    //           // Handle Token Refresh logic here...
    //         }
    //         return handler.next(e);
    //       },
    //     ),
    //   );

    return dio;
  }
}
