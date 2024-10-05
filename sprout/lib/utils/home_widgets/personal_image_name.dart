import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/constants.dart';
import 'package:sprout/utils/home_widgets/spacing.dart';

class PersonalImageName extends StatelessWidget {
  const PersonalImageName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 32,
          backgroundImage: AssetImage("assets/home_imgs/personal_image.png"),
        ),
        horizontalspace(8),
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: buttonColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  "Sara Draz!",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
