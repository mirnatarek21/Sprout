import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/screens/onboard_questions/three_steps/step2/mental_health.dart';
import '../../../../constants.dart';
import '../../../../utils/custom_app_bar.dart';
import '../../../../utils/custom_app_button.dart';
import '../../../../utils/class_card3d.dart';
import '../../../../utils/goal_card_widget.dart';
import '../../../../utils/page_route.dart';

class ActivityScreen extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const ActivityScreen({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  List<String> selectedActivities = [];

  void toggleActivitySelection(String activity) {
    setState(() {
      selectedActivities.contains(activity)
          ? selectedActivities.remove(activity)
          : selectedActivities.add(activity);
    });
  }

  bool isActivitySelected(String activity) =>
      selectedActivities.contains(activity);

  Widget buildActivityCard(String activity, Color selectedColor,
      String backgroundImage) {
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
        selectedBackgroundImage: isActivitySelected(activity)
            ? backgroundImage
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true);

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
                      "What Activities Help You \nFeel Relaxed Or \nRejuvenated?",
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
                        buildActivityCard('Listening To Music', Colors.transparent, 'assets/images/pattern.png'),
                        SizedBox(height: 12.h), // Adjust height with ScreenUtil
                        buildActivityCard('Creative Arts', Colors.transparent, 'assets/images/pattern.png'),
                        SizedBox(height: 12.h),
                        buildActivityCard('Reading', Colors.transparent, 'assets/images/pattern.png'),
                        SizedBox(height: 12.h),
                        buildActivityCard('Spending Time In Nature', Colors.transparent, 'assets/images/pattern.png'),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    CustomAppButton(
                      label: "Continue",
                      onTap: () =>
                          Navigator.push(
                            context,
                            customPageRoute(MentalHealthScreen(
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