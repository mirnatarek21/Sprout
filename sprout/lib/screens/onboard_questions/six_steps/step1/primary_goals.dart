import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants.dart';
import '../../../../utils/custom_app_bar.dart';
import '../../../../utils/custom_app_button.dart';
import '../../../../utils/class_card3d.dart';
import '../../../../utils/goal_card_widget.dart';
import '../../../../utils/page_route.dart';
import '../step2/activity_level.dart';
import '../../text_part_at_top.dart';

class PrimaryGoalsScreen extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const PrimaryGoalsScreen({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  _PrimaryGoalsScreenState createState() => _PrimaryGoalsScreenState();
}

class _PrimaryGoalsScreenState extends State<PrimaryGoalsScreen> {
  List<String> selectedPrimaryGoals = [];

  void toggleGoalSelection(String goal) {
    setState(() {
      selectedPrimaryGoals.contains(goal)
          ? selectedPrimaryGoals.remove(goal)
          : selectedPrimaryGoals.add(goal);
    });
  }

  bool isGoalSelected(String goal) => selectedPrimaryGoals.contains(goal);

  Widget buildGoalCard(String goal, String text, Color selectedColor) {
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
        selectedBackgroundImage: isGoalSelected(goal) ? 'assets/images/pattern.png' : null,
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
                    SizedBox(height: 45.h),
                    StepIndicatorText(
                      currentStep: widget.currentStep,
                      totalSteps: widget.totalSteps,
                    ),
                    SizedBox(height: 10.h),
                    const InstructionText(text: "What Is Your Primary \nGoals ?",),
                    SizedBox(height: 25.h),
                    Column(
                      children: [
                        buildGoalCard('Goal 1', 'Build Muscles', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildGoalCard('Goal 2', 'Loss Weight', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildGoalCard('Goal 3', 'Gain Weight', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildGoalCard('Goal 4', 'overall health', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildGoalCard('Goal 5', 'improve flexibility', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildGoalCard('Goal 6', 'increased endurance', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildGoalCard('Goal 7', 'improving energy levels', Colors.transparent),
                        SizedBox(height: 12.h),
                      ],
                    ),
                    SizedBox(height: 60.h),
                    CustomAppButton(
                        label: "Continue",
                      onTap: () => Navigator.push(
                        context,
                        customPageRoute(ActivityLevelScreen(
                          currentStep: widget.currentStep + 1,
                          totalSteps: widget.totalSteps,
                        )),
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