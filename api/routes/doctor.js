// routes/doctor.js
const express = require('express');
const router = express.Router();

// 1. Get Profile
router.get('/profile', (req, res) => {
    res.json({
        "success": true,
        "message": "تم العثور على ملف الطبيب",
        "doctor": {
            "id": 105,
            "userId": 105,
            "fullName": "د. علي محمود",
            "specialization": "باطنية",
            "licenseNumber": "DOC-998877",
            "hospital": "مستشفى الأمل",
            "phoneNumber": "777000111",
            "email": "doctor@example.com",
            "createdAt": new Date().toISOString(),
            "updatedAt": new Date().toISOString()
        }
    });
});

// 2. Update Profile
router.put('/profile', (req, res) => {
    console.log('Update Doctor Profile:', req.body);
    res.json({
        "success": true,
        "message": "تم العثور على ملف الطبيب",
        "doctor": {
            ...req.body, // دمج البيانات الجديدة
            "id": 105,
            "userId": 105,
            "updatedAt": new Date().toISOString()
        }
    });
});

// 3. Search Patient
router.post('/search-patient', (req, res) => {
    console.log('Search Identifier:', req.body.identifier);
    res.json({
        "success": true,
        "message": "تم العثور على المريض",
        "patient": {
            "id": 200,
            "fullName": "سعيد صالح",
            "dateOfBirth": "1990-05-20T00:00:00Z",
            "gender": 1,
            "bloodType": 1,
            "emergencyContact": "أخوه",
            "emergencyPhone": "777888999",
            "patientCode": "PM-12345",
            "allergies": [],
            "chronicDiseases": [],
            "surgeries": [],
            "medicalRecords": [],
            "prescriptions": []
        }
    });
});

// 4. Add Medical Record
router.post('/medical-record', (req, res) => {
    console.log('Add Medical Record:', req.body);
    res.json({
        "success": true,
        "message": "تم إضافة السجل الطبي",
        "medicalRecord": {
            "id": 55,
            ...req.body,
            "createdAt": new Date().toISOString(),
            "doctorName": "د. علي محمود",
            "patientName": "سعيد صالح"
        }
    });
});

// 5. Add Prescription
router.post('/AddPrescription', (req, res) => {
    console.log('Add Prescription:', req.body);
    res.json({
        "success": true,
        "message": "تم إضافة الوصفة",
        "prescription": {
            "id": 99,
            ...req.body,
            "status": 1,
            "prescriptionDate": new Date().toISOString(),
            "createdAt": new Date().toISOString(),
            "doctorName": "د. علي محمود",
            "patientName": "سعيد صالح"
        }
    });
});

module.exports = router;