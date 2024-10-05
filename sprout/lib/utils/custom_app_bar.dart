import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../utils/custom_linear_progress_indicator.dart';

class CustomAppBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final VoidCallback onBackPressed;

  const CustomAppBar({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Row(
        children: [
          InkWell(
            onTap: onBackPressed,
            child: const Icon(Icons.arrow_back_ios, size: 30),
          ),
          const Spacer(),
          CustomLinerStepper(
            width: 120,
            totalSteps: totalSteps.toDouble(),
            step: currentStep.toDouble(),
            backgroundColor: textColor.withOpacity(0.2),
            activeColor: buttonColor,
          ),
          const Spacer(),
          InkWell(
            onTap: onBackPressed,
            child: const Text(
              "Back",
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                letterSpacing: 1.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
