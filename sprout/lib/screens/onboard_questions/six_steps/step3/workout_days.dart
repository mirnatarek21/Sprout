import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/screens/onboard_questions/text_part_at_top.dart';
import '../../../../constants.dart';
import '../../../../utils/custom_app_bar.dart';
import '../../../../utils/custom_app_button.dart';
import '../../../../utils/class_card3d.dart';
import '../../../../utils/goal_card_widget.dart';
import '../../../../utils/page_route.dart';
import '../step4/fitness_level.dart';

class WorkoutDaysScreen extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const WorkoutDaysScreen({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  _WorkoutDaysScreenState createState() => _WorkoutDaysScreenState();
}

class _WorkoutDaysScreenState extends State<WorkoutDaysScreen> {
  List<String> selectedWorkoutDays = [];

  void toggleDaySelection(String day) {
    setState(() {
      selectedWorkoutDays.contains(day)
          ? selectedWorkoutDays.remove(day)
          : selectedWorkoutDays.add(day);
    });
  }

  bool isDaySelected(String day) => selectedWorkoutDays.contains(day);

  Widget buildDaysCard(String day, String text, Color selectedColor) {
    return GestureDetector(
      onTap: () => toggleDaySelection(day),
      child: GoalCard3DWidget(
        card: Card3D(text: text,),
        width: 327.w,
        height: 77.h,
        color: isDaySelected(day) ? selectedColor : Colors.white,
        textColor: isDaySelected(day) ? Colors.black : textColor,
        isSelected: isDaySelected(day),
        onCheckboxChanged: (isSelected) => toggleDaySelection(day),
        selectedBackgroundImage: isDaySelected(day) ? 'assets/images/pattern.png' : null,
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
                    const InstructionText(text: "Choose your Available \nWorkout Days",),
                    SizedBox(height: 25.h),
                    Column(
                      children: [
                        buildDaysCard('Day 1', 'Saturday', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildDaysCard('Day 2', 'Sunday', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildDaysCard('Day 3', 'Monday', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildDaysCard('Day 4', 'Tuesday', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildDaysCard('Day 5', 'Wednesday', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildDaysCard('Day 6', 'Thursday', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildDaysCard('Day 7', 'Friday', Colors.transparent),
                      ],
                    ),
                    SizedBox(height: 60.h),
                    CustomAppButton(
                      label: "Continue",
                      onTap: () => Navigator.push(
                        context,
                        customPageRoute(FitnessLevelScreen(
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