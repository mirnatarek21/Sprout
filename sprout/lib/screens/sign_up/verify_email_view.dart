import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:sprout/screens/sign_up/set_pass_view.dart';
import '../../constants.dart';
import '../../utils/custom_app_button.dart';
import '../../utils/custom_linear_progress_indicator.dart';
import '../../utils/custom_pin_code_field.dart';

class VerifyEmailScreen extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final String email; // Add the email parameter

  const VerifyEmailScreen({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
    required this.email, // Receive the email
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Calculate the height of the available space minus the keyboard
            final double keyboardHeight =
                MediaQuery.of(context).viewInsets.bottom;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(width: 85),
                      CustomLinerStepper(
                        width: 120,
                        totalSteps: totalSteps.toDouble(),
                        step: currentStep.toDouble(),
                        backgroundColor: textColor.withOpacity(0.2),
                        activeColor: buttonColor,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 80),
                        Text(
                          "STEP ${currentStep}/7",
                          style: const TextStyle(
                            color: textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Verify your email",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            letterSpacing: 1.1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "We’ve sent the code to $email.",
                          style: const TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            letterSpacing: 1.1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 60),
                        CustomVerificationCode(
                          onCompleted: (value) {
                            // Handle code completion
                            print('Verification Code: $value');
                          },
                          onChange: (value) {
                            // Handle code change
                            print('Current Code: $value');
                          },
                        ),
                        const SizedBox(height: 60),
                        const Text(
                          "Send me a new code",
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            letterSpacing: 1.1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 60),
                        Padding(
                          padding: EdgeInsets.only(bottom: keyboardHeight),
                          child: CustomAppButton(
                            label: "Continue",
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      PasswordScreen(
                                    currentStep: currentStep + 1,
                                    totalSteps: totalSteps,
                                  ),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return SharedAxisTransition(
                                      animation: animation,
                                      secondaryAnimation: secondaryAnimation,
                                      transitionType:
                                          SharedAxisTransitionType.horizontal,
                                      child: child,
                                    );
                                  },
                                ),
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
