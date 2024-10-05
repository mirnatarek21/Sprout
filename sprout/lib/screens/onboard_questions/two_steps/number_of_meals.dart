import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants.dart';
import '../../../../utils/custom_app_bar.dart';
import '../../../../utils/custom_app_button.dart';
import '../../../../utils/page_route.dart';
import '../text_part_at_top.dart';
import '../../../../utils/custom_text_field.dart';
import '../three_steps/step1/activities.dart';

class NumberOfMealsScreen extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const NumberOfMealsScreen({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  _NumberOfMealsScreenState createState() => _NumberOfMealsScreenState();
}

class _NumberOfMealsScreenState extends State<NumberOfMealsScreen> {
  final TextEditingController _mealsController = TextEditingController();
  final TextEditingController _snacksController = TextEditingController();

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
                      text: "How many meals and \nsnacks do you \nprefer to eat each day?",
                    ),
                    SizedBox(height: 50.h),
                    // Row 1: Meals
                    _buildNumberInputRow('Meals', _mealsController),
                    SizedBox(height: 20.h),
                    // Row 2: Snacks
                    _buildNumberInputRow('Snacks', _snacksController),

                    SizedBox(height: 100.h),
                    CustomAppButton(
                      label: "Continue",
                      onTap: () => Navigator.push(
                        context,
                        customPageRoute(ActivityScreen(
                          currentStep: 1,
                          totalSteps: 3,
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

  // Widget for creating a row with label and custom text field for number input
  Widget _buildNumberInputRow(String label, TextEditingController controller) {
    return Row(
      children: [
        SizedBox(
          width: 80.w,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16.sp,
              color: buttonColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Second Column: Custom Text Field
        Expanded(
          child: CustomTextField(
            controller: controller,
            hintText: ' ',
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
