import 'package:well_fit/core/utils/app_router.dart';
import 'package:well_fit/core/utils/assets.dart';
import 'package:well_fit/core/utils/styles.dart';
import 'package:well_fit/core/utils/text_strings.dart';
import 'package:well_fit/core/utils/widgets/custom_language_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/widgets/custom_button.dart';

class languageScreenViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 64),
              child: AssetsData.logo,
            ),
            SizedBox(height: 72),
            Text(
              languageTitle,
              style: Styles.QuickSand25.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        SizedBox(height: 42),
        Column(
          children: [
            CustomLanguageButton(
              buttonText: 'العربية',
              backgroundColor: Color(0xffFFF1ED),
              textColor: Colors.black,
              svgImagePath: AssetsData.arabic,
            ),
            SizedBox(height: 20),
            CustomLanguageButton(
              buttonText: 'English',
              backgroundColor: Color(0xffff5349),
              textColor: Colors.white,
              svgImagePath: AssetsData.english,
            ),
          ],
        ),
        SizedBox(height: 42),
        Center(
          child: Text(
            languageSubTitle,
            style: Styles.QuickSand18.copyWith(color: Color(0xff828894)),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 94),
        CustomButton(
          buttonText: 'Continue',
          backgroundColor: buttonColor,
          textColor: Colors.white,
          onPressed: (){
            GoRouter.of(context).push(AppRouter.onBoardingView);
          },
        ),
      ],
    );
  }
}