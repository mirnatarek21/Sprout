import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/screens/sign_up/step4/pass_requirments.dart';
import 'package:sprout/screens/sign_up/step4/password_strength_checker.dart';
import '../../../constants.dart';
import '../../../log_in/top_back_button_with_stepper.dart';
import '../../../utils/custom_app_button.dart';
import '../../../utils/page_route.dart';
import '../../../utils/pass_custom_text_field.dart';
import '../../../utils/strength_pass_bar.dart';
import '../step.dart';
import '../step5/gender_view.dart';
import '../title_widget.dart';

class PasswordScreen extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const PasswordScreen({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  int strengthSteps = 0;

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
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h), // Use ScreenUtil for responsive padding
                  child: TopBackButtonWithStepper(
                    onBackPressed: () {
                      Navigator.pop(context);
                    },
                    currentStep: widget.currentStep,
                    totalSteps: widget.totalSteps,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 50.h),
                          const StepNumber(stepText: "STEP 4/5"),
                          SizedBox(height: 10.h),
                          const TitleWidget(titleText: "Set your password"),
                          SizedBox(height: 40.h),
                          PasswordCustomTextField(
                            controller: passwordController,
                            hintText: "Your Password",
                            onChanged: (value) {
                              checkPasswordStrength(value, (steps) {
                                setState(() {
                                  strengthSteps = steps;
                                });
                              });
                            },
                          ),
                          SizedBox(height: 20.h),
                          StrengthPassStepper(
                            width: 250,
                            totalSteps: 4.0,
                            step: strengthSteps.toDouble(),
                            backgroundColor: textColor.withOpacity(0.2),
                            activeColor: buttonColor,
                          ),
                          const SizedBox(height: 40),
                          PasswordRequirements(),
                          SizedBox(height: 60.h),
                          Padding(
                            padding: EdgeInsets.only(bottom: keyboardHeight),
                            child: CustomAppButton(
                              label: "Continue",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  customPageRoute(
                                    GenderScreen(
                                      currentStep: widget.currentStep + 1,
                                      totalSteps: widget.totalSteps,
                                    ),
                                  ),
                                );
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
}