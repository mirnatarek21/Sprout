import 'package:go_router/go_router.dart';

import '../../Features/onBoarding/presentation/views/language_screen_view.dart';
import '../../Features/onBoarding/presentation/views/onboarding_view.dart';

abstract class AppRouter {
  static const languagescreen = '/languagescreen';
  static const onBoardingView = '/onBoardingView';
  static const screen1 = '/screen1';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const languageScreenView(),
      ),
      GoRoute(
        path: onBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
    ],
  );
}