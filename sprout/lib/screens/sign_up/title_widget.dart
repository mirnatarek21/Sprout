import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String titleText;

  const TitleWidget({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        letterSpacing: 1.1,
      ),
      textAlign: TextAlign.center,
    );
  }
}
