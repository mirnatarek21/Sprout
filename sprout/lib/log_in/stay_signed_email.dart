import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/log_in/stay_signed_pass.dart';
import 'package:sprout/log_in/top_back_button.dart';
import '../../constants.dart';
import '../../utils/custom_app_button.dart';
import '../utils/custom_text_field.dart';
import '../utils/page_route.dart';
import 'email_validator.dart';


class StaySignedEmail extends StatefulWidget {
  @override
  _StaySignedEmailState createState() => _StaySignedEmailState();
}

class _StaySignedEmailState extends State<StaySignedEmail> {
  final TextEditingController emailController = TextEditingController();
  String? errorMessage;

  void validateEmail() {
    final email = emailController.text;
    errorMessage = EmailValidator.validate(email);

    if (errorMessage == null) {
      // Navigate if email is valid
      Navigator.push(
        context,
        customPageRoute(StaySignedPass()),
      );
    } else {
      // Update UI with error message
      setState(() {});
    }
  }

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
                TopBackButtonPadding(onPressed: () => Navigator.pop(context)),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 30.h),
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
                          SizedBox(height: 20.h),
                          const Text(
                            "Enter your email or your \nname",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              letterSpacing: 1.1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 40.h),
                          CustomTextField(
                            controller: emailController,
                            hintText: "Your Email",
                          ),
                          if (errorMessage != null)
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: Text(
                                errorMessage!,
                                style: const TextStyle(
                                  color: textColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          SizedBox(height: 60.h),
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

