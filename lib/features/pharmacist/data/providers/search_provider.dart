import 'package:health_app/di.dart';
import 'package:health_app/features/pharmacist/data/providers/create_rescription.dart';
// import 'package:health_app/features/pharmacist/data/providers/create_rescription.dart';
import 'package:health_app/features/pharmacist/data/responses/search_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_provider.g.dart';

@riverpod
Future<List<IdName>> searchPatients(Ref ref) async {
  final dio = getDio;
  final res = await dio.get('/Pharmacist/patients-lookup');
  final data = res.data;
  // return PatientSearchResponse.fromJson(data);
  final response = PatientSearchResponse.fromJson(data);
  if (response.success ?? false) {
    return response.patients;
  }
  return [];
}

@riverpod
Future<List<IdName>> searchDoctors(Ref ref) async {
  final dio = getDio;
  final res = await dio.get('/Pharmacist/doctors-lookup');
  final data = res.data;
  final response = DoctorSearchResponse.fromJson(data);
  if (response.success ?? false) {
    return response.doctors;
  }
  return [];
}

// @riverpod
// Future<List<IdName>> searchDoctors(Ref ref) {
  
// }