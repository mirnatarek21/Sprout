import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:sprout/screens/onboard_questions/six_steps/step1/primary_goals.dart';
import '../../log_in/stay_signed_email.dart';
import '../onboard_questions/three_steps/step1/activities.dart';
import '../sign_up/step2/email_view.dart';
import '../sign_up/step1/name_view.dart';
import 'Onboarding1.dart';

class OnboardingScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/onboard_imgs/onboard3.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.teal.withOpacity(0.3),
          ),
          SafeArea(
            child: Column(
              children: [
                // Skip button at the top
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          _navigateToOnboardingScreen1(context);
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),

                // Sprout image
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Image.asset(
                    'assets/onboard_imgs/sprout_frame.png',
                    height: 80,
                  ),
                ),

                const Spacer(),

                // Text content
                const Column(
                  children: const [
                    Text(
                      'Let\'s Get Started!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Our diets and workouts are the perfect way to',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'start your day. Sweat hard, then have a snack',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'or drink. Whatever you prefer!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // Start button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            NameScreen(currentStep: 1, totalSteps: 5,),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return SharedAxisTransition(
                            animation: animation,
                            secondaryAnimation: secondaryAnimation,
                            transitionType: SharedAxisTransitionType.horizontal,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                  ),
                  child: const Text('Start'),
                ),
                const SizedBox(height: 20),

                // Dots at the bottom
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDot(context, false),
                    const SizedBox(width: 10),
                    _buildDot(context, true),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToOnboardingScreen1(BuildContext context) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return OnboardingScreen1();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  Widget _buildDot(BuildContext context, bool isActive) {
    return Container(
      width: isActive ? 12 : 8,
      height: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white54,
        shape: BoxShape.circle,
      ),
    );
  }
}
