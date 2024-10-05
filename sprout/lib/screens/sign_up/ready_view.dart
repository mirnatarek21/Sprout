import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/constants.dart';
import 'package:sprout/screens/sign_up/subtitle_widget.dart';
import 'package:sprout/screens/sign_up/title_widget.dart';
import '../../utils/custom_app_button.dart';

class ReadyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueshade,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallpaper.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60.h),
                const TitleWidget(titleText: "You are ready to go!"),
                SizedBox(height: 15.h),
                const SubtitleWidget(
                  text: "Thanks for taking your time to \ncreate an account with us. Now this is the fun part, let’s explore the app.",
                  fontWeight: FontWeight.w300,
                ),
                SizedBox(height: 100.h),
                Image.asset('assets/images/girl.png'),
                SizedBox(height: 150.h),
                CustomAppButton(
                  label: "Continue",
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
