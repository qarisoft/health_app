import 'package:health_app/features/auth/data/responses/base/base_response.dart'
    show BaseResponse;
import 'package:json_annotation/json_annotation.dart';

part 'dispense_response.g.dart';

@JsonSerializable()
class DispenseResponse extends BaseResponse {
  DispenseResponse({super.message, super.success});

  factory DispenseResponse.fromJson(Map<String, dynamic> json) =>
      _$DispenseResponseFromJson(json);
}


// const Map<String,dynamic> d = {success: true, message: تم تحديث حالة الصرف بنجاح,
// dispense: {id: 1003, prescriptionId: 1012, pharmacistId: 4133, notes: ,
//dispenseDate: 2026-03-01T01:22:34.4008214Z,
// createdAt: 2026-03-01T01:22:34.4009209Z, pharmacistName: name,
// items: [
//   {id: 1003, prescriptionItemId: 1003, medicationName: باندول بروفين,
//   dosage: شراب, frequency: ثلاث مرات باليوم,
//   duration: شهرين, instructions: بعد الاكل,
//   quantity: 0, isDispensed: true, dispenseNotes: null
//   },
//   ]
//   warnings: []
//   }
// import 'package:http/http.dart';

// import 'package:freezed_annotation/freezed_annotation.dart';