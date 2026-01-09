import 'dart:convert';

import 'package:health_app/auth_state.dart';
import 'package:health_app/core/services/storage.dart';
import 'package:health_app/features/doctor/data/requests/medical_record.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'medical_records.g.dart';

@riverpod
class MedicalRecordsStore extends _$MedicalRecordsStore {
  @override
  MedicalRecordList build() {
    final json = di<AppStorage>().getJson('MedicalRecordList');
    if (json != null) {
      try {
        return MedicalRecordList.fromJson(json);
      } catch (e) {
        return MedicalRecordList(records: []);
      }
    }

    return MedicalRecordList(records: []);
  }

  Future<void> addMedicalRecord(MedicalRecordRequest record) async {
    final newState = state.copyWith(records: [...state.records, record]);

    await di<AppStorage>().setString(
      'MedicalRecordList',
      jsonEncode(newState.toJson()),
    );
    ref.invalidateSelf();
  }
}
