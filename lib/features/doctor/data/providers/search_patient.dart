import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app/core/error/app_error.dart';
import 'package:health_app/di.dart';
import 'package:health_app/features/doctor/data/responses/patient_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'search_patient.freezed.dart';
part 'search_patient.g.dart';

@riverpod
FutureOr<ErrorOr<Patient?>> searchPatient(
  Ref ref, {
  required String identifier,
}) async {
  final res = await appRepo.searchPatient(identifier);
  return res.when(
    success: (s) => ErrorOr.success(data: PatientResponse.fromJson(s).patient),
    error: (er) => ErrorOr.error(error: er),
  );
}

@freezed
abstract class MedicationSearchResult with _$MedicationSearchResult {
  factory MedicationSearchResult({
    required int drugId,
    String? scientificName,
    String? brandName,
    String? chemicalName,
  }) = _MedicationSearchResult;

  factory MedicationSearchResult.fromJson(Map<String, dynamic> json) =>
      _$MedicationSearchResultFromJson(json);
}

@riverpod
FutureOr<ErrorOr<List<MedicationSearchResult>>> searchMedication(
  Ref ref, {
  required String identifier,
}) async {
  final dio = appRepo.getDio();
  final res = await dio.get('/Doctor/search-drugs?query=$identifier');
  final data = res.data;
  if (data.runtimeType is List) {
    return ErrorOr.success(
      data: data.map((s) => MedicationSearchResult.fromJson(s)).toList(),
    );
  }
  return ErrorOr.success(data: []);
}

@riverpod
class MedicationSearchResults extends _$MedicationSearchResults {
  @override
  List<MedicationSearchResult> build() {
    return [];
  }

  void init(List<MedicationSearchResult> data) {
    state = data;
  }
}
