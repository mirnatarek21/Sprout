import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants.dart';
import '../../../../utils/class_card3d.dart';
import '../../../../utils/custom_app_bar.dart';
import '../../../../utils/custom_app_button.dart';
import '../../../../utils/goal_card_widget.dart';
import '../../../../utils/page_route.dart';
import '../../text_part_at_top.dart';
import '../../two_steps/restrictions_or_preferences.dart';

class WorkoutTimeScreen extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const WorkoutTimeScreen({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  _WorkoutTimeScreenState createState() => _WorkoutTimeScreenState();
}

class _WorkoutTimeScreenState extends State<WorkoutTimeScreen> {
  List<String> selectedWorkoutTime = [];

  void toggleTimeSelection(String time) {
    setState(() {
      selectedWorkoutTime = [time];
    });
  }
  bool isTimeSelected(String time) =>
      selectedWorkoutTime.contains(time);

  Widget buildTimeCard(String time, Color selectedColor) {
    return InkWell(
      onTap: () => toggleTimeSelection(time),
      child: GoalCard3DWidget(
        card: Card3D(text: time),
        width: 327.w,
        height: 77.h,
        color: isTimeSelected(time) ? selectedColor : Colors.white,
        textColor: isTimeSelected(time) ? Colors.black : textColor,
        isSelected: isTimeSelected(time),
        onCheckboxChanged: (isSelected) => toggleTimeSelection(time),
        selectedBackgroundImage: isTimeSelected(time) ? 'assets/images/pattern.png' : null,
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
                    const InstructionText(
                      text: "what time of day do you \nprefer to \nwork out?",
                    ),
                    SizedBox(height: 25.h),
                    Column(
                      children: [
                        buildTimeCard('morning', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildTimeCard('afternoon', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildTimeCard('evening', Colors.transparent),
                      ],
                    ),
                    SizedBox(height: 80.h),
                    CustomAppButton(
                      label: "Continue",
                      onTap: () =>
                          Navigator.push(
                            context,
                            customPageRoute(RestOrPrefScreen(
                              currentStep: 1,
                              totalSteps: 2,
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