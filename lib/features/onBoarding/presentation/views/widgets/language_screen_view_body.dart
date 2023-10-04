import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:well_fit/core/utils/app_router.dart';
import 'package:well_fit/core/utils/assets.dart';
import 'package:well_fit/core/utils/styles.dart';
import 'package:well_fit/core/utils/text_strings.dart';
import 'package:well_fit/core/utils/widgets/custom_language_button.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/widgets/custom_button.dart';

class LanguageScreenViewBody extends StatelessWidget {
  const LanguageScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AssetsData.logo,
          const SizedBox(height: 72),
          Text(
            languageTitle,
            style: Styles.quickSand25.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 42),
          const CustomLanguageButton(
            buttonText: 'العربية',
            backgroundColor: Color(0xffFFF1ED),
            textColor: Colors.black,
            svgImagePath: AssetsData.arabic,
          ),
          const SizedBox(height: 20),
          const CustomLanguageButton(
            buttonText: 'English',
            backgroundColor: Color(0xffff5349),
            textColor: Colors.white,
            svgImagePath: AssetsData.english,
          ),
          const SizedBox(height: 42),
          Center(
            child: Text(
              languageSubTitle,
              style: Styles.quickSand18.copyWith(
                color: const Color(0xff828894),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 94),
          CustomButton(
            buttonText: 'Continue',
            backgroundColor: buttonColor,
            textColor: Colors.white,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.onBoardingView);
            },
          ),
        ],
      ),
    );
  }
}
