// routes/patient.js
const express = require("express");
const router = express.Router();

// 1. Initialize Profile
router.post("/initialize-profile", (req, res) => {
  console.log("Init Profile:", req.body);
  res.json({
    success: true,
    message: "تم تهيئة الملف بنجاح",
    patientId: 102,
  });
});

// 2. Get Profile
router.get("/profile", (req, res) => {
  res.json({
    success: true,
    message: "تم جلب ملف المريض بنجاح",
    patient: {
      id: 102,
      userId: 102,
      fullName: "احمد محمد احمد محمد ",
      dateOfBirth: "2001-12-06T18:46:40.901",
      gender: 1,
      phoneNumber: "321321321",
      email: "Ahm_moh@example.com",
      address: "صنعاء",
      bloodType: 7,
      weight: 62,
      height: 156,
      emergencyContact: "صالح سعيد",
      emergencyPhone: "99663320",
      createdAt: "2025-12-06T18:44:20.506788",
      updatedAt: "2025-12-06T19:05:21.5390187",
    },
  });
});

// 3. Update Profile
router.put("/profile", (req, res) => {
  console.log("Update Patient:", req.body);
  res.json({
    success: true,
    message: "تم التحديث",
    patient: {
      ...req.body,
      id: 102,
      userId: 102,
      updatedAt: new Date().toISOString(),
    },
  });
});

// 4. Generate QR
router.post("/generate-qr", (req, res) => {
  res.json({
    success: true,
    message: "تم توليد رمز QR بنجاح",
    qrCodeUrl:
      "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA9QAAAPUAQAAAABkr0wpAAAFyklEQVR4nO3dW27bMBCFYe+g+99ld9ACTVOSc9GFtuuXTw9FHEeaYjBzzi+Soh6/Pnb8fIgt52pNj9EWmspLeCh2wExYESO7N/jE4X5MztWaHqMtNJWX8FDsgJmwIkZ2b/CZw/2YnKs1PUZbaCov4aHYATNhxZ6RH/H48fUXXz+F79Jp+Y8PLiq2nKs1PUZbaCov4aHYYYuZxu+Xj+OsY6Qbp81nNBcVW87Vmh6jLTSVl/BQ7LDFTOGsMKAWOutvmf35dvk4n9Him9hyrtb0GG2hqbyEh2KH55lp5rDxcRxhaK1CNbHlXK3pMdpCU3kJD8UOb2SmecYz3Ag3d4UhhNhyrtb0GG2hqbyEh2KH1zJTZS1jVK36GAbe0vMG2+vXxJZztabHaAtN5SU8FDucPx/6gn/yRUteE1vO1Zoeoy00lZfwUOxwxkz18T1wF7Bq/nYMiC3jeOdXFlvO1Zoeoy00lZfwUOxwj5kq+go7duTFci3hjfnM6ilVseVcrekx2kJTeQkPxQ5bzLQOvsUZy2rbjjTtuVwgLL0QW87Vmh6jLTSVl/BQ7PAMMy2UNk64imrtxE549EFsOVdreoy20FRewkOxwyYzVVvWLeNzgcjSE6mB65Y1bWLLuVrTY7SFpvISHoodnmSmeheQPNkZ9tGZaXDZp62Cu25sT2w5V2t6jLbQVF7CQ7HDFWZahuHm8bUFq+afLjyIEKjxcD8PseVcrekx2kJTeQkPxQ4X328QjvAMQoC+9otqsZvYcq7W9Bhtoam8hIdih6eYKdBXteptXKyacq0wL/yx2HKu1vQYbaGpvISHYoctZqoArx1BCyvZwhfV5b55rRoZuDMfKracqzU9RltoKi/hodjhhJnC+NoReB3s7DHwawzL5dPElnO1psdoC03lJTwUO9xnpoW+0lnLUW3QXA3hha3XxJZztabHaAtN5SU8FDu8gplmMAvvRwgvoMrzoWkRW7iy2HKu1vQYbaGpvISHYod9ZlrG0qppz7E8NEDb8UjbfJrYcq7W9Bhtoam8hIdih31mGsyVBwAqSuv26WieI03r4cSWc7Wmx2gLTeUlPBQ7bDBTGP1oX+mZl7il2dIwqzrOFVvO1Zoeoy00lZfwUOywy0z1CNoYs1v+pAW0BHfj8ofr18SWc7Wmx2gLTeUlPBQ7HDDTwRsM2kVweclo9cbS82dTxZZztabHaAtN5SU8FDtc3M/j3+8zabWvO2hfE59fPb9+FFvO1Zoeoy00lZfwUOxwh5kq1UxTlPmL+dwxUrbsoVtvByi2nKs1PUZbaCov4aHY4R4zzXc4zTBad5GF3ALDVVOmYsu5WtNjtIWm8hIeih2eZ6aw+3KCsUVq6nPzBeZDbDlXa3qMttBUXsJDscM9ZhpzmvW74QOlhWs269zCwsGT+VCx5Vyt6THaQlN5CQ/FDhefN2hMs37t1Fi6tvzUrm4TW87Vmh6jLTSVl/BQ7LDFTOuIWBwUC511PKBWvVsh/H/ElnO1psdoC03lJTwUO9xnpmrXtXbbjuanKs482zkOseVcrekx2kJTeQkPxQ4bzDRIq0W9+hHSZbFcGqoTW87Vmh6jLTSVl/BQ7PAeZppRb9kMN4xfVvOhaQhObDlXa3qMttBUXsJDscMbmGl5nWM9UtfS8hL2cC8RseVcrekx2kJTeQkPxQ4XmalCqAr06jdODXxrbx/ElnO1psdoC03lJTwUO+wzUziq94KGb5tt/kLYNN4ntpyrNT1GW2gqL+Gh2GGDmf73IbacqzU9RltoKi/hodgBM2FFjOze4DOH+zE5V2t6jLbQVF7CQ7EDZsKKGNm9wWcO92Nyrtb0GG2hqbyEh2IHzIQVAyP/BrLHQweC1OgiAAAAAElFTkSuQmCC",
    token: "vhbCRj1QsQJutUFNm1HsvQ",
    expiresAt: new Date(Date.now() + 3600000).toISOString(),
  });
});

// 5. Emergency Screen
router.post("/emergency-screen", (req, res) => {
  res.json({
    success: true,
    message: "تم جلب معلومات الطوارئ بنجاح",
    emergencyInfo: {
      fullName: "احمد محمد احمد محمد",
      bloodType: 7,
      allergies: ["حساسية"],
      chronicDiseases: ["القلب"],
      currentMedications: ["اسبرين"],
      emergencyContact: "صالح سعيد",
      emergencyPhone: "99663320",
      qrCodeUrl: "data:image/png;base64,...",
    },
  });
});

// 6. Medical Records (List)
router.get("/medical-records", (req, res) => {
  res.json([
    {
      id: 4,
      diagnosis: "صداع",
      notes: "يعاني من الصداع النصفي",
      recordDate: "2025-12-06T19:17:09.772",
      doctorName: "د سليم سرحان الطبيب",
      patientName: "احمد محمد",
    },
  ]);
});

// 7. Prescriptions (List)
router.get("/prescriptions", (req, res) => {
  res.json([
    {
      id: 55,
      diagnosis: "التهاب",
      items: [
        {
          medicationName: "Amoxicillin",
          dosage: "500mg",
          isDispensed: true,
        },
      ],
    },
  ]);
});

module.exports = router;
