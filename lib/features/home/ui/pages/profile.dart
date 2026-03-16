// profile_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/accounts_provider.dart';
import 'package:health_app/auth_state.dart';
import 'package:health_app/shared/ex.dart' show AppEx;
import 'package:health_app/di.dart';
import 'package:health_app/features/auth/domain/models/account.dart';
import 'package:health_app/features/home/ui/pages/edit_profile.dart';
import 'package:health_app/shared/ex.dart' hide xlog;
import 'package:health_app/shared/providers/local/local_provider.dart';
import 'package:health_app/shared/widgets/patient/app_bar/return_button.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/_all.dart' hide xlog;
import '../../../../shared/ex.dart';
import '../../../auth/domain/models/patient.dart';
import 'p.dart' show InitializedProfilePage2;
// import 'package:iconsax/iconsax.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(allAcountsProvider.select((s) => s.patient));
    xlog(auth);
    if (auth == null) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: CircularProgressIndicator())],
        ),
      );
    }
    return ProfilePageBuilder(account: auth);
  }
}

class ProfilePageBuilder extends ConsumerStatefulWidget {
  const ProfilePageBuilder({super.key, required this.account});

  final PatientAccount account;

  @override
  ConsumerState<ProfilePageBuilder> createState() => _ProfilePageBuilderState();
}

class _ProfilePageBuilderState extends ConsumerState<ProfilePageBuilder> {
  bool _isDarkMode = false;
  bool _notificationsEnabled = true;
  String _language = 'English';

  late Patient patient;

  @override
  void initState() {
    patient = widget.account.patient;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.grey[50],
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode;
              });
            },
          ),
        ],
        leading: ReturnButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            // Profile Header Section
            _buildProfileHeader(),


            _buildSettingsSection(),

            // Logout Button
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _isDarkMode ? Colors.grey[800] : Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blueAccent, width: 3),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1494790108755-2616b612b786?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.blue,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: _changeProfilePicture,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            patient.fullName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            patient.email,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 5),
              Text(
                patient.address,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildSettingsSection() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _isDarkMode ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Settings',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: _isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 15),
          ListTile(
            leading: const Icon(Iconsax.personalcard),
            title: const Text('Edit Profile'),
            subtitle: Text(_language),
            trailing: const Icon(Icons.chevron_right),
            onTap: _navigateToEditProfile,
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Switch between dark and light theme'),
            value: _isDarkMode,
            onChanged: (value) {
              setState(() {
                _isDarkMode = value;
              });
            },
            secondary: const Icon(Iconsax.moon),
          ),
          SwitchListTile(
            title: const Text('Notifications'),
            subtitle: const Text('Enable or disable notifications'),
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
            secondary: const Icon(Iconsax.notification),
          ),
          ListTile(
            leading: const Icon(Iconsax.language_circle),
            title: const Text('Language'),
            subtitle: Text(_language),
            trailing: const Icon(Icons.chevron_right),
            onTap: _changeLanguage,
          ),
          ListTile(
            leading: const Icon(Iconsax.security),
            title: const Text('Privacy & Security'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Iconsax.info_circle),
            title: const Text('About App'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _showLogoutDialog,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Iconsax.logout),
            SizedBox(width: 10),
            Text('Log Out', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  void _changeProfilePicture() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take Photo'),
                onTap: () {
                  Navigator.pop(context);
                  // Implement camera functionality
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  // Implement gallery picker
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Remove Photo'),
                onTap: () {
                  Navigator.pop(context);
                  // Remove profile photo
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToEditProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InitializedProfilePage2(onBackPressed: (){
          context.pop();
        },)
      ),
    );
  }

  void _changeLanguage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildLanguageOption('English',onTap: ()=>
                  ref.read(localProvider.notifier).setLocalEnglish()
                ),
                _buildLanguageOption('arabic',
                    onTap: ()=>
                  ref.read(localProvider.notifier).setLocalArabic()
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(String language,{Function()?onTap}) {
    return ListTile(
      title: Text(language),
      trailing: _language == language
          ? const Icon(Icons.check, color: Colors.blue)
          : null,
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
        return AlertDialog(
          title: const Text('Log Out'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            Consumer(
              builder: (context, ref, _) {
                out() {
                  // ref.invalidate(accountProvider);

                  context.pop();
                  context.mayPop();
                }

                return TextButton(
                  onPressed: () async{
                    // await appStorage.clearAllAccounts();
                    // ref.invalidate(accountProvider);
                    // ref.invalidate(allAcountsProvider);

                    ref
                        .read(authRecordStateProvider.notifier)
                        .logOut()
                        .whenComplete(out);

                    // Implement logout logic
                  },
                  child: const Text(
                    'Log Out',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }



  //

  // Widget _buildStatsSection() {
  //   return Container(
  //     margin: const EdgeInsets.all(20),
  //     padding: const EdgeInsets.all(20),
  //     decoration: BoxDecoration(
  //       color: _isDarkMode ? Colors.grey[800] : Colors.white,
  //       borderRadius: BorderRadius.circular(20),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.05),
  //           blurRadius: 10,
  //           offset: const Offset(0, 5),
  //         ),
  //       ],
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         _buildStatItem('142', 'Posts'),
  //         _buildStatItem('3.2K', 'Followers'),
  //         _buildStatItem('284', 'Following'),
  //         _buildStatItem('24', 'Projects'),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildStatItem(String value, String label) {
  //   return Column(
  //     children: [
  //       Text(
  //         value,
  //         style: const TextStyle(
  //           fontSize: 20,
  //           fontWeight: FontWeight.bold,
  //           color: Colors.blue,
  //         ),
  //       ),
  //       const SizedBox(height: 5),
  //       Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
  //     ],
  //   );
  // }
  //
  // Widget _buildMenuSection() {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 20),
  //     decoration: BoxDecoration(
  //       color: _isDarkMode ? Colors.grey[800] : Colors.white,
  //       borderRadius: BorderRadius.circular(20),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.05),
  //           blurRadius: 10,
  //           offset: const Offset(0, 5),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       children: [
  //         _buildMenuItem(
  //           icon: Iconsax.user,
  //           title: 'Edit Profile',
  //           onTap: () => _navigateToEditProfile(),
  //         ),
  //         // _buildMenuItem(icon: Iconsax.heart, title: 'Favorites', badge: '12'),
  //         // _buildMenuItem(icon: Iconsax.shop, title: 'My Orders', badge: '5'),
  //         // _buildMenuItem(icon: Iconsax.wallet, title: 'Payment Methods'),
  //         // _buildMenuItem(icon: Iconsax.location, title: 'Addresses'),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildMenuItem({
  //   required IconData icon,
  //   required String title,
  //   String? badge,
  //   VoidCallback? onTap,
  // }) {
  //   return ListTile(
  //     leading: Container(
  //       padding: const EdgeInsets.all(5),
  //       decoration: BoxDecoration(
  //         color: Colors.blue.withOpacity(0.1),
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: Icon(icon, color: Colors.blue),
  //     ),
  //     title: Text(title),
  //     trailing: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           if (badge != null)
  //             Container(
  //               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
  //               decoration: BoxDecoration(
  //                 color: Colors.red,
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //               child: Text(
  //                 badge,
  //                 style: const TextStyle(color: Colors.white, fontSize: 12),
  //               ),
  //             ),
  //           const SizedBox(width: 10),
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: const Icon(Icons.chevron_right, color: Colors.grey),
  //           ),
  //         ],
  //       ),
  //     ),
  //     onTap: onTap,
  //   );
  // }
}
