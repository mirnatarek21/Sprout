import 'package:flutter/material.dart';
import 'package:sprout/screens/Community_Screen.dart';
import 'package:sprout/screens/Notification_Page.dart';
import 'package:sprout/screens/profile_content/edit_profile.dart';
import 'package:sprout/utils/navigation_bar.dart';
import 'package:sprout/utils/setting_item.dart';
import '../../home.dart';
import 'delete_account.dart';
import 'nottification_sittings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selectedIndex = 3;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeviewBody()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NotificationPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommunityScreen()),
        );
        break;
      case 3:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stack for the profile section
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Top Container with Background Image
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/rectangle.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    color: Colors.white),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              const Text(
                                'My Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: Image.asset(
                                  'assets/icons/Group.png',
                                  width: 30,
                                  height: 30,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // White Rectangle with Avatar
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.25,
                  left: MediaQuery.of(context).size.width * 0.1,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -50,
                          left: MediaQuery.of(context).size.width * 0.3,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey[200],
                            backgroundImage:
                                const AssetImage('assets/images/profile.jpg'),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 50, left: 110),
                          child: Text(
                            'Mirna Tarek',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 70, left: 90),
                          child: Text(
                            'mirnatarek@gmail.com',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 160),
            buildSettingsItem(
              'Notifications Settings',
              "assets/icons/notificationSettings.png",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationSettings()),
                );
              },
            ),
            buildSettingsItem(
              'Password Manager',
              "assets/icons/passwordManager.png",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfileScreen()),
                );
              },
            ),
            buildSettingsItem(
              'Delete Account',
              "assets/icons/deleteAccount.png",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const deleteaccount()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigateBar(
        onTabTapped: _onTabTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
