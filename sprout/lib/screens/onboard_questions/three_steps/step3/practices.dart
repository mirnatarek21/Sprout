import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/screens/onboard_questions/practice_card.dart';
import 'package:sprout/screens/onboard_questions/six_steps/step1/primary_goals.dart';
import '../../../../constants.dart';
import '../../../../utils/custom_app_bar.dart';
import '../../../../utils/custom_app_button.dart';
import '../../../../utils/page_route.dart';
import '../../text_part_at_top.dart';

class PracticesScreen extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const PracticesScreen({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  _PracticesScreenState createState() => _PracticesScreenState();
}

class _PracticesScreenState extends State<PracticesScreen> {
  List<String> selectedPractices = [];

  final List<Map<String, String>> practices = [
    {'key': 'Practice 1', 'text': 'meditation'},
    {'key': 'Practice 2', 'text': 'therapy'},
    {'key': 'Practice 3', 'text': 'Sleep \nHygiene'},
    {'key': 'Practice 4', 'text': 'Nature \nWalks'},
    {'key': 'Practice 5', 'text': 'Hobbies'},
    {'key': 'Practice 6', 'text': 'journaling'},
    {'key': 'Practice 7', 'text': 'Support \nGroups'},
    {'key': 'Practice 8', 'text': 'Yoga'},
  ];

  void togglePracticeSelection(String practiceKey) {
    setState(() {
      selectedPractices.contains(practiceKey)
          ? selectedPractices.remove(practiceKey)
          : selectedPractices.add(practiceKey);
    });
  }

  bool isPracticeSelected(String practiceKey) {
    return selectedPractices.contains(practiceKey);
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
                    StepIndicatorText(
                      currentStep: widget.currentStep,
                      totalSteps: widget.totalSteps,
                    ),
                    SizedBox(height: 10.h),
                    const InstructionText(
                      text: "What Practices Do You \nPrefer To Support \nYour Mental Health?",
                    ),
                    SizedBox(height: 25.h),
                    _buildPracticeGrid(),
                    SizedBox(height: 100.h),
                    CustomAppButton(
                      label: "Continue",
                      onTap: () =>
                          Navigator.push(
                            context,
                            customPageRoute(
                              const PrimaryGoalsScreen(
                                currentStep: 1,
                                totalSteps: 6,
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

  Widget _buildPracticeGrid() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: practices.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.3,
        mainAxisSpacing: 12.0.h,
        crossAxisSpacing: 12.0.w,
      ),
      itemBuilder: (context, index) {
        final practice = practices[index];
        return BuildPracticeCard(
          practiceKey: practice['key']!,
          text: practice['text']!,
          isSelected: isPracticeSelected(practice['key']!),
          toggleSelection: togglePracticeSelection,
        );
      },
    );
  }
}