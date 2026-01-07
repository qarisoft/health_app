// routes/admin.js
const express = require('express');
const router = express.Router();

// 1. Pending Registrations
router.get('/pending-registrations', (req, res) => {
    res.json([
        {
            "id": 107,
            "nationalId": "4455667788",
            "role": 2, // Doctor
            "status": 1,
            "doctorInfo": {
                "fullName": "د. جديد",
                "specialization": "عيون",
                "hospital": "المركزي"
            },
            "pharmacistInfo": null
        },
        {
            "id": 109,
            "nationalId": "6369875241",
            "role": 3, // Pharmacist
            "status": 1,
            "doctorInfo": null,
            "pharmacistInfo": {
                "fullName": "صيدلي جديد",
                "pharmacyName": "صيدلية النور"
            }
        }
    ]);
});

// 2. Approve User (Using URL Param as per spec logic, but REST standard)
// ملاحظة: الرابط في طلبك هو /approve/107.
router.post('/approve/:id', (req, res) => {
    const userId = req.params.id;
    console.log(`Approving user ${userId}`);
    res.send("User approved successfully");
});

// 3. Reject User
router.post('/reject/:id', (req, res) => {
    const userId = req.params.id;
    console.log(`Rejecting user ${userId}`);
    res.send("User registration rejected");
});

// 4. Get Users (Filter)
router.post('/GetUsers', (req, res) => {
    console.log('Filter Users:', req.body);
    res.json({
        "success": true,
        "message": "تم جلب قائمة المستخدمين بنجاح",
        "users": [
            {
                "id": 105,
                "nationalId": "5000000002",
                "role": 1,
                "status": 2,
                "createdAt": "2025-12-06T22:10:32.7639365"
            }
        ],
        "totalCount": 1
    });
});

// 5. Update User Status
router.post('/user-status', (req, res) => {
    console.log('Change Status:', req.body);
    res.json({
        "success": true,
        "message": "تم تحديث حالة المستخدم بنجاح"
    });
});

// 6. Audit Logs
router.post('/audit-logs', (req, res) => {
    res.json({
        "success": true,
        "message": "تم جلب سجل التدقيق بنجاح",
        "logs": [],
        "totalCount": 0
    });
});

// 7. Statistics
router.get('/statistics', (req, res) => {
    res.json({
        "success": true,
        "message": "Statistics retrieved",
        "statistics": {
            "totalUsers": 150,
            "totalPatients": 100,
            "totalDoctors": 30,
            "totalPharmacists": 20,
            "pendingApprovals": 5
        }
    });
});

// 8. Send Notification
router.post('/send-notification', (req, res) => {
    console.log('Sending Notification to:', req.body.userIds);
    res.json({
        "success": true,
        "message": "تم إرسال الإشعارات بنجاح",
        "sentCount": req.body.userIds.length,
        "failedCount": 0
    });
});

module.exports = router;