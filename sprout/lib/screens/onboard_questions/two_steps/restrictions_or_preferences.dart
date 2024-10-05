import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/screens/onboard_questions/practice_card.dart';
import 'package:sprout/screens/onboard_questions/six_steps/step1/primary_goals.dart';
import '../../../../constants.dart';
import '../../../../utils/custom_app_bar.dart';
import '../../../../utils/custom_app_button.dart';
import '../../../../utils/page_route.dart';
import '../text_part_at_top.dart';
import 'number_of_meals.dart';


class RestOrPrefScreen extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const RestOrPrefScreen({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  _RestOrPrefScreenState createState() => _RestOrPrefScreenState();
}

class _RestOrPrefScreenState extends State<RestOrPrefScreen> {
  List<String> selectedPref = [];

  final List<Map<String, String>> pref = [
    {'key': 'Pref 1', 'text': 'vegetarian'},
    {'key': 'Pref 2', 'text': 'gluten-free'},
    {'key': 'Pref 3', 'text': 'halal'},
    {'key': 'Pref 4', 'text': 'vegan'},
    {'key': 'Pref 5', 'text': 'dairy-free'},
    {'key': 'Pref 6', 'text': 'sugar-free'},
    {'key': 'Pref 7', 'text': 'Intermittent \nFasting'},
    {'key': 'Pref 8', 'text': 'allergies'},
  ];

  void togglePracticeSelection(String prefKey) {
    setState(() {
      selectedPref.contains(prefKey)
          ? selectedPref.remove(prefKey)
          : selectedPref.add(prefKey);
    });
  }

  bool isPrefSelected(String prefKey) {
    return selectedPref.contains(prefKey);
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
                      text: "Do you have any dietary \nrestrictions or \npreferences?",
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
                              const NumberOfMealsScreen(
                                currentStep: 2,
                                totalSteps: 2,
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
      itemCount: pref.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.3,
        mainAxisSpacing: 12.0.h,
        crossAxisSpacing: 12.0.w,
      ),
      itemBuilder: (context, index) {
        final preference = pref[index];
        return BuildPracticeCard(
          practiceKey: preference['key']!,
          text: preference['text']!,
          isSelected: isPrefSelected(preference['key']!),
          toggleSelection: togglePracticeSelection,
        );
      },
    );
  }
}