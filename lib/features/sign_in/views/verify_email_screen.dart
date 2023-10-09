
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:well_fit/features/sign_in/views/widgets/code_widget.dart';

import '../../../constants.dart';
import '../../../core/utils/app_router.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/styles.dart';
import '../../../core/utils/widgets/custom_button.dart';

class VerifyEmailScreen extends StatelessWidget{
  const VerifyEmailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12), // Add padding here
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      AssetsData.arrow,
                      width: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      AssetsData.rectangle,
                      width: 60,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.genderScreen);
                    },
                    child: Text(
                      'Back',
                      style: Styles.quickSand16.copyWith(color: buttonColor),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'STEP 4/5',
                      style: Styles.quickSand16.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: buttonColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Verify Your Email',
                    style: Styles.quickSand25,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'We’ll send the code on ui@vertex.com',
                    style: Styles.quickSand16.copyWith(fontSize: 15, color: Color(0xff9F9F9F)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 45),
                  CodeWidget(),
                  // Pinput(
                  //   length: 4,
                  //   showCursor: true,
                  //   onCompleted: (pin) => print(pin),
                  // ),
                  const SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Send Me a New Code',
                      style: Styles.quickSand16.copyWith(fontSize: 14, color: buttonColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 45),
                  CustomButton(
                    buttonText: 'Continue',
                    onPressed: () {
                    },
                    backgroundColor: buttonColor,
                    textColor: Colors.white,
                    textStyle: Styles.rubik16.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
