import 'package:calley_app/presentation/screens/choose_your_language/choose_your_language_screen.dart';
import 'package:calley_app/presentation/screens/navigation/nav_screen.dart';
import 'package:calley_app/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:calley_app/presentation/screens/test_list/test_list_screen.dart';
import 'package:calley_app/presentation/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../../presentation/screens/sign_up/otp_screen.dart';
import '../../presentation/screens/sign_up/sign_up_screen.dart';
import '../../presentation/screens/splash/splash_screen.dart';
import 'route_names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.navScreen:
        return MaterialPageRoute(
            builder: (context) => const NavigationScreen());
      case RoutesName.welcomeScreen:
        return MaterialPageRoute(builder: (context) => const WelcomeScreen());
      case RoutesName.chooseYourLanguageScreen:
        return MaterialPageRoute(
            builder: (context) => const ChooseYourLanguageScreen());
      case RoutesName.signInScreen:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case RoutesName.testListScreen:
        return MaterialPageRoute(builder: (context) => const TestListScreen());
      case RoutesName.signUpScreen:
        final args = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(data: args is Map ? args : null),
        );

      case RoutesName.otpScreen:
        final args = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => OtpScreen(data: args is Map ? args : null),
        );
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text('No Route Detected'),
                  ),
                ));
    }
  }
}
