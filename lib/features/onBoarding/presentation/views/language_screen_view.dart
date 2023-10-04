import 'package:flutter/material.dart';
import 'package:well_fit/features/onBoarding/presentation/views/widgets/language_screen_view_body.dart';

class LanguageScreenView extends StatelessWidget {
  const LanguageScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LanguageScreenViewBody(),
    );
  }
}
