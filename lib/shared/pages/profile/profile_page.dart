import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/core/router/app_routes.dart';
import 'package:health_app/di.dart';
import 'package:health_app/shared/ex.dart' show AppEx, LogOutExt;
import 'package:health_app/shared/pages/profile/change_password.dart';
import 'package:health_app/shared/providers/local/local_provider.dart';
import 'package:health_app/shared/providers/theme/theme_provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../widgets/app_bar_leading.dart';
import 'data/entity.dart' show ProfileAccount;

export 'data/entity.dart' show ProfileAccount;

class ProfilePageBuilder extends ConsumerStatefulWidget {
  const ProfilePageBuilder({
    super.key,
    required this.account,
    required this.onEditProfile,
    this.onLoginAsPatient,
  });

  final Function() onEditProfile;
  final VoidCallback? onLoginAsPatient;

  final ProfileAccount account;

  @override
  ConsumerState<ProfilePageBuilder> createState() => _ProfilePageBuilderState();
}

class _ProfilePageBuilderState extends ConsumerState<ProfilePageBuilder> {
  // bool _isDarkMode = false;
  bool _notificationsEnabled = true;
  String _language = 'English';

  late ProfileAccount patient;

  Function() get onEditProfile => widget.onEditProfile;

  // --- Image Picker State ---

  @override
  void initState() {
    patient = widget.account;
    super.initState();
    // _loadSavedImage(); // Load the local image when the page opens
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(isDarkThemeProvider);
    final bgColor = isDark ? const Color(0xFF121212) : const Color(0xFFF8FAFD);
    final surfaceColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black87;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: surfaceColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          context.tr.profile,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isDark ? Iconsax.sun_1 : Iconsax.moon, color: textColor),
            onPressed: () {
              ref.read(isDarkThemeProvider.notifier).toggle();
              // setState(() {
              //   _isDarkMode = !_isDarkMode;
              // });
            },
          ),
        ],

        leading: AppBarReturnButton(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Profile Header Section
            _buildProfileHeader(surfaceColor, textColor),
            if (widget.onLoginAsPatient != null) ...[
              const SizedBox(height: 16),
              _buildSettingsGroup(
                title: context.tr.loginAsPatient,
                surfaceColor: surfaceColor,
                textColor: textColor,
                children: [
                  _buildListTile(
                    icon: Iconsax.personalcard,
                    title: context.tr.loginAsPatient,
                    textColor: textColor,
                    onTap: () => widget.onLoginAsPatient?.call(),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 16),

            // Settings Groups
            _buildSettingsGroup(
              title: context.tr.settings ?? 'Preferences',
              surfaceColor: surfaceColor,
              textColor: textColor,
              children: [
                _buildListTile(
                  icon: Iconsax.personalcard,
                  title: context.tr.editProfile,
                  textColor: textColor,
                  onTap: onEditProfile,
                ),
                _buildDivider(),
                _buildSwitchTile(
                  icon: Iconsax.notification,
                  title: context.tr.notifications,
                  subtitle: context.tr.notificationsDescription,
                  value: _notificationsEnabled,
                  textColor: textColor,
                  onChanged: (val) =>
                      setState(() => _notificationsEnabled = val),
                ),
                _buildDivider(),
                _buildListTile(
                  icon: Iconsax.language_square,
                  title: context.tr.language,
                  subtitle: _language,
                  textColor: textColor,
                  onTap: _changeLanguage,
                ),
              ],
            ),

            const SizedBox(height: 16),

            _buildSettingsGroup(
              title: context.tr.aboutApp ?? 'More',
              surfaceColor: surfaceColor,
              textColor: textColor,
              children: [
                _buildListTile(
                  icon: Iconsax.info_circle,
                  title: context.tr.aboutApp,
                  textColor: textColor,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('About Us'),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  """نظام السجلات الطبية الموحد (Patient Medical Records System)
هو منصة رقمية متكاملة تهدف إلى رقمنة وتطوير منظومة الرعاية الصحية من خلال ربط المريض، الطبيب، والصيدلي في بيئة برمجية آمنة وذكية.

رؤيتنا:
تحسين جودة الرعاية الصحية وتقليل الأخطاء الطبية من خلال توفير وصول فوري ودقيق للمعلومات الحيوية للمريض في أي وقت ومن أي مكان،
مع ضمان أعلى مستويات الخصوصية والأمان.

أبرز وظائف النظام:
الملف الطبي الرقمي الموحد: سجل إلكتروني شامل لكل مريض يضم التاريخ المرضي، التشخيصات، والوصفات الطبية السابقة والحالية.
نظام الطوارئ الذكي (Offline QR Code): يوفر التطبيق ميزة فريدة وهي بطاقة تعريفية رقمية (QR Code) مشفرة تحتوي على بيانات المريض
الحيوية (فصيلة الدم، الحساسية، الأدوية المزمنة، وجهات اتصال الطوارئ) وتعمل "بدون اتصال بالإنترنت"، مما يتيح للمنقذين التدخل السريع في اللحظات الحرجة.
الوصفة الطبية الإلكترونية: يمنح الأطباء القدرة على كتابة وصفات دقيقة مرتبطة بقاعدة بيانات دوائية موحدة، مما يمنع صرف الأدوية بشكل عشوائي.
نظام فحص التفاعلات الدوائية آلياً: يوفر للصيادلة أداة ذكية تقوم بفحص مكونات الأدوية في الوصفة الجديدة ومقارنتها مع ما يتناوله المريض حالياً،
لتجنب التفاعلات الدوائية الخطيرة وضمان سلامة المريض.
إدارة الصرف الجزئي والذكي: يتيح للصيدلي صرف الأدوية بشكل دقيق وتدريجي مع مراقبة الحالة لحظياً لكل صنف دوائي.

أدوار المستخدمين:
المريض: يمتلك السيادة الكاملة على بياناته الصحية، ويتابع حالته وتاريخه العلاجي من خلال لوحة تحكم بسيطة وفعالة.
الطبيب: يستفيد من أدوات تشخيصية ودعم للقرار الطبي بناءً على التاريخ الصحي الموثق للمريض.
الصيدلي: يضمن صرف الأدوية بأمان تام من خلال أدوات التحقق التلقائي من التعارضات والجرعات.
نحن نؤمن أن توفير المعلومة الدقيقة في الوقت المناسب هو مفتاح إنقاذ الأرواح.

""",
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                context.mayPop();
                              },
                              child: Text(
                                context.tr.cancel,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 24),
            _buildSettingsGroup(
              title: context.tr.changePassword ?? 'More',
              surfaceColor: surfaceColor,
              textColor: textColor,
              children: [
                _buildListTile(
                  icon: Iconsax.lock,
                  title: context.tr.changePassword,
                  textColor: Colors.red,
                  iconColor: Colors.red,

                  onTap: () {
                    context.to(ChangePasswordDialog());
                    // showDialog(
                    //   context: context,
                    //   builder: (c) => ChangePasswordDialog(),
                    // );
                  },
                ),
                _buildDivider(),
              ],
            ),

            const SizedBox(height: 24),

            // Logout Button
            _buildLogoutButton(),

            const SizedBox(height: 40), // Bottom padding
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(Color surfaceColor, Color textColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 30, top: 20),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          ProfileAvatar(userId: patient.userId, surfaceColor: surfaceColor),

          const SizedBox(height: 16),
          Text(
            patient.fullName,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            patient.email,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Iconsax.location, size: 14, color: Colors.blue),
                const SizedBox(width: 6),
                Text(
                  patient.address,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsGroup({
    required String title,
    required Color surfaceColor,
    required Color textColor,
    required List<Widget> children,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 8),
            child: Text(
              title.toUpperCase(),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                letterSpacing: 1.2,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: surfaceColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required Color textColor,
    Color? iconColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor ?? Colors.blue, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500, color: textColor),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            )
          : null,
      trailing: Icon(
        Icons.chevron_right,
        color: iconColor ?? Colors.grey,
        size: 20,
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required Color textColor,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      secondary: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.blue, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500, color: textColor),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey.withOpacity(0.1),
      indent: 60,
      endIndent: 20,
    );
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: _showLogoutDialog,
          style:
              ElevatedButton.styleFrom(
                backgroundColor: Colors.red.withOpacity(0.1),
                foregroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 16),
                // This ensures elevation is 0 for ALL states (hover, click, focus, etc.)
                elevation: 0,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ).copyWith(
                // Using copyWith to explicitly zero out state-dependent elevation
                elevation: WidgetStateProperty.all(0),
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Iconsax.logout, size: 20),
              const SizedBox(width: 8),
              Text(
                context.tr.logout,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Dialogs and Navigations remain mostly the same ---

  void _changeLanguage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(context.tr.selectLanguage),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildLanguageOption(
                  'English',
                  onTap: () =>
                      ref.read(localProvider.notifier).setLocalEnglish(),
                ),
                _buildLanguageOption(
                  'Arabic',
                  onTap: () =>
                      ref.read(localProvider.notifier).setLocalArabic(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(String language, {Function()? onTap}) {
    final isSelected = _language.toLowerCase() == language.toLowerCase();
    return ListTile(
      title: Text(
        language,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? Colors.blue : null,
        ),
      ),
      trailing: isSelected
          ? const Icon(Icons.check_circle, color: Colors.blue)
          : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onTap: () {
        onTap?.call();
        setState(() {
          _language = language;
        });
        Navigator.pop(context);
      },
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: Theme.of(context).canvasColor,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 1. Visual Element (Lottie or Icon)
                // If using Lottie: Lottie.asset('assets/lottie/logout.json', height: 120)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Iconsax.logout_1, // Using Iconsax for that modern look
                    color: Colors.red,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 20),

                // 2. Title & Content
                Text(
                  context.tr.logout,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  context.tr.logoutConfirmation,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // 3. Actions (Stacked)
                Consumer(
                  builder: (context, ref, _) {
                    void out() {
                      ref.invalidateAllAuthProviders();
                      ref.invalidate(accountProvider);

                      // ref.invalidate(patientSelectedPageIndexProvider);
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(AppRoutes.splash);
                      // Navigator.of(context).pop(); // Close dialog
                    }

                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () async {
                          await appStorage.clearAllAccounts();
                          out();
                          // await ref
                          //     .read(authRecordStateProvider.notifier)
                          //     .logOut();
                          // out();
                        },
                        child: Text(
                          context.tr.logout,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey[500],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      context.tr.cancel,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLogoutDialog0() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(context.tr.logout),
          content: Text(context.tr.logoutConfirmation),
          actionsOverflowButtonSpacing: 5,
          actions: [
            Consumer(
              builder: (context, ref, _) {
                out() {
                  ref.invalidateAllAuthProviders();
                  context.pop();
                  context.mayPop();
                }

                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    ref
                        .read(authRecordStateProvider.notifier)
                        .logOut()
                        .whenComplete(out);
                  },
                  child: Text(context.tr.logout),
                );
              },
            ),

            // --- Secondary Cancel Button ---
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey[600], // Subtle secondary color
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  context.tr.cancel,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ProfileAvatar extends ConsumerStatefulWidget {
  const ProfileAvatar({super.key, required this.userId, this.surfaceColor});

  final int userId;
  final Color? surfaceColor;

  @override
  ConsumerState createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends ConsumerState<ProfileAvatar> {
  File? _selectedImage;

  int get userId => widget.userId;

  @override
  void initState() {
    super.initState();
    _loadSavedImage(); // Load the local image when the page opens
  }

  Future<void> _loadSavedImage() async {
    final prefs = appStorage.sharedPreferences;
    final savedImagePath = prefs.getString('profile_image_path_${userId}');

    if (savedImagePath != null) {
      final file = File(savedImagePath);
      if (await file.exists()) {
        setState(() {
          _selectedImage = file;
        });
      }
    }
  }

  final ImagePicker _imagePicker = ImagePicker();

  void _changeProfilePicture() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                ListTile(
                  leading: const Icon(Iconsax.camera),
                  title: Text(context.tr.takePhoto ?? 'Take Photo'),
                  onTap: () {
                    // Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Iconsax.gallery),
                  title: Text(
                    context.tr.chooseFromGallery ?? 'Choose from Gallery',
                  ),
                  onTap: () {
                    // Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
                ListTile(
                  leading: const Icon(Iconsax.trash, color: Colors.red),
                  title: Text(
                    context.tr.removePhoto ?? 'Remove Photo',
                    style: const TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    // Close the bottom sheet first
    Navigator.pop(context);

    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: source,
        imageQuality: 80,
        maxWidth: 800,
      );

      if (pickedFile != null) {
        // 1. Get the app's local document directory
        final directory = await getApplicationDocumentsDirectory();

        // 2. Create a unique file name (using patient ID prevents overwriting other users' avatars)
        final String fileName = 'avatar_${userId}.jpg';
        final String localPath = '${directory.path}/$fileName';

        // 3. Copy the picked file to the local path
        final File localImage = await File(pickedFile.path).copy(localPath);

        // 4. Save the path to SharedPreferences
        final prefs = appStorage.sharedPreferences;
        await prefs.setString('profile_image_path_${userId}', localPath);

        // 5. Update the UI
        setState(() {
          _selectedImage = localImage;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving image: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _removePhoto() async {
    Navigator.pop(context);

    try {
      if (_selectedImage != null && await _selectedImage!.exists()) {
        await _selectedImage!
            .delete(); // Delete the actual file from local storage
      }

      final prefs = appStorage.sharedPreferences;
      await prefs.remove(
        'profile_image_path_${userId}',
      ); // Remove the saved path

      setState(() {
        _selectedImage = null;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error removing image: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Color get surfaceColor => widget.surfaceColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blue.withOpacity(0.2), width: 4),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: _selectedImage != null
                ? Image.file(_selectedImage!)
                : Container(
                    color: Colors.blue[50],
                    child: Icon(
                      Iconsax.user,
                      size: 50,
                      color: Colors.blue[300],
                    ),
                  ),
          ),
        ),
        GestureDetector(
          onTap: _changeProfilePicture,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              border: Border.all(color: surfaceColor, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(Iconsax.camera, size: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
