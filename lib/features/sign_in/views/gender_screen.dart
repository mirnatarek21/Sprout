
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:well_fit/features/sign_in/views/widgets/gender_widget.dart';

import '../../../constants.dart';
import '../../../core/utils/app_router.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/styles.dart';
import '../../../core/utils/widgets/custom_button.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  int selectedGender = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12,),
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
                    onTap: () {},
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
                      'STEP 2/5',
                      style: Styles.quickSand16.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: buttonColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Choose Your Gender',
                      style: Styles.quickSand25.copyWith(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GenderWidget(
                    onChange: (gender) {
                      setState(() {
                        selectedGender = gender;
                      });
                    },
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'To give you a customized experience \nwe need to know your gender',
                      style: Styles.rubik16.copyWith(color: Color(0xff4C5980)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 76,
                  ),
                  CustomButton(
                    buttonText: 'Continue',
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.nameScreen);
                    },
                    backgroundColor: buttonColor,
                    textColor: Colors.white,
                    textStyle: Styles.rubik16.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}