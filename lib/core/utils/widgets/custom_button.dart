import 'package:flutter/material.dart';
import 'package:well_fit/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color backgroundColor;
  final Color textColor;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.backgroundColor,
    required this.textColor,
    this.textStyle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(backgroundColor),
              foregroundColor: MaterialStateProperty.all<Color>(textColor),
              minimumSize: MaterialStateProperty.all<Size>(const Size(100, 70)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonText,
                  style: textStyle ?? Styles.rubik16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
