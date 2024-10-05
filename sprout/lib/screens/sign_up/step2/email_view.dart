import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/constants.dart';
import 'package:sprout/screens/sign_up/step3/verify_email_view.dart';
import '../../../log_in/email_validator.dart';
import '../../../log_in/top_back_button_with_stepper.dart';
import '../../../utils/custom_app_button.dart';
import '../../../utils/page_route.dart';
import '../step.dart';
import '../subtitle_widget.dart';
import '../text_field.dart';
import '../title_widget.dart';

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
    errorMessage = EmailValidator.validate(email);

    if (errorMessage == null) {
      // Navigate if email is valid
      Navigator.push(
        context,
        customPageRoute(VerifyEmailScreen(currentStep: widget.currentStep+1, totalSteps: widget.totalSteps, email: email)),
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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopBackButtonWithStepper(
                  onBackPressed: () {
                    Navigator.pop(context);
                  },
                  currentStep: widget.currentStep,
                  totalSteps: widget.totalSteps,
                ),
                SizedBox(height: 50.h),
                const StepNumber(stepText: "STEP 2/5"),
                SizedBox(height: 10.h),
                const TitleWidget(titleText: "Enter your email"),
                SizedBox(height: 10.h),
                const SubtitleWidget(text: "Email we can use to reach you"),
                SizedBox(height: 0.05.sh),
                SignUpTextField(
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
                SizedBox(height: 0.15.sh),
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

