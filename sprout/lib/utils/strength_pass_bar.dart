import 'package:flutter/material.dart';
import '../../constants.dart';

class StrengthPassStepper extends StatelessWidget {
  const StrengthPassStepper({
    super.key,
    this.width = 200, // Increased width for longer bars
    this.backgroundColor = const Color(0xffD8D8D8),
    this.activeColor = buttonColor,
    required this.totalSteps,
    required this.step,
  });

  final double width, totalSteps, step;
  final Color backgroundColor, activeColor;

  @override
  Widget build(BuildContext context) {
    double barWidth = (width - (totalSteps - 1) * 4) / totalSteps; // Subtracting the spacing between bars

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps.toInt(), (index) {
        bool isActive = index < step;
        return Row(
          children: [
            Container(
              width: barWidth,
              height: 8,
              decoration: BoxDecoration(
                color: isActive ? activeColor : backgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            if (index < totalSteps - 1) SizedBox(width: 4), // Add spacing except for the last bar
          ],
        );
      }),
    );
  }
}
