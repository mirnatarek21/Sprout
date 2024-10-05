import 'package:flutter/material.dart';

import 'Onboarding2.dart';

class OnboardingScreen1 extends StatefulWidget {
  @override
  _OnboardingScreen1State createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          _buildPage1(context),
          OnboardingScreen2(),
        ],
      ),
    );
  }

  Widget _buildPage1(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(
          'assets/onboard_imgs/oboard1.png',
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top section with the sprout image
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Image.asset(
                  'assets/onboard_imgs/sprout_frame.png',
                  height: 80,
                ),
              ),

              // Middle section with welcome text
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: const Column(
                  children: [
                    const Text(
                      'Welcome To Sprout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Monitor And Master Your Fitness Journey',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom section with buttons
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
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
                      child: const Text('Continue'),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Already Have An Account? Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
