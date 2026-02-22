import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const PatientQrApp());
}

class PatientQrApp extends StatelessWidget {
  const PatientQrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const PatientQrScreen(),
    );
  }
}

const data = {
  "success": true,
  "message": "Comprehensive patient profile retrieved.",
  "patient": {
    "id": 3132,
    "userId": 3132,
    "fullName": "سليم سرحان الطبيب",
    "dateOfBirth": "1992-05-15T00:00:00",
    "gender": 1,
    "bloodType": 5,
    "weight": 82.5,
    "height": 178.0,
    "phoneNumber": "+967771234567",
    "email": "salim.doctor@example.com",
    "emergencyContact": "Ahmed Sarhan",
    "emergencyPhone": "771878132",
    "allergies": [
      {
        "id": 101,
        "allergenName": "Penicillin",
        "reaction": "Anaphylaxis",
        "severity": "High",
        "createdAt": "2024-01-10T10:00:00",
      },
      {
        "id": 102,
        "allergenName": "Peanuts",
        "reaction": "Skin Rash",
        "severity": "Moderate",
        "createdAt": "2024-02-15T11:30:00",
      },
    ],
    "chronicDiseases": [
      {
        "id": 501,
        "diseaseName": "Hypertension",
        "description": "High blood pressure managed with medication",
        "diagnosisDate": "2020-11-20T00:00:00",
      },
      {
        "id": 502,
        "diseaseName": "Type 2 Diabetes",
        "description": "Insulin dependent",
        "diagnosisDate": "2021-05-12T00:00:00",
      },
    ],
    "surgeries": [
      {
        "id": 901,
        "surgeryName": "Appendectomy",
        "hospital": "Al-Thawra Hospital",
        "surgeryDate": "2018-03-25T00:00:00",
        "surgeon": "Dr. Khalid Mansour",
      },
    ],
    "prescriptions": [
      {
        "id": 2001,
        "doctorName": "Dr. Sarah Ahmed",
        "diagnosis": "Seasonal Influenza",
        "prescriptionDate": "2026-02-01T08:00:00",
        "items": [
          {
            "medicationName": "Tamiflu",
            "dosage": "75mg",
            "frequency": "Twice daily",
            "duration": "5 days",
          },
          {
            "medicationName": "Paracetamol",
            "dosage": "500mg",
            "frequency": "Every 6 hours",
            "duration": "3 days",
          },
        ],
      },
    ],
  },
};
const datas = "name ........";

class PatientQrScreen extends StatelessWidget {
  const PatientQrScreen({super.key});

  // Your specific JSON data
  static const Map<String, dynamic> _patientJson = {
    "success": true,
    "message": "تم جلب ملف المريض بنجاح",
    "patient": {
      "id": 3132,
      "userId": 3132,
      "fullName": "سليم سرحان",
      "dateOfBirth": "2006-01-08T00:00:00",
      "gender": 0,
      "phoneNumber": "123456789",
      "email": "emaidsadsa@dsad.dsa",
      "address": null,
      "bloodType": "O+",
      "weight": 70.0,
      "height": 175.0,
      "emergencyContact": null,
      "emergencyPhone": null,
      "createdAt": "2026-02-22T01:40:32.2608079",
      "updatedAt": null,
      "data": data,
    },
  };

  @override
  Widget build(BuildContext context) {
    // Convert the Map to a JSON string for the QR code
    final String qrString = jsonEncode(datas);
    // final String qrString = jsonEncode(_patientJson);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Patient Digital ID"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Patient Info Card
            Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.surfaceVariant,
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(_patientJson['patient']['fullName']),
                subtitle: Text("ID: ${_patientJson['patient']['id']}"),
              ),
            ),
            const SizedBox(height: 40),

            // QR Code Section
            const Text(
              "Scan for Medical History",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: QrImageView(
                  data: qrString,
                  version: QrVersions.auto,
                  size: 250.0,
                  gapless: true,
                  errorStateBuilder: (cxt, err) {
                    return const Center(
                      child: Text("Data too large for QR code"),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Instructional Note
            const Text(
              "This QR code contains the full patient profile encrypted for medical use.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
