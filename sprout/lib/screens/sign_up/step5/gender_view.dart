import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/screens/sign_up/ready_view.dart';
import 'package:sprout/screens/sign_up/step5/top_with_skip.dart';
import '../../../constants.dart';
import '../../../utils/custom_app_button.dart';
import '../../../utils/card3d_widget.dart';
import '../../../utils/class_card3d.dart';
import '../../../utils/page_route.dart';
import '../step.dart';
import '../subtitle_widget.dart';
import '../title_widget.dart';

class GenderScreen extends StatefulWidget {
  final int currentStep;
  final int totalSteps;

  const GenderScreen({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String selectedGender = '';

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: TopBackButtonWithSkipper(
                onBackPressed: () {
                  Navigator.pop(context);
                },
                onSkipPressed: () {
                  Navigator.push(
                    context,
                    customPageRoute(ReadyScreen()),
                  );
                },
                currentStep: widget.currentStep,
                totalSteps: widget.totalSteps,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 50.h),
                      const StepNumber(stepText: "STEP 5/5"),
                      SizedBox(height: 10.h),
                      const TitleWidget(titleText: "Which one are you?"),
                      SizedBox(height: 80.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () => selectGender('Female'),
                            child: Card3DWidget(
                              card: Card3D(
                                text: 'Female',
                                image: 'assets/images/woman.png',
                              ),
                              width: 150.w,
                              height: 200.h,
                              color: selectedGender == 'Female' ? textColor : Colors.white,
                              textColor: selectedGender == 'Female' ? Colors.white : Colors.black,
                            ),
                          ),
                          InkWell(
                            onTap: () => selectGender('Male'),
                            child: Card3DWidget(
                              card: Card3D(
                                text: 'Male',
                                image: 'assets/images/man.png',
                              ),
                              width: 150.w,
                              height: 200.h,
                              color: selectedGender == 'Male' ? textColor : Colors.white,
                              textColor: selectedGender == 'Male' ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      const SubtitleWidget(text: "To give you a customized experience \nwe need to know your gender"),
                      SizedBox(height: 80.h),
                      CustomAppButton(
                        label: "Continue",
                        onTap: () {
                          Navigator.push(
                            context,
                            customPageRoute(
                                ReadyScreen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 34.h),
                      const SubtitleWidget(text: "Prefer not to choose"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}