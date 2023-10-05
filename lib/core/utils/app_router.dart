import 'package:go_router/go_router.dart';
import 'package:well_fit/features/onBoarding/presentation/views/welcome_screen.dart';

import '../../Features/onBoarding/presentation/views/language_screen_view.dart';
import '../../Features/onBoarding/presentation/views/onboarding_view.dart';

abstract class AppRouter {
  static const languageScreen = '/languageScreen';
  static const onBoardingView = '/onBoardingView';
  static const welcomeScreen = '/welcomeScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LanguageScreenView(),
      ),
      GoRoute(
        path: onBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: welcomeScreen,
        builder: (context, state) => const WelcomeScreen(),
      ),
    ],
  );
}
