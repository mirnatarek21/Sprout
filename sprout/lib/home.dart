import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/builders/headers_txt.dart';
import 'package:sprout/builders/workout_lessons_card.dart';
import 'package:sprout/screens/Community_Screen.dart';
import 'package:sprout/screens/Notification_Page.dart';
import 'package:sprout/screens/profile_content/profile.dart';
import 'package:sprout/utils/home_widgets/calories_card.dart';
import 'package:sprout/utils/home_widgets/cards_builder.dart';
import 'package:sprout/utils/home_widgets/exercises_card.dart';
import 'package:sprout/utils/home_widgets/most_active_days.dart';
import 'package:sprout/utils/home_widgets/notification_icon.dart';
import 'package:sprout/utils/home_widgets/personal_image_name.dart';
import 'package:sprout/utils/home_widgets/spacing.dart';
import 'package:sprout/utils/navigation_bar.dart';

class HomeviewBody extends StatefulWidget {
  const HomeviewBody({super.key});

  @override
  _HomeviewBodyState createState() => _HomeviewBodyState();
}

class _HomeviewBodyState extends State<HomeviewBody> {
  int _selectedIndex = 0;
  static List<Widget> _screens = [];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body : _screens[_selectedIndex],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App Bar
                  verticalSpace(17),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PersonalImageName(),
                      NotificationsIcon(),
                    ],
                  ),
                  // Today's Activities
                  verticalSpace(30),
                  const HeadersTxt(
                    righTxt: "Today’s Activity",
                    leftTxt: "See Details",
                  ),
                  verticalSpace(16),
                  const Row(
                    children: [
                      CaloriesCard(),
                      Spacer(),
                      ExercisesCard(),
                    ],
                  ),
                  // Most Active Days Card
                  verticalSpace(28),
                  const MostActiveCard(),
                  // Workout Headers Txt
                  verticalSpace(28),
                  const HeadersTxt(
                    righTxt: "Workout Lessons",
                    leftTxt: "See Details",
                  ),
                  verticalSpace(14),
                ],
              ),
            ),
            // Workout Cards Builder
            const CardsBuilder(
              child: WorkoutLessonsCard(),
            ),
            // Nutrition Plans Headers Txt
            verticalSpace(28),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: const HeadersTxt(
                righTxt: "Nutrition Plans",
                leftTxt: "See Details",
              ),
            ),
            // Nutrition Cards Builder
            verticalSpace(14),
            const CardsBuilder(
              child: WorkoutLessonsCard(),
            ),
            verticalSpace(20),
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
