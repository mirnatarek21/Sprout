import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/home.dart';
import 'package:sprout/log_in/forget_pass.dart';
import 'package:sprout/log_in/top_back_button.dart';
import '../../constants.dart';
import '../../utils/custom_app_button.dart';
import '../../utils/pass_custom_text_field.dart';
import '../utils/page_route.dart';

class StaySignedPass extends StatefulWidget {
  @override
  _StaySignedPassState createState() => _StaySignedPassState();
}

class _StaySignedPassState extends State<StaySignedPass> {
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

            return Column(
              children: [
                TopBackButtonPadding(onPressed: () => Navigator.pop(context)),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 30.h),
                          const Text(
                            "Stay signed in with your account",
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 1.1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20.h),
                          const Text(
                            "Enter your password",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              letterSpacing: 1.1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 40.h),
                          SimplePasswordCustomTextField(
                            controller: passwordController,
                            hintText: "Your Password",
                          ),
                          SizedBox(height: 80.h),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, customPageRoute(const ForgetPass()));
                            },
                            child: const Text(
                              "Forgot password?",
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                letterSpacing: 1.1,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 60.h),
                          Padding(
                            padding: EdgeInsets.only(bottom: keyboardHeight),
                            child: CustomAppButton(
                              label: "Sign in",
                              onTap: () {
                                Navigator.push(context, customPageRoute(const HomeviewBody()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}

