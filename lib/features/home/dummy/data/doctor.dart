import 'package:flutter/material.dart';

enum AppointmentStatus {
  scheduled,
  confirmed,
  completed,
  cancelled,
  rescheduled,
}

enum AppointmentType {
  generalCheckup,
  specialistConsultation,
  followUp,
  emergency,
  labTest,
  vaccination,
  surgery,
  therapy,
}

class DoctorAppointment {
  final String id;
  final String doctorId;
  final String doctorName;
  final String doctorSpecialization;
  final String doctorImageUrl;
  final String hospitalName;
  final String hospitalAddress;
  final String roomNumber;
  final DateTime appointmentDateTime;
  final Duration duration;
  final AppointmentStatus status;
  final AppointmentType type;
  final String reason;
  final String notes;
  final List<String> symptoms;
  final bool isTelemedicine;
  final String meetingLink;
  final double consultationFee;
  final bool isPaid;
  final List<String> documents;
  final List<String> prescribedMedications;
  final DateTime? followUpDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  const DoctorAppointment({
    required this.id,
    required this.doctorId,
    required this.doctorName,
    required this.doctorSpecialization,
    required this.doctorImageUrl,
    required this.hospitalName,
    required this.hospitalAddress,
    required this.roomNumber,
    required this.appointmentDateTime,
    required this.duration,
    required this.status,
    required this.type,
    required this.reason,
    required this.notes,
    required this.symptoms,
    required this.isTelemedicine,
    required this.meetingLink,
    required this.consultationFee,
    required this.isPaid,
    required this.documents,
    required this.prescribedMedications,
    this.followUpDate,
    required this.createdAt,
    required this.updatedAt,
  });

  // Helper methods
  bool get isUpcoming => appointmentDateTime.isAfter(DateTime.now());
  bool get isPast => appointmentDateTime.isBefore(DateTime.now());
  bool get isToday => appointmentDateTime.day == DateTime.now().day && 
                     appointmentDateTime.month == DateTime.now().month && 
                     appointmentDateTime.year == DateTime.now().year;
  
  String get formattedDate {
    final now = DateTime.now();
    final diff = appointmentDateTime.difference(DateTime(now.year, now.month, now.day));
    
    if (diff.inDays == 0) return 'Today';
    if (diff.inDays == 1) return 'Tomorrow';
    if (diff.inDays == -1) return 'Yesterday';
    if (diff.inDays < 7 && diff.inDays > -7) {
      return '${appointmentDateTime.day}/${appointmentDateTime.month}';
    }
    return '${appointmentDateTime.day}/${appointmentDateTime.month}/${appointmentDateTime.year}';
  }
  
  String get formattedTime {
    final hour = appointmentDateTime.hour;
    final minute = appointmentDateTime.minute;
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : hour;
    return '$displayHour:${minute.toString().padLeft(2, '0')} $period';
  }
  
  String get formattedDateTime => '$formattedDate at $formattedTime';
  
  Color get statusColor {
    switch (status) {
      case AppointmentStatus.scheduled:
        return Colors.blue;
      case AppointmentStatus.confirmed:
        return Colors.green;
      case AppointmentStatus.completed:
        return Colors.grey;
      case AppointmentStatus.cancelled:
        return Colors.red;
      case AppointmentStatus.rescheduled:
        return Colors.orange;
    }
  }
  
  String get statusText {
    switch (status) {
      case AppointmentStatus.scheduled:
        return 'Scheduled';
      case AppointmentStatus.confirmed:
        return 'Confirmed';
      case AppointmentStatus.completed:
        return 'Completed';
      case AppointmentStatus.cancelled:
        return 'Cancelled';
      case AppointmentStatus.rescheduled:
        return 'Rescheduled';
    }
  }
  
  IconData get statusIcon {
    switch (status) {
      case AppointmentStatus.scheduled:
        return Icons.calendar_today;
      case AppointmentStatus.confirmed:
        return Icons.check_circle;
      case AppointmentStatus.completed:
        return Icons.done_all;
      case AppointmentStatus.cancelled:
        return Icons.cancel;
      case AppointmentStatus.rescheduled:
        return Icons.update;
    }
  }
  
  IconData get typeIcon {
    switch (type) {
      case AppointmentType.generalCheckup:
        return Icons.medical_services;
      case AppointmentType.specialistConsultation:
        return Icons.person;
      case AppointmentType.followUp:
        return Icons.history;
      case AppointmentType.emergency:
        return Icons.emergency;
      case AppointmentType.labTest:
        return Icons.science;
      case AppointmentType.vaccination:
        return Icons.medical_information;
      case AppointmentType.surgery:
        return Icons.healing;
      case AppointmentType.therapy:
        return Icons.psychology;
    }
  }
  
  String get typeText {
    switch (type) {
      case AppointmentType.generalCheckup:
        return 'General Checkup';
      case AppointmentType.specialistConsultation:
        return 'Specialist Consultation';
      case AppointmentType.followUp:
        return 'Follow-up';
      case AppointmentType.emergency:
        return 'Emergency';
      case AppointmentType.labTest:
        return 'Lab Test';
      case AppointmentType.vaccination:
        return 'Vaccination';
      case AppointmentType.surgery:
        return 'Surgery';
      case AppointmentType.therapy:
        return 'Therapy';
    }
  }

  // Copy with method for immutability
  DoctorAppointment copyWith({
    String? id,
    String? doctorId,
    String? doctorName,
    String? doctorSpecialization,
    String? doctorImageUrl,
    String? hospitalName,
    String? hospitalAddress,
    String? roomNumber,
    DateTime? appointmentDateTime,
    Duration? duration,
    AppointmentStatus? status,
    AppointmentType? type,
    String? reason,
    String? notes,
    List<String>? symptoms,
    bool? isTelemedicine,
    String? meetingLink,
    double? consultationFee,
    bool? isPaid,
    List<String>? documents,
    List<String>? prescribedMedications,
    DateTime? followUpDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DoctorAppointment(
      id: id ?? this.id,
      doctorId: doctorId ?? this.doctorId,
      doctorName: doctorName ?? this.doctorName,
      doctorSpecialization: doctorSpecialization ?? this.doctorSpecialization,
      doctorImageUrl: doctorImageUrl ?? this.doctorImageUrl,
      hospitalName: hospitalName ?? this.hospitalName,
      hospitalAddress: hospitalAddress ?? this.hospitalAddress,
      roomNumber: roomNumber ?? this.roomNumber,
      appointmentDateTime: appointmentDateTime ?? this.appointmentDateTime,
      duration: duration ?? this.duration,
      status: status ?? this.status,
      type: type ?? this.type,
      reason: reason ?? this.reason,
      notes: notes ?? this.notes,
      symptoms: symptoms ?? this.symptoms,
      isTelemedicine: isTelemedicine ?? this.isTelemedicine,
      meetingLink: meetingLink ?? this.meetingLink,
      consultationFee: consultationFee ?? this.consultationFee,
      isPaid: isPaid ?? this.isPaid,
      documents: documents ?? this.documents,
      prescribedMedications: prescribedMedications ?? this.prescribedMedications,
      followUpDate: followUpDate ?? this.followUpDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctorId': doctorId,
      'doctorName': doctorName,
      'doctorSpecialization': doctorSpecialization,
      'doctorImageUrl': doctorImageUrl,
      'hospitalName': hospitalName,
      'hospitalAddress': hospitalAddress,
      'roomNumber': roomNumber,
      'appointmentDateTime': appointmentDateTime.toIso8601String(),
      'duration': duration.inMinutes,
      'status': status.index,
      'type': type.index,
      'reason': reason,
      'notes': notes,
      'symptoms': symptoms,
      'isTelemedicine': isTelemedicine,
      'meetingLink': meetingLink,
      'consultationFee': consultationFee,
      'isPaid': isPaid,
      'documents': documents,
      'prescribedMedications': prescribedMedications,
      'followUpDate': followUpDate?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory DoctorAppointment.fromJson(Map<String, dynamic> json) {
    return DoctorAppointment(
      id: json['id'] as String,
      doctorId: json['doctorId'] as String,
      doctorName: json['doctorName'] as String,
      doctorSpecialization: json['doctorSpecialization'] as String,
      doctorImageUrl: json['doctorImageUrl'] as String,
      hospitalName: json['hospitalName'] as String,
      hospitalAddress: json['hospitalAddress'] as String,
      roomNumber: json['roomNumber'] as String,
      appointmentDateTime: DateTime.parse(json['appointmentDateTime'] as String),
      duration: Duration(minutes: json['duration'] as int),
      status: AppointmentStatus.values[json['status'] as int],
      type: AppointmentType.values[json['type'] as int],
      reason: json['reason'] as String,
      notes: json['notes'] as String,
      symptoms: List<String>.from(json['symptoms'] as List),
      isTelemedicine: json['isTelemedicine'] as bool,
      meetingLink: json['meetingLink'] as String,
      consultationFee: json['consultationFee'] as double,
      isPaid: json['isPaid'] as bool,
      documents: List<String>.from(json['documents'] as List),
      prescribedMedications: List<String>.from(json['prescribedMedications'] as List),
      followUpDate: json['followUpDate'] != null 
          ? DateTime.parse(json['followUpDate'] as String)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}

// Extension for filtering and sorting
extension DoctorAppointmentListExtension on List<DoctorAppointment> {
  List<DoctorAppointment> get upcoming {
    final now = DateTime.now();
    return where((appointment) => appointment.appointmentDateTime.isAfter(now))
        .toList()
        .sortedByDateTime();
  }

  List<DoctorAppointment> get past {
    final now = DateTime.now();
    return where((appointment) => appointment.appointmentDateTime.isBefore(now))
        .toList()
        .sortedByDateTimeDesc();
  }

  List<DoctorAppointment> get today {
    final now = DateTime.now();
    return where((appointment) => 
        appointment.appointmentDateTime.day == now.day &&
        appointment.appointmentDateTime.month == now.month &&
        appointment.appointmentDateTime.year == now.year)
        .toList()
        .sortedByDateTime();
  }

  List<DoctorAppointment> sortedByDateTime() {
    return List<DoctorAppointment>.from(this)
      ..sort((a, b) => a.appointmentDateTime.compareTo(b.appointmentDateTime));
  }

  List<DoctorAppointment> sortedByDateTimeDesc() {
    return List<DoctorAppointment>.from(this)
      ..sort((a, b) => b.appointmentDateTime.compareTo(a.appointmentDateTime));
  }

  List<DoctorAppointment> byStatus(AppointmentStatus status) {
    return where((appointment) => appointment.status == status)
        .toList()
        .sortedByDateTime();
  }

  List<DoctorAppointment> byType(AppointmentType type) {
    return where((appointment) => appointment.type == type)
        .toList()
        .sortedByDateTime();
  }

  List<DoctorAppointment> byDoctor(String doctorId) {
    return where((appointment) => appointment.doctorId == doctorId)
        .toList()
        .sortedByDateTimeDesc();
  }
}