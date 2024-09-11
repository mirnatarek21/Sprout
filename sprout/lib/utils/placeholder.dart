import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardHolder extends StatelessWidget {
  final double width;
  final double height;
  final IconData? icon;
  final String? topText;
  final String? bottomText;
  final String? imagePath;
  final String? iconImagePath; // New field for custom icon image
  final Color? backgroundColor;
  final Gradient? gradient;

  const CustomCardHolder({
    Key? key,
    this.width = 100,
    this.height = 140,
    this.icon,
    this.topText,
    this.bottomText,
    this.imagePath,
    this.iconImagePath, // Initialize the new field
    this.backgroundColor = Colors.white,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
        gradient: gradient,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display an icon or an image (for icon)
          if (icon != null || iconImagePath != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Icon(icon, color: Colors.black)
                else if (iconImagePath != null)
                  Image.asset(
                    iconImagePath!, // Custom icon image
                    width: 24, // Adjust width/height as needed
                    height: 24,
                  ),
                if (topText != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      topText!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
              ],
            ),

          // Bottom text (Now before the image)
          if (bottomText != null)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                bottomText!,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),

          // Image (Moved below the bottomText)
          if (imagePath != null)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset(imagePath!, width: 50, height: 50),
            ),
        ],
      ),
    );
  }
}
