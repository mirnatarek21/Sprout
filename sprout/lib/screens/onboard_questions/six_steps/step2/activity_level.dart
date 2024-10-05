import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/screens/onboard_questions/six_steps/step3/workout_days.dart';
import '../../../../constants.dart';
import '../../../../utils/class_card3d.dart';
import '../../../../utils/custom_app_bar.dart';
import '../../../../utils/custom_app_button.dart';
import '../../../../utils/goal_card_widget.dart';
import '../../../../utils/page_route.dart';
import '../../text_part_at_top.dart';


class ActivityLevelScreen extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const ActivityLevelScreen({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  _ActivityLevelScreenState createState() => _ActivityLevelScreenState();
}

class _ActivityLevelScreenState extends State<ActivityLevelScreen> {
  List<String> selectedActivityLevels = [];

  void toggleActivitySelection(String activity) {
    setState(() {
      selectedActivityLevels = [activity];
    });
  }
  bool isActivitySelected(String activity) =>
      selectedActivityLevels.contains(activity);

  Widget buildActivityCard(String activity, Color selectedColor) {
    return InkWell(
      onTap: () => toggleActivitySelection(activity),
      child: GoalCard3DWidget(
        card: Card3D(text: activity),
        width: 327.w,
        height: 77.h,
        color: isActivitySelected(activity) ? selectedColor : Colors.white,
        textColor: isActivitySelected(activity) ? Colors.black : textColor,
        isSelected: isActivitySelected(activity),
        onCheckboxChanged: (isSelected) => toggleActivitySelection(activity),
        selectedBackgroundImage: isActivitySelected(activity) ? 'assets/images/pattern.png' : null,
        isCentered: true,
        showCheckbox: false,
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
                    const InstructionText(text: "Choose your Activity \nLevel",),
                    SizedBox(height: 25.h),
                    Column(
                      children: [
                        buildActivityCard('Very Active', Colors.transparent),
                        SizedBox(height: 12.h), // Adjust height with ScreenUtil
                        buildActivityCard('Moderately Active', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildActivityCard('Lightly Active', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildActivityCard('Inactive', Colors.transparent),
                      ],
                    ),
                    SizedBox(height: 80.h),
                    CustomAppButton(
                      label: "Continue",
                      onTap: () =>
                          Navigator.push(
                            context,
                            customPageRoute(WorkoutDaysScreen(
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