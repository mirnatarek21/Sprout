import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/constants.dart';

class FitnessCard {
  final String text;
  final String subtext;
  final String imagePath;

  FitnessCard({
    required this.text,
    required this.subtext,
    required this.imagePath,
  });
}

class FitnessCardWidget extends StatelessWidget {
  const FitnessCardWidget({
    Key? key,
    required this.card,
    this.width = 400,
    this.height = 150,
    this.color = lightblue,
    this.textColor = Colors.black,
    required this.isSelected,
    this.selectedBackgroundColor,
  }) : super(key: key);

  final FitnessCard card;
  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final bool isSelected;
  final Color? selectedBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular(15.r);

    return PhysicalModel(
      elevation: 10.h,
      borderRadius: border,
      color: color,
      child: ClipRRect(
        borderRadius: border,
        child: Container(
          width: width.w,
          height: height.h,
          decoration: BoxDecoration(
            color: isSelected
                ? selectedBackgroundColor ?? Colors.blue : color,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(14.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          card.text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: textColor,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          card.subtext,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Image.asset(
                  card.imagePath,
                  width: 50.w,
                  height: 90.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}