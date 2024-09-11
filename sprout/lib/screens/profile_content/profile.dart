import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/home.dart';
import 'package:sprout/screens/profile_content/edit_profile.dart';
import 'package:sprout/screens/profile_content/privacy_policy.dart';
import 'package:sprout/screens/profile_content/settings.dart';
import 'package:sprout/utils/navigation_bar.dart';
import 'package:sprout/utils/placeholder.dart';
import 'package:sprout/utils/setting_item.dart';
import '../Community_Screen.dart';
import '../Notification_Page.dart';
import 'help.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                        Padding(
                          padding: const EdgeInsets.only(top: 90, left: 5),
                          child: CustomCardHolder(
                            width: 90.w,
                            height: 175.h,
                            icon: Icons.water_drop_outlined,
                            topText: 'Water',
                            bottomText: '0 Litres',
                            imagePath: 'assets/images/profile_card1.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 90, left: 110),
                          child: CustomCardHolder(
                            width: 100.w,
                            height: 80.h,
                            icon: Icons.alarm,
                            topText: 'Training',
                            bottomText: '0 min',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 190, left: 110),
                          child: CustomCardHolder(
                            width: 100.w,
                            height: 80.h,
                            icon: Icons.alarm,
                            topText: 'Sleeping',
                            bottomText: '0 Hours',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 90, left: 225),
                          child: CustomCardHolder(
                            width: 90.w,
                            height: 175.h,
                            iconImagePath: 'assets/icons/person.png',
                            topText: 'Steps',
                            imagePath: 'assets/images/steps.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
                height: 150), // Space between the stack and the settings items
            buildSettingsItem(
              'Edit Profile',
              "assets/icons/edit.png",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfileScreen()),
                );
              },
            ),
            buildSettingsItem(
              'My Statistics',
              "assets/icons/statistics.png",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfileScreen()),
                );
              },
            ),
            buildSettingsItem(
              'Settings',
              "assets/icons/settings.png",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()),
                );
              },
            ),
            buildSettingsItem(
              'My Plan',
              "assets/icons/plan.png",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfileScreen()),
                );
              },
            ),
            buildSettingsItem(
              'Help',
              "assets/icons/help.png",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const helpScreen()),
                );
              },
            ),
            buildSettingsItem(
              'Privacy Policy',
              "assets/icons/privacy.png",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const privacypolicy()),
                );
              },
            ),
            buildSettingsItem(
              'Logout',
              "assets/icons/logout.png",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfileScreen()),
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
