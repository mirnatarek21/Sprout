import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:sprout/log_in/stay_signed_pass.dart';
import '../../constants.dart';
import '../../utils/custom_app_button.dart';
import '../utils/custom_text_field.dart';

class StaySignedEmail extends StatefulWidget {
  @override
  _StaySignedEmailState createState() => _StaySignedEmailState();
}

class _StaySignedEmailState extends State<StaySignedEmail> {
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
              StaySignedPass(),
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
                          const SizedBox(height: 20),
                          const Text(
                            "Enter your email or your \nname",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              letterSpacing: 1.1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 40),
                          CustomTextField(
                            controller: emailController,
                            hintText: "Your Email",
                          ),
                          if (errorMessage != null)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                errorMessage!,
                                style: const TextStyle(
                                  color: textColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          const SizedBox(height: 60),
                          Padding(
                            padding: EdgeInsets.only(bottom: keyboardHeight),
                            child: CustomAppButton(
                              label: "Continue",
                              onTap: validateEmail,
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
    emailController.dispose();
    super.dispose();
  }
}
