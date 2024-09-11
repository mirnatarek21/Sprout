import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:sprout/screens/sign_up/ready_view.dart';
import '../../constants.dart';
import '../../utils/custom_app_button.dart';
import '../../utils/custom_linear_progress_indicator.dart';
import '../../utils/card3d_widget.dart';
import '../../utils/class_card3d.dart';
import 'goal_view.dart';

class GenderScreen extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const GenderScreen(
      {Key? key, required this.currentStep, required this.totalSteps})
      : super(key: key);

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String selectedGender = '';

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 85),
                  CustomLinerStepper(
                    width: 120,
                    totalSteps: widget.totalSteps.toDouble(),
                    step: widget.currentStep.toDouble(),
                    backgroundColor: textColor.withOpacity(0.2),
                    activeColor: buttonColor,
                  ),
                  const SizedBox(width: 50),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  ReadyScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SharedAxisTransition(
                              animation: animation,
                              secondaryAnimation: secondaryAnimation,
                              transitionType:
                                  SharedAxisTransitionType.horizontal,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "Skip",
                      style: const TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 80),
                      Text(
                        "STEP ${widget.currentStep}/7",
                        style: const TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Which one are you?",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          letterSpacing: 1.1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () => selectGender('Female'),
                            child: Card3DWidget(
                              card: Card3D(
                                text: 'Female',
                                image: 'assets/images/Female.png',
                              ),
                              width: 150,
                              height: 200,
                              color: selectedGender == 'Female'
                                  ? pinkShade
                                  : Colors.white,
                              textColor: selectedGender == 'Female'
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          InkWell(
                            onTap: () => selectGender('Male'),
                            child: Card3DWidget(
                              card: Card3D(
                                text: 'Male',
                                image: 'assets/images/Male.png',
                              ),
                              width: 150,
                              height: 200,
                              color: selectedGender == 'Male'
                                  ? pinkShade
                                  : Colors.white,
                              textColor: selectedGender == 'Male'
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "To give you a customized experience \nwe need to know your gender",
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          letterSpacing: 1.1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 90),
                      CustomAppButton(
                        label: "Continue",
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      GoalScreen(
                                currentStep: widget.currentStep + 1,
                                totalSteps: widget.totalSteps,
                              ),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return SharedAxisTransition(
                                  animation: animation,
                                  secondaryAnimation: secondaryAnimation,
                                  transitionType:
                                      SharedAxisTransitionType.horizontal,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 34),
                      const Text(
                        "Prefer not to choose",
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          letterSpacing: 1.1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
