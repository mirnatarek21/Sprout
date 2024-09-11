import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:sprout/home.dart';
import 'package:sprout/log_in/forget_pass.dart';
import '../../constants.dart';
import '../../utils/custom_app_button.dart';
import '../../utils/pass_custom_text_field.dart';

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
                            "Enter your password",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              letterSpacing: 1.1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 40),
                          SimplePasswordCustomTextField(
                            controller: passwordController,
                            hintText: "Your Password",
                          ),
                          const SizedBox(height: 80),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const ForgetPass(),
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
                          const SizedBox(height: 60),
                          Padding(
                            padding: EdgeInsets.only(bottom: keyboardHeight),
                            child: CustomAppButton(
                              label: "Sign in",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        const HomeviewBody(),
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

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
