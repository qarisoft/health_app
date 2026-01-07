import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/core/services/storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  final AppStorage _storage;

  DioFactory(this._storage);

  Dio getDio({bool geust = false}) {
    Dio dio = Dio();

    // 1. Fetch values from local storage
    String language = _storage.getappLoale() ?? 'ar';
    String? token = _storage.getUserToken();

    // 2. Define Timeouts
    Duration timeOut = const Duration(minutes: 1); // 60 seconds

    // 3. Set Base Options
    Map<String, String> headers = {
      AppHeaders.contentType: AppHeaders.applicationJson,
      AppHeaders.accept: AppHeaders.applicationJson,
      AppHeaders.authorization: (token != null && !geust)
          ? "Bearer $token"
          : "",
      AppHeaders.defaultLanguage: language,
    };
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
    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }

    // 5. Authentication Interceptor (Optional)
    // Useful for refreshing tokens automatically on 401 errors
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            // Handle Token Refresh logic here...
          }
          return handler.next(e);
        },
      ),
    );

    return dio;
  }
}
