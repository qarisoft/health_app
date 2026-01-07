// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';
// import '../../models/patient_profile.dart';
// import '../../services/api_service.dart';
// import '../../providers/patient_provider.dart';

// class InitializeProfilePage extends StatefulWidget {
//   const InitializeProfilePage({Key? key}) : super(key: key);

//   @override
//   _InitializeProfilePageState createState() => _InitializeProfilePageState();
// }

// class _InitializeProfilePageState extends State<InitializeProfilePage> {
//   final PageController _pageController = PageController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
//   int _currentStep = 0;
//   late PatientProfile _profile;
  
//   final List<String> _bloodTypes = [
//     'A+',
//     'A-',
//     'B+',
//     'B-',
//     'AB+',
//     'AB-',
//     'O+',
//     'O-',
//   ];
  
//   final List<String> _severityLevels = [
//     'خفيف',
//     'متوسط',
//     'شديد',
//   ];
  
//   @override
//   void initState() {
//     super.initState();
//     _profile = PatientProfile();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('إنشاء الملف الشخصي'),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: _goBack,
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Progress Indicator
//             _buildProgressIndicator(),
            
//             // Form Content
//             Expanded(
//               child: PageView(
//                 controller: _pageController,
//                 physics: const NeverScrollableScrollPhysics(),
//                 children: [
//                   _buildPersonalInfoStep(),
//                   _buildMedicalInfoStep(),
//                   _buildAllergiesStep(),
//                   _buildChronicDiseasesStep(),
//                   _buildSurgeriesStep(),
//                   _buildMedicationsStep(),
//                   _buildNotesStep(),
//                 ],
//               ),
//             ),
            
//             // Navigation Buttons
//             _buildNavigationButtons(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProgressIndicator() {
//     final steps = [
//       'المعلومات الشخصية',
//       'المعلومات الطبية',
//       'الحساسيات',
//       'الأمراض المزمنة',
//       'العمليات الجراحية',
//       'الأدوية الحالية',
//       'ملاحظات',
//     ];
    
//     return Container(
//       padding: const EdgeInsets.all(16),
//       color: Colors.blue[50],
//       child: Column(
//         children: [
//           // Step Indicator
//           Row(
//             children: List.generate(steps.length, (index) {
//               return Expanded(
//                 child: Container(
//                   height: 4,
//                   margin: const EdgeInsets.symmetric(horizontal: 2),
//                   decoration: BoxDecoration(
//                     color: index <= _currentStep 
//                         ? Colors.blue 
//                         : Colors.grey[300],
//                     borderRadius: BorderRadius.circular(2),
//                   ),
//                 ),
//               );
//             }),
//           ),
//           const SizedBox(height: 8),
          
//           // Step Label
//           Text(
//             'الخطوة ${_currentStep + 1} من ${steps.length}: ${steps[_currentStep]}',
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.blue,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPersonalInfoStep() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'المعلومات الشخصية',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 16),
            
//             // Full Name
//             _buildTextField(
//               label: 'الاسم الكامل',
//               initialValue: _profile.fullName,
//               onChanged: (value) => _profile = _profile.copyWith(fullName: value),
//               validator: (value) => value!.isEmpty ? 'الرجاء إدخال الاسم الكامل' : null,
//             ),
            
//             const SizedBox(height: 16),
            
//             // Date of Birth
//             _buildDateField(
//               label: 'تاريخ الميلاد',
//               initialValue: _profile.dateOfBirth,
//               onChanged: (value) => _profile = _profile.copyWith(dateOfBirth: value),
//             ),
            
//             const SizedBox(height: 16),
            
//             // Gender
//             _buildGenderField(),
            
//             const SizedBox(height: 16),
            
//             // Phone Number
//             _buildTextField(
//               label: 'رقم الهاتف',
//               initialValue: _profile.phoneNumber,
//               keyboardType: TextInputType.phone,
//               onChanged: (value) => _profile = _profile.copyWith(phoneNumber: value),
//               validator: (value) {
//                 if (value!.isEmpty) return 'الرجاء إدخال رقم الهاتف';
//                 if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
//                   return 'رقم الهاتف غير صالح';
//                 }
//                 return null;
//               },
//             ),
            
//             const SizedBox(height: 16),
            
//             // Email
//             _buildTextField(
//               label: 'البريد الإلكتروني',
//               initialValue: _profile.email,
//               keyboardType: TextInputType.emailAddress,
//               onChanged: (value) => _profile = _profile.copyWith(email: value),
//               validator: (value) {
//                 if (value!.isEmpty) return 'الرجاء إدخال البريد الإلكتروني';
//                 if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                   return 'البريد الإلكتروني غير صالح';
//                 }
//                 return null;
//               },
//             ),
            
//             const SizedBox(height: 16),
            
//             // Address
//             _buildTextField(
//               label: 'العنوان',
//               initialValue: _profile.address,
//               maxLines: 3,
//               onChanged: (value) => _profile = _profile.copyWith(address: value),
//               validator: (value) => value!.isEmpty ? 'الرجاء إدخال العنوان' : null,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMedicalInfoStep() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'المعلومات الطبية',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 16),
          
//           // Blood Type
//           _buildDropdownField(
//             label: 'فصيلة الدم',
//             value: _profile.bloodType,
//             items: _bloodTypes,
//             onChanged: (value) {
//               setState(() {
//                 _profile = _profile.copyWith(bloodType: value + 1);
//               });
//             },
//           ),
          
//           const SizedBox(height: 16),
          
//           Row(
//             children: [
//               // Weight
//               Expanded(
//                 child: _buildNumberField(
//                   label: 'الوزن (كجم)',
//                   value: _profile.weight,
//                   onChanged: (value) => _profile = _profile.copyWith(weight: value),
//                 ),
//               ),
//               const SizedBox(width: 16),
              
//               // Height
//               Expanded(
//                 child: _buildNumberField(
//                   label: 'الطول (سم)',
//                   value: _profile.height,
//                   onChanged: (value) => _profile = _profile.copyWith(height: value),
//                 ),
//               ),
//             ],
//           ),
          
//           const SizedBox(height: 16),
          
//           // Emergency Contact
//           _buildTextField(
//             label: 'جهة الاتصال في حالات الطوارئ',
//             initialValue: _profile.emergencyContact,
//             onChanged: (value) => _profile = _profile.copyWith(emergencyContact: value),
//           ),
          
//           const SizedBox(height: 16),
          
//           // Emergency Phone
//           _buildTextField(
//             label: 'رقم هاتف الطوارئ',
//             initialValue: _profile.emergencyPhone,
//             keyboardType: TextInputType.phone,
//             onChanged: (value) => _profile = _profile.copyWith(emergencyPhone: value),
//             validator: (value) {
//               if (value!.isNotEmpty && !RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
//                 return 'رقم الهاتف غير صالح';
//               }
//               return null;
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildAllergiesStep() {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'الحساسيات',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.add_circle, color: Colors.blue),
//                 onPressed: _addAllergy,
//               ),
//             ],
//           ),
//         ),
        
//         Expanded(
//           child: _profile.allergies.isEmpty
//               ? const Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(Icons.allergies_outlined, size: 64, color: Colors.grey),
//                       SizedBox(height: 16),
//                       Text(
//                         'لا توجد حساسيات مسجلة',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 )
//               : ListView.builder(
//                   padding: const EdgeInsets.all(16),
//                   itemCount: _profile.allergies.length,
//                   itemBuilder: (context, index) {
//                     return _buildAllergyCard(_profile.allergies[index], index);
//                   },
//                 ),
//         ),
//       ],
//     );
//   }

//   Widget _buildChronicDiseasesStep() {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'الأمراض المزمنة',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.add_circle, color: Colors.blue),
//                 onPressed: _addChronicDisease,
//               ),
//             ],
//           ),
//         ),
        
//         Expanded(
//           child: _profile.chronicDiseases.isEmpty
//               ? const Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(Icons.health_and_safety, size: 64, color: Colors.grey),
//                       SizedBox(height: 16),
//                       Text(
//                         'لا توجد أمراض مزمنة مسجلة',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 )
//               : ListView.builder(
//                   padding: const EdgeInsets.all(16),
//                   itemCount: _profile.chronicDiseases.length,
//                   itemBuilder: (context, index) {
//                     return _buildChronicDiseaseCard(_profile.chronicDiseases[index], index);
//                   },
//                 ),
//         ),
//       ],
//     );
//   }

//   Widget _buildSurgeriesStep() {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'العمليات الجراحية',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.add_circle, color: Colors.blue),
//                 onPressed: _addSurgery,
//               ),
//             ],
//           ),
//         ),
        
//         Expanded(
//           child: _profile.surgeries.isEmpty
//               ? const Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(Icons.medical_services, size: 64, color: Colors.grey),
//                       SizedBox(height: 16),
//                       Text(
//                         'لا توجد عمليات جراحية مسجلة',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 )
//               : ListView.builder(
//                   padding: const EdgeInsets.all(16),
//                   itemCount: _profile.surgeries.length,
//                   itemBuilder: (context, index) {
//                     return _buildSurgeryCard(_profile.surgeries[index], index);
//                   },
//                 ),
//         ),
//       ],
//     );
//   }

//   Widget _buildMedicationsStep() {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'الأدوية الحالية',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.add_circle, color: Colors.blue),
//                 onPressed: _addMedication,
//               ),
//             ],
//           ),
//         ),
        
//         Expanded(
//           child: _profile.currentMedications.isEmpty
//               ? const Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(Icons.medication, size: 64, color: Colors.grey),
//                       SizedBox(height: 16),
//                       Text(
//                         'لا توجد أدوية مسجلة',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 )
//               : ListView.builder(
//                   padding: const EdgeInsets.all(16),
//                   itemCount: _profile.currentMedications.length,
//                   itemBuilder: (context, index) {
//                     return _buildMedicationCard(_profile.currentMedications[index], index);
//                   },
//                 ),
//         ),
//       ],
//     );
//   }

//   Widget _buildNotesStep() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'ملاحظات إضافية',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'يمكنك إضافة أي معلومات إضافية تريد مشاركتها مع فريقك الطبي',
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[600],
//             ),
//           ),
//           const SizedBox(height: 16),
          
//           TextFormField(
//             initialValue: _profile.notes,
//             maxLines: 10,
//             decoration: InputDecoration(
//               hintText: 'أدخل أي ملاحظات إضافية هنا...',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               filled: true,
//               fillColor: Colors.grey[50],
//             ),
//             onChanged: (value) => _profile = _profile.copyWith(notes: value),
//           ),
          
//           const SizedBox(height: 24),
          
//           // Summary
//           Card(
//             elevation: 2,
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'ملخص المعلومات',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   _buildSummaryItem('الاسم', _profile.fullName),
//                   _buildSummaryItem('العمر', _calculateAge()),
//                   _buildSummaryItem('فصيلة الدم', _bloodTypes[_profile.bloodType - 1]),
//                   _buildSummaryItem('عدد الحساسيات', _profile.allergies.length.toString()),
//                   _buildSummaryItem('عدد الأمراض المزمنة', _profile.chronicDiseases.length.toString()),
//                   _buildSummaryItem('عدد العمليات الجراحية', _profile.surgeries.length.toString()),
//                   _buildSummaryItem('عدد الأدوية الحالية', _profile.currentMedications.length.toString()),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNavigationButtons() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border(top: BorderSide(color: Colors.grey[300]!)),
//       ),
//       child: Row(
//         children: [
//           if (_currentStep > 0)
//             Expanded(
//               child: OutlinedButton(
//                 onPressed: _previousStep,
//                 style: OutlinedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                 ),
//                 child: const Text('السابق'),
//               ),
//             ),
//           if (_currentStep > 0) const SizedBox(width: 8),
//           Expanded(
//             child: ElevatedButton(
//               onPressed: _nextStep,
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 backgroundColor: _currentStep == 6 ? Colors.green : Colors.blue,
//               ),
//               child: Text(
//                 _currentStep == 6 ? 'إنهاء وإنشاء الملف' : 'التالي',
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper Widgets
//   Widget _buildTextField({
//     required String label,
//     required String initialValue,
//     required Function(String) onChanged,
//     String? Function(String?)? validator,
//     TextInputType keyboardType = TextInputType.text,
//     int maxLines = 1,
//   }) {
//     return TextFormField(
//       initialValue: initialValue,
//       decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         filled: true,
//         fillColor: Colors.grey[50],
//       ),
//       keyboardType: keyboardType,
//       maxLines: maxLines,
//       onChanged: onChanged,
//       validator: validator,
//     );
//   }

//   Widget _buildDateField({
//     required String label,
//     required String initialValue,
//     required Function(String) onChanged,
//   }) {
//     return InkWell(
//       onTap: () => _selectDate(context, onChanged),
//       child: InputDecorator(
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           filled: true,
//           fillColor: Colors.grey[50],
//           suffixIcon: const Icon(Icons.calendar_today),
//         ),
//         child: Text(
//           initialValue.isNotEmpty 
//               ? DateFormat('yyyy-MM-dd').format(DateTime.parse(initialValue))
//               : 'اختر تاريخ الميلاد',
//         ),
//       ),
//     );
//   }

//   Widget _buildGenderField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'الجنس',
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 8),
//         Row(
//           children: [
//             Expanded(
//               child: _buildGenderOption('ذكر', 1, Icons.male),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: _buildGenderOption('أنثى', 2, Icons.female),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildGenderOption(String label, int value, IconData icon) {
//     return InkWell(
//       onTap: () {
//         setState(() {
//           _profile = _profile.copyWith(gender: value);
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: _profile.gender == value ? Colors.blue[50] : Colors.grey[50],
//           border: Border.all(
//             color: _profile.gender == value ? Colors.blue : Colors.grey[300],
//             width: 2,
//           ),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: _profile.gender == value ? Colors.blue : Colors.grey),
//             const SizedBox(width: 8),
//             Text(
//               label,
//               style: TextStyle(
//                 color: _profile.gender == value ? Colors.blue : Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDropdownField({
//     required String label,
//     required int value,
//     required List<String> items,
//     required Function(int) onChanged,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 8),
//         DropdownButtonFormField<String>(
//           value: items[value - 1],
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//             filled: true,
//             fillColor: Colors.grey[50],
//           ),
//           items: items.map((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//           onChanged: (newValue) {
//             onChanged(items.indexOf(newValue!));
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildNumberField({
//     required String label,
//     required double value,
//     required Function(double) onChanged,
//   }) {
//     return TextFormField(
//       initialValue: value > 0 ? value.toString() : '',
//       decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         filled: true,
//         fillColor: Colors.grey[50],
//         suffixText: label.contains('الوزن') ? 'كجم' : 'سم',
//       ),
//       keyboardType: TextInputType.number,
//       onChanged: (text) {
//         final val = double.tryParse(text) ?? 0;
//         onChanged(val);
//       },
//     );
//   }

//   Widget _buildAllergyCard(Allergy allergy, int index) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         leading: const Icon(Icons.allergies, color: Colors.red),
//         title: Text(allergy.allergenName.isNotEmpty ? allergy.allergenName : 'حساسية'),
//         subtitle: Text(allergy.reaction.isNotEmpty ? allergy.reaction : 'لا توجد تفاصيل'),
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Chip(
//               label: Text(allergy.severity.isNotEmpty ? allergy.severity : 'غير محدد'),
//               backgroundColor: _getSeverityColor(allergy.severity),
//             ),
//             IconButton(
//               icon: const Icon(Icons.delete, color: Colors.red),
//               onPressed: () => _removeAllergy(index),
//             ),
//           ],
//         ),
//         onTap: () => _editAllergy(index),
//       ),
//     );
//   }

//   Widget _buildChronicDiseaseCard(ChronicDisease disease, int index) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         leading: const Icon(Icons.health_and_safety, color: Colors.orange),
//         title: Text(disease.diseaseName.isNotEmpty ? disease.diseaseName : 'مرض'),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (disease.description.isNotEmpty)
//               Text(disease.description),
//             if (disease.diagnosisDate.isNotEmpty)
//               Text(
//                 'التشخيص: ${DateFormat('yyyy-MM-dd').format(DateTime.parse(disease.diagnosisDate))}',
//                 style: const TextStyle(fontSize: 12, color: Colors.grey),
//               ),
//           ],
//         ),
//         trailing: IconButton(
//           icon: const Icon(Icons.delete, color: Colors.red),
//           onPressed: () => _removeChronicDisease(index),
//         ),
//         onTap: () => _editChronicDisease(index),
//       ),
//     );
//   }

//   Widget _buildSurgeryCard(Surgery surgery, int index) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         leading: const Icon(Icons.medical_services, color: Colors.purple),
//         title: Text(surgery.surgeryName.isNotEmpty ? surgery.surgeryName : 'عملية جراحية'),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (surgery.hospital.isNotEmpty)
//               Text('المستشفى: ${surgery.hospital}'),
//             if (surgery.surgeryDate.isNotEmpty)
//               Text(
//                 'التاريخ: ${DateFormat('yyyy-MM-dd').format(DateTime.parse(surgery.surgeryDate))}',
//                 style: const TextStyle(fontSize: 12, color: Colors.grey),
//               ),
//           ],
//         ),
//         trailing: IconButton(
//           icon: const Icon(Icons.delete, color: Colors.red),
//           onPressed: () => _removeSurgery(index),
//         ),
//         onTap: () => _editSurgery(index),
//       ),
//     );
//   }

//   Widget _buildMedicationCard(CurrentMedication medication, int index) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         leading: const Icon(Icons.medication, color: Colors.green),
//         title: Text(medication.medicationName.isNotEmpty ? medication.medicationName : 'دواء'),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (medication.dosage.isNotEmpty)
//               Text('الجرعة: ${medication.dosage}'),
//             if (medication.frequency.isNotEmpty)
//               Text('التكرار: ${medication.frequency}'),
//           ],
//         ),
//         trailing: IconButton(
//           icon: const Icon(Icons.delete, color: Colors.red),
//           onPressed: () => _removeMedication(index),
//         ),
//         onTap: () => _editMedication(index),
//       ),
//     );
//   }

//   Widget _buildSummaryItem(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
//           Expanded(
//             child: Text(
//               value.isNotEmpty ? value : 'غير محدد',
//               textAlign: TextAlign.end,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper Methods
//   Future<void> _selectDate(BuildContext context, Function(String) onChanged) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null) {
//       onChanged(picked.toIso8601String());
//       setState(() {});
//     }
//   }

//   Color _getSeverityColor(String severity) {
//     switch (severity) {
//       case 'خفيف':
//         return Colors.green[100]!;
//       case 'متوسط':
//         return Colors.orange[100]!;
//       case 'شديد':
//         return Colors.red[100]!;
//       default:
//         return Colors.grey[100]!;
//     }
//   }

//   String _calculateAge() {
//     if (_profile.dateOfBirth.isEmpty) return 'غير محدد';
//     try {
//       final birthDate = DateTime.parse(_profile.dateOfBirth);
//       final now = DateTime.now();
//       int age = now.year - birthDate.year;
//       if (now.month < birthDate.month || 
//           (now.month == birthDate.month && now.day < birthDate.day)) {
//         age--;
//       }
//       return '$age سنة';
//     } catch (e) {
//       return 'غير محدد';
//     }
//   }

//   void _nextStep() {
//     if (_currentStep < 6) {
//       if (_currentStep == 0) {
//         if (_formKey.currentState?.validate() ?? false) {
//           _pageController.nextPage(
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.ease,
//           );
//           setState(() => _currentStep++);
//         }
//       } else {
//         _pageController.nextPage(
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.ease,
//         );
//         setState(() => _currentStep++);
//       }
//     } else {
//       _submitProfile();
//     }
//   }

//   void _previousStep() {
//     if (_currentStep > 0) {
//       _pageController.previousPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.ease,
//       );
//       setState(() => _currentStep--);
//     }
//   }

//   void _goBack() {
//     if (_currentStep > 0) {
//       _previousStep();
//     } else {
//       Navigator.pop(context);
//     }
//   }

//   void _addAllergy() {
//     showDialog(
//       context: context,
//       builder: (context) => AllergyDialog(
//         onSave: (allergy) {
//           setState(() {
//             _profile = _profile.copyWith(
//               allergies: [..._profile.allergies, allergy],
//             );
//           });
//         },
//       ),
//     );
//   }

//   void _editAllergy(int index) {
//     showDialog(
//       context: context,
//       builder: (context) => AllergyDialog(
//         allergy: _profile.allergies[index],
//         onSave: (updatedAllergy) {
//           setState(() {
//             final newAllergies = List<Allergy>.from(_profile.allergies);
//             newAllergies[index] = updatedAllergy;
//             _profile = _profile.copyWith(allergies: newAllergies);
//           });
//         },
//       ),
//     );
//   }

//   void _removeAllergy(int index) {
//     setState(() {
//       final newAllergies = List<Allergy>.from(_profile.allergies);
//       newAllergies.removeAt(index);
//       _profile = _profile.copyWith(allergies: newAllergies);
//     });
//   }

//   void _addChronicDisease() {
//     showDialog(
//       context: context,
//       builder: (context) => ChronicDiseaseDialog(
//         onSave: (disease) {
//           setState(() {
//             _profile = _profile.copyWith(
//               chronicDiseases: [..._profile.chronicDiseases, disease],
//             );
//           });
//         },
//       ),
//     );
//   }

//   void _editChronicDisease(int index) {
//     showDialog(
//       context: context,
//       builder: (context) => ChronicDiseaseDialog(
//         disease: _profile.chronicDiseases[index],
//         onSave: (updatedDisease) {
//           setState(() {
//             final newDiseases = List<ChronicDisease>.from(_profile.chronicDiseases);
//             newDiseases[index] = updatedDisease;
//             _profile = _profile.copyWith(chronicDiseases: newDiseases);
//           });
//         },
//       ),
//     );
//   }

//   void _removeChronicDisease(int index) {
//     setState(() {
//       final newDiseases = List<ChronicDisease>.from(_profile.chronicDiseases);
//       newDiseases.removeAt(index);
//       _profile = _profile.copyWith(chronicDiseases: newDiseases);
//     });
//   }

//   void _addSurgery() {
//     showDialog(
//       context: context,
//       builder: (context) => SurgeryDialog(
//         onSave: (surgery) {
//           setState(() {
//             _profile = _profile.copyWith(
//               surgeries: [..._profile.surgeries, surgery],
//             );
//           });
//         },
//       ),
//     );
//   }

//   void _editSurgery(int index) {
//     showDialog(
//       context: context,
//       builder: (context) => SurgeryDialog(
//         surgery: _profile.surgeries[index],
//         onSave: (updatedSurgery) {
//           setState(() {
//             final newSurgeries = List<Surgery>.from(_profile.surgeries);
//             newSurgeries[index] = updatedSurgery;
//             _profile = _profile.copyWith(surgeries: newSurgeries);
//           });
//         },
//       ),
//     );
//   }

//   void _removeSurgery(int index) {
//     setState(() {
//       final newSurgeries = List<Surgery>.from(_profile.surgeries);
//       newSurgeries.removeAt(index);
//       _profile = _profile.copyWith(surgeries: newSurgeries);
//     });
//   }

//   void _addMedication() {
//     showDialog(
//       context: context,
//       builder: (context) => MedicationDialog(
//         onSave: (medication) {
//           setState(() {
//             _profile = _profile.copyWith(
//               currentMedications: [..._profile.currentMedications, medication],
//             );
//           });
//         },
//       ),
//     );
//   }

//   void _editMedication(int index) {
//     showDialog(
//       context: context,
//       builder: (context) => MedicationDialog(
//         medication: _profile.currentMedications[index],
//         onSave: (updatedMedication) {
//           setState(() {
//             final newMedications = List<CurrentMedication>.from(_profile.currentMedications);
//             newMedications[index] = updatedMedication;
//             _profile = _profile.copyWith(currentMedications: newMedications);
//           });
//         },
//       ),
//     );
//   }

//   void _removeMedication(int index) {
//     setState(() {
//       final newMedications = List<CurrentMedication>.from(_profile.currentMedications);
//       newMedications.removeAt(index);
//       _profile = _profile.copyWith(currentMedications: newMedications);
//     });
//   }

//   Future<void> _submitProfile() async {
//     // Show loading dialog
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => const Center(
//         child: CircularProgressIndicator(),
//       ),
//     );

//     try {
//       // Call API to submit profile
//       final response = await ApiService().initializePatientProfile(_profile);
      
//       // Hide loading dialog
//       if (context.mounted) {
//         Navigator.of(context, rootNavigator: true).pop();
//       }

//       if (response['success'] == true) {
//         // Update provider if using Provider
//         if (context.mounted) {
//           final patientProvider = context.read<PatientProvider>();
//           patientProvider.updateProfile(_profile);
          
//           // Navigate to main screen
//           Navigator.pushNamedAndRemoveUntil(
//             context,
//             '/home',
//             (route) => false,
//           );
//         }
//       } else {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(response['message'] ?? 'فشل في إنشاء الملف الشخصي'),
//               backgroundColor: Colors.red,
//             ),
//           );
//         }
//       }
//     } catch (e) {
//       // Hide loading dialog
//       if (context.mounted) {
//         Navigator.of(context, rootNavigator: true).pop();
//       }
      
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('حدث خطأ: $e'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }
// }