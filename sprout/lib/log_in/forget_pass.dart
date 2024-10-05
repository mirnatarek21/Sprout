import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/log_in/top_back_button_with_stepper.dart';
import 'package:sprout/log_in/verify_forget_pass.dart';
import '../../constants.dart';
import '../../utils/custom_app_button.dart';
import '../../utils/custom_text_field.dart';
import '../utils/page_route.dart';
import 'email_validator.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  _ForgetPassState createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  int currentStep = 1;
  final int totalSteps = 2;

  final TextEditingController emailController = TextEditingController();
  String? errorMessage;

  void onSendCode() {
    final email = emailController.text;
    setState(() {
      errorMessage = EmailValidator.validate(email);
    });
    if (errorMessage == null) {
      Navigator.push(
        context,
        customPageRoute(
          VerifyForgetPass(
            currentStep: currentStep + 1,
            totalSteps: totalSteps,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopBackButtonWithStepper(
                  onBackPressed: () {
                    Navigator.pop(context);
                  },
                  currentStep: currentStep,
                  totalSteps: totalSteps,
                ),
                SizedBox(height: 50.h),
                Text(
                  "STEP 1/2",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Forget your password",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                    letterSpacing: 1.1,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Text(
                  "Please enter your e-mail address associated with your account",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    letterSpacing: 1.1,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 0.05.sh),
                CustomTextField(
                  controller: emailController,
                  hintText: "Your Email",
                ),
                if (errorMessage != null)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Text(
                      errorMessage!,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                SizedBox(height: 0.15.sh),
                CustomAppButton(
                  label: "Send Code",
                  onTap: onSendCode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}