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
      // final headers = dio.options.headers;
      try {
        final res = await dio.post(
          // '/Patient/profile',
          // '/Patient/emergency-screen',
          // '/Auth/login',
          '/Auth/refresh',

          // '/Pharmacist/dispense-prescription',
          data: {
            'refreshToken':
                'AE65D2B8275F3A2722FB489E610393B41D6C113F0590B319DC95481C6C38CDA7A55C18499F9A096F3CB963C31E62C3CED546316A6740647A765BBD85D60001F3',
          },
          // data: {'identifier': '20000000010005', 'password': 'Admin@123'},
        );

        xlog('ddddddddddd${res.data}');
      } on DioException catch (e) {
        final s = e.response?.statusCode;
        xlog('sdsdsds ${e.response}');
        xlog('sdsdsds $s');
      } catch (e) {
        xlog(e.toString());
        xlog('sssssssssssss');
      }
    });

    test('Authorization Error 401 - 401', () async {
      final dio = dioFactory();
      // final headers = dio.options.headers;
      try {
        final res = await dio.post('/Doctor/search-patient');

        xlog('ddddddddddd${res.data}');
      } on DioException catch (e) {
        final s = e.response?.statusCode;
        xlog('sdsdsds ${e.message}');
        xlog('sdsdsds ${e.type}');
        xlog('sdsdsds $s');
      } catch (e) {
        xlog(e.toString());
        xlog('sssssssssssss');
      }
    });

    test('Ping', () async {
      final dio = dioFactory();
      // final headers = dio.options.headers;
      try {
        final res = await dio.get(K.pingUrl);

        xlog('ddddddddddd${res.data}');
      } on DioException catch (e) {
        final s = e.response?.statusCode;
        xlog('sdsdsds ${e.message}');
        xlog('sdsdsds ${e.type}');
        xlog('sdsdsds $s');
      } catch (e) {
        xlog(e.toString());
        xlog('sssssssssssss');
      }
    });
  });
}
