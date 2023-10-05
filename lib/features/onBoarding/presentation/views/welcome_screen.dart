import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/utils/widgets/custom_button.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Welcome to',
                      style: Styles.rubik30,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  AssetsData.logo,
                  const SizedBox(height: 20),
                  const Text(
                    'now Healthy life became easier!',
                    style: Styles.rubik16,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    AssetsData.startPage,
                    alignment: Alignment.center,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    buttonText: 'Get Started',
                    onPressed: (){},
                    backgroundColor: buttonColor,
                    textColor: Colors.white,
                    textStyle: Styles.rubik16.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?', style: Styles.rubik16,),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          ' Sign in',
                          style: Styles.rubik16.copyWith(color: buttonColor, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset(AssetsData.moon, width: 40, ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}