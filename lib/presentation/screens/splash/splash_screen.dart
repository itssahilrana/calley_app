import 'package:calley_app/config/themes/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //here we are calling the splash services
    SplashServices().isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primaryColor,
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(seconds: 1),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Text(
                "Calley App",
                style: context.typography.textHeaderHero
                    .copyWith(color: context.colors.whiteColor),
              ),
            );
          },
        ),
      ),
    );
  }
}
