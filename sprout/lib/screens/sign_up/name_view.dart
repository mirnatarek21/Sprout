import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:sprout/constants.dart';
import '../../utils/custom_app_button.dart';
import '../../utils/custom_linear_progress_indicator.dart';
import '../../utils/custom_text_field.dart';
import 'email_view.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  int currentStep = 1;
  final int totalSteps = 7;

  final TextEditingController firstNameController = TextEditingController();
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 120),
                    CustomLinerStepper(
                      width: 120,
                      totalSteps: totalSteps.toDouble(),
                      step: currentStep.toDouble(),
                      backgroundColor: textColor.withOpacity(0.2),
                      activeColor: buttonColor,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.1),
                const Text(
                  "STEP 1/7",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Enter your full name & \nemail",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    letterSpacing: 1.1,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Your first & last name",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    letterSpacing: 1.1,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: firstNameController,
                  hintText: "Your Name",
                ),
                const SizedBox(height: 10),
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: const TextStyle(
                      color: textColor,
                      fontSize: 14,
                    ),
                  ),
                SizedBox(height: height * 0.1),
                CustomAppButton(
                  label: "Continue",
                  onTap: () {
                    if (firstNameController.text.isEmpty) {
                      setState(() {
                        errorMessage = "Name is required to continue.";
                      });
                    } else {
                      setState(() {
                        errorMessage = null;
                      });
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  EmailScreen(
                            currentStep: currentStep + 1,
                            totalSteps: totalSteps,
                          ),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
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
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
