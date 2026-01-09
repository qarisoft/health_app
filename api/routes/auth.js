// routes/auth.js
const express = require('express');
const router = express.Router();

const {authRules,validate} = require('./validators')

// 1. Register Patient
router.post('/register/patient',authRules.registerPatient, validate, (req, res) => {
    // هنا يتم وضع كود التخزين في قاعدة البيانات
    console.log('Patient Register Body:', req.body);

    // await 
    res.json({
        "success": true,
        "message": "Patient registered",
        "data": {
            "patientCode": "PM-37294128",
            "userId": 106
        }
    });
});

// 2. Register Doctor
router.post('/register/doctor',authRules.registerDoctor, validate, (req, res) => {
    console.log('Doctor Register Body:', req.body);
    res.json({
        "success": true,
        "message": "Doctor registration submitted (pending approval)",
        "data": null
    });
});

// 3. Register Pharmacist
router.post('/register/pharmacist', authRules.registerPharmacist, validate,(req, res) => {
    console.log('Pharmacist Register Body:', req.body);
    res.json({
        "success": true,
        "message": "Pharmacist registration submitted (pending approval)",
        "data": null
    });
});

// 4. Login
router.post('/login',authRules.login, validate, (req, res) => {
    console.log('Login Body:', req.body);
    res.json({
        "success": true,
        "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.mockToken",
        "role": "Doctor",
        // "role": "Patient",
        "userId": 102
    });
});

// 5. Logout
router.post('/logout', (req, res) => {
    res.json({
        "success": true,
        "message": "Logged out"
    });
});

// 6. Change Password
router.post('/change-password', (req, res) => {
    console.log('Change Password Body:', req.body);
    // محاكاة فشل (حسب طلبك في المثال)
    res.json({
        "success": false,
        "message": "كلمة المرور الحالية غير صحيحة"
    });
});

module.exports = router;