import 'package:flutter/material.dart';

import '../../../utils/custom_linear_progress_indicator.dart';

class StepIndicator extends StatelessWidget {
  final double totalSteps;
  final double currentStep;
  final Color backgroundColor;
  final Color activeColor;
  final double width;

  const StepIndicator({
    Key? key,
    required this.totalSteps,
    required this.currentStep,
    required this.backgroundColor,
    required this.activeColor,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomLinerStepper(
          width: width,
          totalSteps: totalSteps,
          step: currentStep,
          backgroundColor: backgroundColor,
          activeColor: activeColor,
        ),
      ],
    );
  }
}
