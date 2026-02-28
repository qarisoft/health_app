// test/app_repositories_test.dart
// import 'package:flutter/widgets.dart';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_app/core/constants/k.dart';
import 'package:health_app/shared/api/dio_factory.dart';
import 'package:health_app/shared/ex.dart';

void main() {
  final token =
      '10025F3DCC280064826D0298409FA9A8ECB7A1C7BA4EBC3CEFFBFB16BD197771D444EF1CB85AB1E6F382699EA329A016D16049353E12BB3D05590F5E20DB9E90';

  group('Authentication Tests', () {
    test('Login - Patient Success', () async {
      final dio = dioFactory();
      final headers = dio.options.headers;
      try {
        // headers.addEntries([MapEntry("refreshToken", "$token")]);
        // // headers.
        // dio.options.headers = headers;
        // dio.interceptors.add(Cookie('refreshToken', token));/
        // dio.

        // final res =
        await dio.get(
          // '/Patient/profile',
          '/Patient/emergency-screen',

          // '/Pharmacist/dispense-prescription',
          // data: {'identifier': '20000000010005', 'password': 'Admin@123'},
        );

        xlog('ddddddddddd');
      } on DioException catch (e) {
        final s = e.response?.statusCode;
        xlog('sdsdsds $s');
      } catch (e) {
        xlog(e.toString());
        xlog('sssssssssssss');
      }
    });
  });
}
