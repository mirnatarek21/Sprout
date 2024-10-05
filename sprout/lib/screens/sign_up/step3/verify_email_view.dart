import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/screens/sign_up/step4/set_pass_view.dart';
import '../../../constants.dart';
import '../../../log_in/top_back_button_with_stepper.dart';
import '../../../utils/custom_app_button.dart';
import '../../../utils/custom_pin_code_field.dart';
import '../../../utils/page_route.dart';
import '../step.dart';
import '../subtitle_widget.dart';
import '../title_widget.dart';

class VerifyEmailScreen extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final String email;

  const VerifyEmailScreen({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
    required this.email,
  }) : super(key: key);

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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: TopBackButtonWithStepper(
                    onBackPressed: () {
                      Navigator.pop(context);
                    },
                    currentStep: currentStep,
                    totalSteps: totalSteps,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 50.h),
                        const StepNumber(stepText: "STEP 3/5"),
                        SizedBox(height: 10.h),
                        const TitleWidget(titleText: "Verify your email"),
                        SizedBox(height: 16.h),
                        SubtitleWidget(text: "We’ve sent the code to $email.", fontSize: 14, fontWeight: FontWeight.w500,),
                        SizedBox(height: 60.h),
                        CustomVerificationCode(
                          onCompleted: (value) {// Handle code completion
                            print('Verification Code: $value');
                          },
                          onChange: (value) {// Handle code change
                            print('Current Code: $value');
                          },
                        ),
                        SizedBox(height: 60.h),
                        const SubtitleWidget(text: "Send me a new code"),
                        SizedBox(height: 60.h),
                        Padding(
                          padding: EdgeInsets.only(bottom: keyboardHeight),
                          child: CustomAppButton(
                            label: "Continue",
                            onTap: () {
                              Navigator.push(
                                context,
                                customPageRoute(PasswordScreen(
                                  currentStep: currentStep + 1,
                                  totalSteps: totalSteps,
                                )),
                              );
                            },
                          ),
                        ),
                      ],
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
}