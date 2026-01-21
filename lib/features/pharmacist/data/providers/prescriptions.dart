import '../../domain/models/prescription.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'prescriptions.g.dart';

@riverpod
class Prescriptions extends _$Prescriptions {
  @override
  List<Prescription> build() {
    ref.keepAlive();

    return [];
  }

  void setPrescriptions(List<Prescription> prescriptions) {
    state = prescriptions;
  }
}
