import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/home.dart';
import 'package:sprout/screens/Community_Screen.dart';
import 'package:sprout/screens/Notification_Page.dart';
import 'package:sprout/screens/profile_content/profile.dart';
import 'package:sprout/splash_widget.dart';

import 'screens/onboarding/Onboarding1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Set the design size
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          home: AnimatedSplashScreen(
            splash: buildSplashWidget(context),
            splashIconSize: double.infinity,
            nextScreen: OnboardingScreen1(),
            splashTransition: SplashTransition.fadeTransition,
            duration: 3000,
          ),
          routes: {
            '/home': (context) => const HomeviewBody(),
            '/notifications': (context) => NotificationPage(),
            '/community': (context) => CommunityScreen(),
            '/profile': (context) => const ProfileScreen(),
          },
        );
      },
    );
  }
}
