import 'package:flutter/material.dart';
import 'package:sprout/constants.dart';

class SubtitleWidget extends StatelessWidget {
  final String text; // Required
  final Color color; // the rest are Optional
  final FontWeight fontWeight;
  final double fontSize;
  final double letterSpacing;

  const SubtitleWidget({
    Key? key,
    required this.text,
    this.color = textColor2,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 16.0,
    this.letterSpacing = 1.1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
      ),
      textAlign: TextAlign.center,
    );
  }
}
