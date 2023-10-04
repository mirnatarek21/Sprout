import 'package:well_fit/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLanguageButton extends StatelessWidget {
  final String buttonText;
  final Color backgroundColor;
  final Color textColor;
  final String svgImagePath;

  const CustomLanguageButton({
    required this.buttonText,
    required this.backgroundColor,
    required this.textColor,
    required this.svgImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
              foregroundColor: MaterialStateProperty.all<Color>(textColor),
              minimumSize: MaterialStateProperty.all<Size>(Size(100, 70)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 45,
                  child: SvgPicture.asset(svgImagePath),
                ),
                SizedBox(width: 90),
                Text(
                  buttonText,
                  style: Styles.QuickSand20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}