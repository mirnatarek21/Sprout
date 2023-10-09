import 'package:go_router/go_router.dart';
import 'package:well_fit/features/onBoarding/presentation/views/welcome_screen.dart';

import '../../Features/onBoarding/presentation/views/language_screen_view.dart';
import '../../Features/onBoarding/presentation/views/onboarding_view.dart';
import '../../features/sign_up/views/email_screen.dart';
import '../../features/sign_up/views/gender_screen.dart';
import '../../features/sign_up/views/name_screen_view.dart';
import '../../features/sign_up/views/verify_email_screen.dart';

abstract class AppRouter {
  static const languageScreen = '/languageScreen';
  static const onBoardingView = '/onBoardingView';
  static const welcomeScreen = '/welcomeScreen';
  static const nameScreen = '/nameScreen';
  static const genderScreen = '/genderScreen';
  static const emailScreen = '/emailScreen';
  static const verifyEmailScreen = '/verifyEmailScreen';

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
      GoRoute(
        path: nameScreen,
        builder: (context, state) => const NameScreen(),
      ),
      GoRoute(
        path: genderScreen,
        builder: (context, state) => const GenderScreen(),
      ),
      GoRoute(
        path: emailScreen,
        builder: (context, state) => const EmailScreen(),
      ),
      GoRoute(
        path: verifyEmailScreen,
        builder: (context, state) => const VerifyEmailScreen(),
      ),
    ],
  );
}
