import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/screens/onboard_questions/six_steps/step6/workout_time.dart';
import '../../../../constants.dart';
import '../../../../utils/custom_app_bar.dart';
import '../../../../utils/custom_app_button.dart';
import '../../../../utils/class_card3d.dart';
import '../../../../utils/goal_card_widget.dart';
import '../../../../utils/page_route.dart';
import '../../text_part_at_top.dart';

class ExerciseTypeScreen extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const ExerciseTypeScreen({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  _ExerciseTypeScreenState createState() => _ExerciseTypeScreenState();
}

class _ExerciseTypeScreenState extends State<ExerciseTypeScreen> {
  List<String> selectedExercise = [];

  void toggleExerciseSelection(String exercise) {
    setState(() {
      selectedExercise.contains(exercise)
          ? selectedExercise.remove(exercise)
          : selectedExercise.add(exercise);
    });
  }

  bool isExSelected(String exercise) => selectedExercise.contains(exercise);

  Widget buildExCard(String exercise, String text, Color selectedColor) {
    return GestureDetector(
      onTap: () => toggleExerciseSelection(exercise),
      child: GoalCard3DWidget(
        card: Card3D(text: text),
        width: 327.w,
        height: 77.h,
        color: isExSelected(exercise) ? selectedColor : Colors.white,
        textColor: isExSelected(exercise) ? Colors.black : textColor,
        isSelected: isExSelected(exercise),
        onCheckboxChanged: (isSelected) => toggleExerciseSelection(exercise),
        selectedBackgroundImage: isExSelected(exercise) ? 'assets/images/pattern.png' : null,
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
                    const InstructionText(text: "What types of exercise do \nyou enjoy?",),
                    SizedBox(height: 25.h),
                    Column(
                      children: [
                        buildExCard('ex 1', 'Running', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildExCard('ex 2', 'Cycling', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildExCard('ex 3', 'Yoga', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildExCard('ex 4', 'Weightlifting', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildExCard('ex 5', 'Group Classes', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildExCard('ex 6', 'Sports', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildExCard('ex 7', 'Swimming', Colors.transparent),
                      ],
                    ),
                    SizedBox(height: 60.h),
                    CustomAppButton(
                      label: "Continue",
                      onTap: () => Navigator.push(
                        context,
                        customPageRoute(
                          WorkoutTimeScreen(
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
