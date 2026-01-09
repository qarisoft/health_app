const { body, param, query } = require("express-validator");
const { validationResult } = require("express-validator");

const validate = (req, res, next) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({
      success: false,
      message: "Validation Error",
      errors: errors.array(),
    });
  }
  next();
};
const rules = {
  // AUTH RULES
  registerPatient: [
    body("nationalId").notEmpty().withMessage("National ID is required"),
    body("email").isEmail().withMessage("Invalid email format"),
    body("password")
      .isLength({ min: 6 })
      .withMessage("Password must be at least 6 chars"),
    body("confirmPassword")
      .custom((value, { req }) => value === req.body.password)
      .withMessage("Passwords do not match"),
    body("fullName").notEmpty(),
    body("dateOfBirth").isISO8601().toDate(),
  ],

  registerDoctor: [
    body([
      "nationalId",
      "fullName",
      "licenseNumber",
      "specialization",
      "hospital",
    ]).notEmpty(),
    body("email").isEmail(),
    body("password").isLength({ min: 6 }),
  ],

  login: [
    body("identifier")
      .notEmpty()
      .withMessage("National ID or Patient Code required"),
    body("password").notEmpty(),
  ],

  changePassword: [
    body("currentPassword").notEmpty(),
    body("newPassword").isLength({ min: 6 }),
    body("confirmNewPassword").custom(
      (value, { req }) => value === req.body.newPassword
    ),
  ],

  // DOCTOR RULES
  updateDoctorProfile: [
    body("email").optional().isEmail(),
    body(["fullName", "specialization", "hospital"]).optional().notEmpty(),
  ],

  searchPatient: [
    body("identifier").notEmpty().withMessage("Search term is required"),
  ],

  addMedicalRecord: [
    body("patientId").isInt().withMessage("Valid Patient ID is required"),
    body("diagnosis").notEmpty(),
    body("symptoms").notEmpty(),
    body("recordDate").optional().isISO8601(),
  ],

  addPrescription: [
    body("patientId").isInt(),
    body("items")
      .isArray({ min: 1 })
      .withMessage("At least one medication is required"),
    body("items.*.medicationName").notEmpty(),
    body("items.*.quantity").isInt({ min: 1 }),
  ],

  // PHARMACIST RULES
  dispensePrescription: [
    body("prescriptionId").isInt(),
    body("items").isArray(),
    body("items.*.prescriptionItemId").isInt(),
    body("items.*.dispensed").isBoolean(),
  ],

  checkInteractions: [
    body("patientId").isInt(),
    body("medications")
      .isArray()
      .withMessage("Medications must be a list of strings"),
  ],

  // ADMIN RULES
  getUsers: [
    body("role").isInt(),
    body("pageNumber").optional().isInt({ min: 1 }),
    body("pageSize").optional().isInt({ min: 1, max: 100 }),
  ],

  updateUserStatus: [
    body("userId").isInt(),
    body("status").isInt(),
    body("reason").optional().isString(),
  ],

  sendNotification: [
    body("userIds").isArray({ min: 1 }),
    body("subject").notEmpty(),
    body("content").notEmpty(),
  ],
};

const authRules = {
    registerPatient: [
        body('nationalId').notEmpty().withMessage('رقم الهوية مطلوب'),
        body('fullName').notEmpty().withMessage('الاسم الكامل مطلوب'),
        body('email').isEmail().withMessage('البريد الإلكتروني غير صحيح'),
        body('password').isLength({ min: 6 }).withMessage('كلمة المرور يجب أن لا تقل عن 6 خانات'),
        body('confirmPassword').custom((value, { req }) => {
            if (value !== req.body.password) throw new Error('كلمات المرور غير متطابقة');
            return true;
        }),
        body('dateOfBirth').isISO8601().withMessage('تاريخ الميلاد غير صحيح'),
        body('phoneNumber').notEmpty().withMessage('رقم الهاتف مطلوب')
    ],

    registerDoctor: [
        body(['nationalId', 'fullName', 'licenseNumber', 'specialization', 'hospital']).notEmpty().withMessage('جميع الحقول المهنية مطلوبة'),
        body('email').isEmail().withMessage('البريد الإلكتروني غير صحيح'),
        body('password').isLength({ min: 6 }).withMessage('كلمة المرور ضعيفة'),
        body('confirmPassword').custom((value, { req }) => value === req.body.password).withMessage('كلمات المرور غير متطابقة')
    ],

    registerPharmacist: [
        body(['nationalId', 'fullName', 'licenseNumber', 'pharmacyName']).notEmpty().withMessage('بيانات الصيدلي والترخيص مطلوبة'),
        body('email').isEmail().withMessage('البريد الإلكتروني غير صحيح'),
        body('password').isLength({ min: 6 }),
        body('confirmPassword').custom((value, { req }) => value === req.body.password).withMessage('كلمات المرور غير متطابقة')
    ],

    login: [
        body('identifier').notEmpty().withMessage('يرجى إدخال رقم الهوية أو كود المريض'),
        body('password').notEmpty().withMessage('كلمة المرور مطلوبة'),
        body('devicePlatform').optional().isString()
    ],

    changePassword: [
        body('currentPassword').notEmpty().withMessage('كلمة المرور الحالية مطلوبة'),
        body('newPassword').isLength({ min: 6 }).withMessage('كلمة المرور الجديدة قصيرة جداً'),
        body('confirmNewPassword').custom((value, { req }) => value === req.body.newPassword).withMessage('تأكيد كلمة المرور الجديدة غير متطابق')
    ]
};
module.exports = { rules, validate ,authRules};
