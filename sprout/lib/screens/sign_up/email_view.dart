import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:sprout/constants.dart';
import 'package:sprout/screens/sign_up/verify_email_view.dart';
import '../../utils/custom_app_button.dart';
import '../../utils/custom_linear_progress_indicator.dart';
import '../../utils/custom_text_field.dart';

class EmailScreen extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const EmailScreen({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController emailController = TextEditingController();
  String? errorMessage;

  void validateEmail() {
    final email = emailController.text;
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z]+\.[a-zA-Z]{2,3}$');

    if (emailRegex.hasMatch(email)) {
      setState(() {
        errorMessage = null;
      });
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              VerifyEmailScreen(
            currentStep: widget.currentStep + 1,
            totalSteps: widget.totalSteps,
            email: email,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
        ),
      );
    } else {
      setState(() {
        errorMessage = "Please enter a valid email in the format: ***@***.***";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the height of the screen
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 30,
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
                SizedBox(height: height * 0.1), // 10% of the screen height
                const Text(
                  "STEP 2/7",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Enter your email",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    letterSpacing: 1.1,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Email we can use to reach you",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    letterSpacing: 1.1,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.05), // Adjust height dynamically
                CustomTextField(
                  controller: emailController,
                  hintText: "Your Email",
                ),
                if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(
                        color: textColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                SizedBox(height: height * 0.15), // Adjust height dynamically
                CustomAppButton(
                  label: "Continue",
                  onTap: validateEmail,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
