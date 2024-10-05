import 'package:flutter/material.dart';
import 'package:sprout/log_in/top_back_button_with_stepper.dart';
import '../../constants.dart';
import '../../utils/custom_app_button.dart';
import '../../utils/custom_pin_code_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyForgetPass extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const VerifyForgetPass({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            children: [
              TopBackButtonWithStepper(
                onBackPressed: () {
                  Navigator.pop(context);
                },
                currentStep: currentStep,
                totalSteps: totalSteps,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30.h),
                      Text(
                        "STEP ${currentStep}/$totalSteps",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      const Text(
                        "Verify the code",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          letterSpacing: 1.1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16.h),
                      const Text(
                        "We’ve sent the code to the email on your device.",
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          letterSpacing: 1.1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20.h),
                      CustomVerificationCode(
                        onCompleted: (value) {// Handle code completion
                          print('Verification Code: $value');
                        },
                        onChange: (value) {// Handle code change
                          print('Current Code: $value');
                        },
                      ),
                      SizedBox(height: 20.h),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Code expires in: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                letterSpacing: 1.1,
                              ),
                            ),
                            TextSpan(
                              text: '00 : 30',
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15.h),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Didn’t receive the code? ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                letterSpacing: 1.1,
                              ),
                            ),
                            TextSpan(
                              text: ' Resend code ',
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 35.h),
                      CustomAppButton(
                        label: "Verify Email",
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
