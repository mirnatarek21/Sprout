import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../utils/custom_app_button.dart';
import '../../utils/custom_linear_progress_indicator.dart';
import '../../utils/custom_pin_code_field.dart';

class VerifyForgetPass extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const VerifyForgetPass(
      {Key? key, required this.currentStep, required this.totalSteps})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
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
                  const SizedBox(
                      width:
                          85), // Adjust the width as needed to move the CustomLinerStepper
                  CustomLinerStepper(
                    width: 120,
                    totalSteps: totalSteps.toDouble(),
                    step: currentStep.toDouble(),
                    backgroundColor:
                        textColor.withOpacity(0.2), // Adjust as needed
                    activeColor: buttonColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      "STEP ${currentStep}/2",
                      style: const TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Verify the code",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        letterSpacing: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "we’ve send the code to the email \non your device.",
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        letterSpacing: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 20),
                    RichText(
                      text: const TextSpan(
                        children: [
                          const TextSpan(
                            text: 'code expires in: ',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              letterSpacing: 1.1,
                            ),
                          ),
                          const TextSpan(
                            text: '00 : 30',
                            style: const TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              letterSpacing: 1.1,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    RichText(
                      text: const TextSpan(
                        children: [
                          const TextSpan(
                            text: 'didn’t receive code? ',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              letterSpacing: 1.1,
                            ),
                          ),
                          const TextSpan(
                            text: ' Resend code ',
                            style: const TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              letterSpacing: 1.1,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 35),
                    CustomAppButton(
                      label: "Verify Email",
                      onTap: () {
                        /*// Navigate to EmailScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PasswordScreen(
                              currentStep: currentStep + 1,
                              totalSteps: totalSteps,
                            ),
                          ),
                        );*/
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
