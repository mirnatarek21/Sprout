import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:sprout/screens/sign_up/profile_view.dart';
import 'package:sprout/screens/sign_up/ready_view.dart';
import '../../constants.dart';
import '../../utils/custom_app_button.dart';
import '../../utils/custom_linear_progress_indicator.dart';
import '../../utils/class_card3d.dart';
import '../../utils/goal_card_widget.dart';

class GoalScreen extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const GoalScreen({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  _GoalScreenState createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  List<String> selectedGoals = [];

  void toggleGoalSelection(String goal) {
    setState(() {
      if (selectedGoals.contains(goal)) {
        selectedGoals.remove(goal);
      } else {
        selectedGoals.add(goal);
      }
    });
  }

  bool isGoalSelected(String goal) {
    return selectedGoals.contains(goal);
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
                    child: const Icon(Icons.arrow_back_ios, size: 30),
                  ),
                  const Spacer(),
                  CustomLinerStepper(
                    width: 120,
                    totalSteps: widget.totalSteps.toDouble(),
                    step: widget.currentStep.toDouble(),
                    backgroundColor: textColor.withOpacity(0.2),
                    activeColor: buttonColor,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
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
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
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
                        "Let us know how we can \nhelp you",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          letterSpacing: 1.1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "You always can change this later",
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          letterSpacing: 1.1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Column(
                        children: [
                          // First Goal
                          InkWell(
                            onTap: () => toggleGoalSelection('Goal 1'),
                            child: GoalCard3DWidget(
                              card: Card3D(
                                text: 'Weight loss',
                                image: 'assets/icons/goal1.png',
                              ),
                              width: 327,
                              height: 77,
                              color: isGoalSelected('Goal 1')
                                  ? Colors.transparent
                                  : Colors.white,
                              textColor: isGoalSelected('Goal 1')
                                  ? Colors.white
                                  : Colors.black,
                              isSelected: isGoalSelected('Goal 1'),
                              onCheckboxChanged: (bool isSelected) {
                                toggleGoalSelection('Goal 1');
                              },
                              selectedBackgroundImage: isGoalSelected('Goal 1')
                                  ? 'assets/images/pattern_pink.png'
                                  : null,
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Second Goal
                          InkWell(
                            onTap: () => toggleGoalSelection('Goal 2'),
                            child: GoalCard3DWidget(
                              card: Card3D(
                                text: 'Better sleeping habit',
                                image: 'assets/icons/goal2.png',
                              ),
                              width: 327,
                              height: 77,
                              color: isGoalSelected('Goal 2')
                                  ? blueshade
                                  : Colors.white,
                              textColor: isGoalSelected('Goal 2')
                                  ? Colors.white
                                  : Colors.black,
                              isSelected: isGoalSelected('Goal 2'),
                              onCheckboxChanged: (bool isSelected) {
                                toggleGoalSelection('Goal 2');
                              },
                              selectedBackgroundImage: isGoalSelected('Goal 2')
                                  ? 'assets/images/pattern_blue.png'
                                  : null,
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Third Goal
                          InkWell(
                            onTap: () => toggleGoalSelection('Goal 3'),
                            child: GoalCard3DWidget(
                              card: Card3D(
                                text: 'Track my nutrition',
                                image: 'assets/icons/goal3.png',
                              ),
                              width: 327,
                              height: 77,
                              color: isGoalSelected('Goal 3')
                                  ? pinkShade
                                  : Colors.white,
                              textColor: isGoalSelected('Goal 3')
                                  ? Colors.white
                                  : Colors.black,
                              isSelected: isGoalSelected('Goal 3'),
                              onCheckboxChanged: (bool isSelected) {
                                toggleGoalSelection('Goal 3');
                              },
                              selectedBackgroundImage: isGoalSelected('Goal 3')
                                  ? 'assets/images/pattern_pink.png'
                                  : null,
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Fourth Goal
                          InkWell(
                            onTap: () => toggleGoalSelection('Goal 4'),
                            child: GoalCard3DWidget(
                              card: Card3D(
                                text: 'Improve overall fitness',
                                image: 'assets/icons/goal4.png',
                              ),
                              width: 327,
                              height: 77,
                              color: isGoalSelected('Goal 4')
                                  ? blueshade
                                  : Colors.white,
                              textColor: isGoalSelected('Goal 4')
                                  ? Colors.white
                                  : Colors.black,
                              isSelected: isGoalSelected('Goal 4'),
                              onCheckboxChanged: (bool isSelected) {
                                toggleGoalSelection('Goal 4');
                              },
                              selectedBackgroundImage: isGoalSelected('Goal 4')
                                  ? 'assets/images/pattern_blue.png'
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      CustomAppButton(
                        label: "Continue",
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      ProfileScreen(
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
