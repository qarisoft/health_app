// routes/pharmacist.js
const express = require("express");
const router = express.Router();

// 1. Get Profile
router.get("/profile", (req, res) => {
  res.json({
    success: true,
    message: "تم العثور على ملف الصيدلي",
    pharmacist: {
      id: 202,
      fullName: "صيدلي محترف",
      pharmacyName: "صيدلية الشفاء",
      licenseNumber: "PH-554433",
      phoneNumber: "777666555",
      email: "pharma@example.com",
    },
  });
});

// 2. Update Profile
router.put("/profile", (req, res) => {
  console.log("Update Pharmacist:", req.body);
  res.json({
    success: true,
    message: "تم التحديث",
    pharmacist: { ...req.body, id: 202 },
  });
});

// 3. Search Prescription
router.post("/search-prescription", (req, res) => {
  console.log("Searching identifier:", req.body.identifier);
  res.json({
    success: true,
    message: "string",
    prescriptions: [
      {
        id: 0,
        patientId: 0,
        doctorId: 0,
        diagnosis: "string",
        notes: "string",
        status: 1,
        prescriptionDate: "2025-12-16T20:21:53.010Z",
        createdAt: "2025-12-16T20:21:53.010Z",
        doctorName: "string",
        patientName: "string",
        items: [
          {
            id: 0,
            prescriptionId: 0,
            medicationName: "string",
            dosage: "string",
            frequency: "string",
            duration: "string",
            instructions: "string",
            quantity: 0,
            isDispensed: true,
            createdAt: "2025-12-16T20:21:53.010Z",
          },
        ],
      },
    ],
  });
});

// 4. Check Drug Interactions
router.post("/check-drug-interactions", (req, res) => {
  // منطق محاكاة بسيط: إذا تم إرسال دوائين معينين نرجع تحذير
  const meds = req.body.medications || [];
  if (meds.length > 1) {
    res.json({
      success: true,
      message: "تحذير تفاعلات",
      warnings: [
        {
          medication1: meds[0],
          medication2: meds[1],
          severity: "High",
          description: "تفاعل خطير",
          recommendation: "يرجى مراجعة الطبيب",
        },
      ],
      hasInteractions: true,
    });
  } else {
    res.json({
      success: true,
      message: "لم يتم العثور على تفاعلات",
      warnings: [],
      hasInteractions: false,
    });
  }
});

// 5. Dispense Prescription
router.post("/dispense-prescription", (req, res) => {
  console.log("Dispense:", req.body);
  res.json({
    success: true,
    message: "تم الصرف",
    dispense: {
      id: 700,
      dispenseDate: new Date().toISOString(),
      items: [],
    },
    warnings: [],
  });
});

// 6. Create Prescription (Pharmacist)
router.post("/create", (req, res) => {
  console.log("Pharmacist Create Rx:", req.body);
  res.json({
    success: true,
    message: "تم الإنشاء",
    data: "Rx-Created-ID-123",
  });
});

// 7. Update Status
router.post("/prescription-status", (req, res) => {
  console.log("Update Status:", req.body);
  res.json({
    success: true,
    message: "تم تحديث الحالة",
    newStatus: req.body.status,
  });
});

module.exports = router;
