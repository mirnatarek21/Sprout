import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants.dart';
import '../../../../utils/custom_app_bar.dart';
import '../../../../utils/custom_app_button.dart';
import '../../../../utils/page_route.dart';
import '../step5/exercise_type.dart';
import '../../text_part_at_top.dart';
import 'fitness_level_card.dart';


class FitnessLevelScreen extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const FitnessLevelScreen({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  _FitnessLevelScreenState createState() => _FitnessLevelScreenState();
}

class _FitnessLevelScreenState extends State<FitnessLevelScreen> {
  List<String> selectedFitnessLevel = [];

  void toggleLevelSelection(String level) {
    setState(() {
      selectedFitnessLevel = [level];
    });
  }

  bool isLevelSelected(String level) => selectedFitnessLevel.contains(level);

  Widget buildFitnessCard(String level,String txt,  String imagePath, Color selectedColor) {
    return InkWell(
      onTap: () => toggleLevelSelection(level),
      child: FitnessCardWidget(
        card: FitnessCard(text: level, subtext: txt, imagePath: imagePath),
        textColor: isLevelSelected(level) ? Colors.white : Colors.black,
        isSelected: isLevelSelected(level),
        selectedBackgroundColor: isLevelSelected(level) ? buttonColor : Colors.blue[50],
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
                      text: "what is your current \nfitness level ?",
                    ),
                    SizedBox(height: 25.h),
                    Column(
                      children: [
                        buildFitnessCard('Beginner', "No Fitness Experience", 'assets/images/level.png', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildFitnessCard('Mid-level', "Work out moderately ", 'assets/images/level2.png', Colors.transparent),
                        SizedBox(height: 12.h),
                        buildFitnessCard('Professional', "Always work out regularly \ntwo or three times a week ", 'assets/images/level3.png', Colors.transparent),
                      ],
                    ),
                    SizedBox(height: 80.h),
                    CustomAppButton(
                      label: "Continue",
                      onTap: () => Navigator.push(
                        context,
                        customPageRoute(ExerciseTypeScreen(
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