import 'package:flutter/material.dart';

import '../../constants.dart';

class StepNumber extends StatelessWidget {
  final String stepText;

  const StepNumber({
    Key? key,
    required this.stepText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      stepText,
      style: const TextStyle(
        color: textColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
