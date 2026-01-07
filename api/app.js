// app.js
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
const PORT = 7164; // نفس البورت المطلوب

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Import Routes (سنقوم بإنشائهم في الخطوات التالية)
const authRoutes = require('./routes/auth');
const doctorRoutes = require('./routes/doctor');
const patientRoutes = require('./routes/patient');
const pharmacistRoutes = require('./routes/pharmacist');
const adminRoutes = require('./routes/admin');

// Use Routes
app.use('/api/Auth', authRoutes);
app.use('/api/Doctor', doctorRoutes);
app.use('/api/Patient', patientRoutes);
app.use('/api/Pharmacist', pharmacistRoutes);
app.use('/api/Admin', adminRoutes);

// تشغيل السيرفر
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
    console.log('Ready to handle requests based on the specification.');
});