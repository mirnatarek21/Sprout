import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

class TopBackButtonPadding extends StatelessWidget {
  final VoidCallback onPressed;

  const TopBackButtonPadding({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
