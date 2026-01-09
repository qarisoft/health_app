// test/app_repositories_test.dart
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_app/shared/api/api_repositories.dart';
import 'package:health_app/shared/api/api_service.dart';
import 'package:health_app/shared/api/dio_factory.dart';
import 'package:health_app/shared/ex.dart';
import 'package:health_app/core/error/app_error.dart';
// import 'package:health_app/features/auth/domain/models/auth_state.dart';
// import 'package:health_app/shared/api/api_service.dart';
// import 'package:health_app/core/services/storage.dart';
// import 'package:health_app/features/auth/data/repositories/app_repositories.dart';

// Import mocks
import './mock/mock_api.dart';

void main() {
  late AppRepositories repository;
  late ApiService mockApiService;
  late MockAppStorage mockStorage;

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    // final a = await SharedPreferences.getInstance();
    // repository = AppRepositories(api: ApiService(dio: DioFactory()), storage: storage)
    mockStorage = MockAppStorage();
    mockApiService = ApiService(dio: DioFactory(mockStorage).getDio());
    // mockApiService = MockApiService();
    repository = AppRepositories(api: mockApiService, storage: mockStorage);

    // // Setup common mock behaviors
    // when(() => mockStorage.clearAllAccounts()).thenAnswer((_) async {});
    // when(() => mockStorage.setAuthRecord(any())).thenAnswer((_) async {});
    // when(() => mockStorage.getUserToken()).thenReturn('mock_token');
  });

  group('Authentication Tests', () {
    test('Login - Patient Success', () async {
 
      final result = await repository.login(
        identifier: 'test',
        password: 'password',
      );

      final data = result.whenOrNull(success: (data) => data);

      data.log('data');
      // Assert
      expect(result.isSuccess, true);
      // expect(data?.accessToken, 'test_token');
      // expect(data?.role, 'patient');
      // expect(data?.userId, 1);
    });

    // test('Login - Doctor Success', () async {
    //   // Arrange
    //   final mockResponse = {
    //     'success': true,
    //     'accessToken': 'test_token',
    //     'role': 'doctor',
    //     'userId': 2,
    //   };

    //   when(
    //     () => mockApiService.login('doctor', 'password'),
    //   ).thenAnswer((_) async => mockResponse);

    //   // Act
    //   final result = await repository.login(
    //     identifier: 'doctor',
    //     password: 'password',
    //   );

    //   // Assert
    //   expect(result.isSuccess, true);
    //   expect(result.data?.role, 'doctor');
    // });

    // test('Login - Failed', () async {
    //   // Arrange
    //   final mockResponse = {'success': false, 'message': 'Invalid credentials'};

    //   when(
    //     () => mockApiService.login('wrong', 'wrong'),
    //   ).thenAnswer((_) async => mockResponse);

    //   // Act
    //   final result = await repository.login(
    //     identifier: 'wrong',
    //     password: 'wrong',
    //   );

    //   // Assert
    //   expect(result.isError, true);
    //   expect(result.error?.msg, 'Invalid credentials');
    // });

    // test('Register Patient', () async {
    //   // Arrange
    //   final mockResponse = createMockSuccessResponse('Patient registered', {
    //     'patientCode': 'PM-12345678',
    //     'userId': 100,
    //   });

    //   final patientData = {
    //     'nationalId': '1234567890',
    //     'password': 'password123',
    //     'confirmPassword': 'password123',
    //     'fullName': 'John Doe',
    //     'dateOfBirth': '1990-01-01',
    //     'phoneNumber': '1234567890',
    //     'email': 'john@example.com',
    //   };

    //   when(
    //     () => mockApiService.registerPatient(patientData),
    //   ).thenAnswer((_) async => mockResponse);

    //   // Act
    //   final result = await repository.registerPatient(patientData);

    //   // Assert
    //   expect(result.isSuccess, true);
    //   expect(result.data, true);
    // });

    // test('Register Doctor', () async {
    //   // Arrange
    //   final mockResponse = createMockSuccessResponse(
    //     'Doctor registration submitted (pending approval)',
    //   );

    //   final doctorData = {
    //     'nationalId': '1234567890',
    //     'password': 'password123',
    //     'confirmPassword': 'password123',
    //     'fullName': 'Dr. Smith',
    //     'email': 'dr.smith@example.com',
    //     'phoneNumber': '1234567890',
    //     'licenseNumber': 'DOC12345',
    //     'specialization': 'Cardiology',
    //     'hospital': 'City Hospital',
    //     'licenseDocumentUrl': 'http://example.com/doc.pdf',
    //   };

    //   when(
    //     () => mockApiService.registerDoctor(doctorData),
    //   ).thenAnswer((_) async => mockResponse);

    //   // Act
    //   final result = await repository.registerDoctor(doctorData);

    //   // Assert
    //   expect(result.isSuccess, true);
    //   expect(result.data, true);
    // });

    // test('Register Pharmacist', () async {
    //   // Arrange
    //   final mockResponse = createMockSuccessResponse(
    //     'Pharmacist registration submitted (pending approval)',
    //   );

    //   final pharmacistData = {
    //     'nationalId': '1234567890',
    //     'password': 'password123',
    //     'confirmPassword': 'password123',
    //     'fullName': 'Pharm. Johnson',
    //     'email': 'pharm@example.com',
    //     'phoneNumber': '1234567890',
    //     'licenseNumber': 'PHARM12345',
    //     'pharmacyName': 'City Pharmacy',
    //     'licenseDocumentUrl': 'http://example.com/doc.pdf',
    //   };

    //   when(
    //     () => mockApiService.registerPharmacist(pharmacistData),
    //   ).thenAnswer((_) async => mockResponse);

    //   // Act
    //   final result = await repository.registerPharmacist(pharmacistData);

    //   // Assert
    //   expect(result.isSuccess, true);
    //   expect(result.data, true);
    // });

    // test('Logout', () async {
    //   // Arrange
    //   final mockResponse = createMockSuccessResponse('Logged out');
    //   when(() => mockApiService.logout()).thenAnswer((_) async => mockResponse);

    //   // Act
    //   final result = await repository.logout();

    //   // Assert
    //   expect(result.isSuccess, true);
    //   expect(result.data, true);
    //   verify(() => mockStorage.clearAllAccounts()).called(1);
    // });

    // test('Change Password', () async {
    //   // Arrange
    //   final mockResponse = createMockSuccessResponse('Password changed');
    //   final passwordData = {
    //     'currentPassword': 'old123',
    //     'newPassword': 'new123',
    //     'confirmNewPassword': 'new123',
    //   };

    //   when(
    //     () => mockApiService.changePassword(passwordData),
    //   ).thenAnswer((_) async => mockResponse);

    //   // Act
    //   final result = await repository.changePassword(passwordData);

    //   // Assert
    //   expect(result.isSuccess, true);
    //   expect(result.data, true);
    // });
  });
}
