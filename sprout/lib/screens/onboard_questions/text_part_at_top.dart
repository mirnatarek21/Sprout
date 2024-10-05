import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/constants.dart';

class StepIndicatorText extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepIndicatorText({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "STEP $currentStep/$totalSteps",
      style: TextStyle(
        color: buttonColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class InstructionText extends StatelessWidget {
  final String text;

  const InstructionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 24,
        letterSpacing: 1.1,
      ),
      textAlign: TextAlign.center,
    );
  }
}
