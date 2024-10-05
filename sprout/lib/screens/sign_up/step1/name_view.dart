import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/constants.dart';
import 'package:sprout/screens/sign_up/step1/step_indicator.dart';
import '../../../utils/custom_app_button.dart';
import '../../../utils/custom_text_field.dart';
import '../../../utils/page_route.dart';
import '../step.dart';
import '../step2/email_view.dart';
import '../subtitle_widget.dart';
import '../title_widget.dart';

class NameScreen extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const NameScreen({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StepIndicator(
                width: 120.w,
                totalSteps: widget.totalSteps.toDouble(),
                currentStep: widget.currentStep.toDouble(),
                backgroundColor: textColor.withOpacity(0.2),
                activeColor: buttonColor,
              ),
              SizedBox(height: 50.h),
              StepNumber(stepText: "STEP 1/5",),
              SizedBox(height: 10.h),
              TitleWidget(titleText: "Enter your full name & \nemail",),
              SizedBox(height: 10.h),
              const SubtitleWidget(text: "Your first & last name"),
              SizedBox(height: 16.h),
            CustomTextField(
              controller: _firstNameController,
              hintText: "Your Name",
            ),
              SizedBox(height: 10.h),
              _buildErrorMessage(),
              SizedBox(height: 100.h),
          CustomAppButton(
            label: "Continue",
            onTap: _onContinuePressed,
          ),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildErrorMessage() {
    if (_errorMessage != null) {
      return Text(
        _errorMessage!,
        style: const TextStyle(
          color: textColor,
          fontSize: 14,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  void _onContinuePressed() {
    if (_firstNameController.text.isEmpty) {
      setState(() {
        _errorMessage = "Name is required to continue.";
      });
    } else {
      setState(() {
        _errorMessage = null;
      });
      _navigateToEmailScreen();
    }
  }

  void _navigateToEmailScreen() {
    Navigator.push(
      context,
      customPageRoute(EmailScreen(
        currentStep: widget.currentStep + 1,
        totalSteps: widget.totalSteps,
      )),
    );
  }
}
