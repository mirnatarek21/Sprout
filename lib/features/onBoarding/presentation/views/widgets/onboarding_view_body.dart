import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/text_strings.dart';
import 'model_onboarding.dart';
import 'onboarding_page_widget.dart';

class OnBoardingViewBody extends StatefulWidget {
  @override
  _OnBoardingViewBodyState createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pages = [
      onBoardingPageWidget(
        model: OnBoardingModel(
          image: AssetsData.onBoarding1,
          title: onBoardingTittle1,
          subTitle: onBoardingSubTittle1,
          height: size.height,
          bgColor: Colors.white,
        ),
      ),
      onBoardingPageWidget(
        model: OnBoardingModel(
          image: AssetsData.onBoarding2,
          title: onBoardingTittle2,
          subTitle: onBoardingSubTittle2,
          height: size.height,
          bgColor: Colors.white,
        ),
      ),
      onBoardingPageWidget(
        model: OnBoardingModel(
          image: AssetsData.onBoarding3,
          title: onBoardingTittle3,
          subTitle: onBoardingSubTittle3,
          height: size.height,
          bgColor: Colors.white,
        ),
      ),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: controller,
            children: pages,
            onPageChanged: onPageChangedCallback,
          ),
          const SizedBox(height: 50),
          Positioned(
            bottom: 80,
            right: 150,
            child: InkWell(
              onTap: () {
                if (currentPage < pages.length - 1) {
                  currentPage++;
                  controller.animateToPage(
                    currentPage,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                } else {
                  GoRouter.of(context).push(AppRouter.screen1);
                }
              },
              child: SvgPicture.asset(
                getImageAssetPath(currentPage),
                width: 90,
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xfff4f4f4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: GestureDetector(
                onTap: () => GoRouter.of(context).push(AppRouter.screen1),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text(
                    'Skip',
                    textAlign: TextAlign.center,
                    style: Styles.quickSand20.copyWith(
                      fontWeight: FontWeight.w600,
                      color: buttonColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPageChangedCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }String getImageAssetPath(int currentPage) {
    switch (currentPage) {
      case 0:
        return AssetsData.next1;
      case 1:
        return AssetsData.next2;
      case 2:
        return AssetsData.next3;
      default:
        return '';
    }
  }
}

