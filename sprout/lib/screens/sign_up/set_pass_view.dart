import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../utils/custom_app_button.dart';
import '../../utils/custom_linear_progress_indicator.dart';
import '../../utils/pass_custom_text_field.dart';
import '../../utils/strength_pass_bar.dart';
import 'gender_view.dart';

class PasswordScreen extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const PasswordScreen(
      {Key? key, required this.currentStep, required this.totalSteps})
      : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  int strengthSteps = 0;

  void checkPasswordStrength(String password) {
    int steps = 0;
    if (password.length >= 8) steps++;
    if (RegExp(r'[A-Z]').hasMatch(password)) steps++;
    if (RegExp(r'[0-9]').hasMatch(password)) steps++;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) steps++;
    setState(() {
      strengthSteps = steps;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
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
                        totalSteps: widget.totalSteps.toDouble(),
                        step: widget.currentStep.toDouble(),
                        backgroundColor: textColor.withOpacity(0.2),
                        activeColor: buttonColor,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 30),
                          Text(
                            "STEP ${widget.currentStep}/7",
                            style: const TextStyle(
                              color: textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Set your password",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              letterSpacing: 1.1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 40),
                          PasswordCustomTextField(
                            controller: passwordController,
                            hintText: "Your Password",
                            onChanged: checkPasswordStrength,
                          ),
                          const SizedBox(height: 20),
                          StrengthPassStepper(
                            width: 250,
                            totalSteps: 4.0,
                            step: strengthSteps.toDouble(),
                            backgroundColor: textColor.withOpacity(0.2),
                            activeColor: buttonColor,
                          ),
                          const SizedBox(height: 40),
                          PasswordRequirements(),
                          const SizedBox(height: 30),
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
                                        GenderScreen(
                                      currentStep: widget.currentStep + 1,
                                      totalSteps: widget.totalSteps,
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class PasswordRequirements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "• 8+ characters",
              style: TextStyle(
                color: textColor2,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                letterSpacing: 1.1,
              ),
            ),
            SizedBox(width: 80),
            Text(
              "• 1 symbol",
              style: TextStyle(
                color: textColor2,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                letterSpacing: 1.1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "• 1 uppercase",
              style: TextStyle(
                color: textColor2,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                letterSpacing: 1.1,
              ),
            ),
            SizedBox(width: 80),
            Text(
              "• 1 number",
              style: TextStyle(
                color: textColor2,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                letterSpacing: 1.1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
