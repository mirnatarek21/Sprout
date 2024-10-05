import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/screens/onboard_questions/three_steps/step3/practices.dart';
import 'package:sprout/utils/custom_app_bar.dart';
import 'package:sprout/utils/custom_app_button.dart';
import 'package:sprout/utils/class_card3d.dart';
import 'package:sprout/utils/goal_card_widget.dart';
import 'package:sprout/constants.dart';
import '../../../../utils/page_route.dart';

class MentalHealthScreen extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const MentalHealthScreen({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  _MentalHealthScreenState createState() => _MentalHealthScreenState();
}

class _MentalHealthScreenState extends State<MentalHealthScreen> {
  List<String> selectedMentalHealthGoals = [];

  void toggleGoalSelection(String goal) {
    setState(() {
      selectedMentalHealthGoals.contains(goal)
          ? selectedMentalHealthGoals.remove(goal)
          : selectedMentalHealthGoals.add(goal);
    });
  }

  bool isGoalSelected(String goal) => selectedMentalHealthGoals.contains(goal);

  Widget buildGoalCard(String goal, String text, Color selectedColor, String backgroundImage) {
    return GestureDetector(
      onTap: () => toggleGoalSelection(goal),
      child: GoalCard3DWidget(
        card: Card3D(text: text),
        width: 327.w,
        height: 77.h,
        color: isGoalSelected(goal) ? selectedColor : Colors.white,
        textColor: isGoalSelected(goal) ? Colors.black : textColor,
        isSelected: isGoalSelected(goal),
        onCheckboxChanged: (isSelected) => toggleGoalSelection(goal),
        selectedBackgroundImage: isGoalSelected(goal) ? backgroundImage : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              currentStep: widget.currentStep,
              totalSteps: widget.totalSteps,
              onBackPressed: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.h),
                    Text(
                      "STEP ${widget.currentStep}/${widget.totalSteps}",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    const Text(
                      "What Are Your Primary \nMental Health \nOr Wellness Goals?",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        letterSpacing: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 25.h),
                    Column(
                      children: [
                        buildGoalCard('Goal 1', 'Improve Mood', Colors.transparent, 'assets/images/pattern.png'),
                        SizedBox(height: 12.h),
                        buildGoalCard('Goal 2', 'Stress Reduction', Colors.transparent, 'assets/images/pattern.png'),
                        SizedBox(height: 12.h),
                        buildGoalCard('Goal 3', 'Better focus', Colors.transparent, 'assets/images/pattern.png'),
                        SizedBox(height: 12.h),
                        buildGoalCard('Goal 4', 'Enhanced Self-Esteem', Colors.transparent, 'assets/images/pattern.png'),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    CustomAppButton(
                      label: "Continue",
                      onTap: () => Navigator.push(
                        context,
                        customPageRoute(
                          PracticesScreen(
                            currentStep: widget.currentStep + 1,
                            totalSteps: widget.totalSteps,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

