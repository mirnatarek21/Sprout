import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants.dart';
import '../../../utils/custom_linear_progress_indicator.dart';

class TopBackButtonWithSkipper extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onSkipPressed;
  final int currentStep;
  final int totalSteps;

  const TopBackButtonWithSkipper({
    Key? key,
    required this.onBackPressed,
    required this.onSkipPressed,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back Button
        IconButton(
          onPressed: onBackPressed,
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: textColor,
          ),
        ),

        Expanded(
          child: Center(
            child: CustomLinerStepper(
              width: 120.w,
              totalSteps: totalSteps.toDouble(),
              step: currentStep.toDouble(),
              backgroundColor: textColor.withOpacity(0.2),
              activeColor: buttonColor,
            ),
          ),
        ),

        // Skip Button
        TextButton(
          onPressed: onSkipPressed,
          child: const Text(
            'Skip',
            style: TextStyle(
              fontSize: 16,
              color: buttonColor,
            ),
          ),
        ),
      ],
    );
  }
}
