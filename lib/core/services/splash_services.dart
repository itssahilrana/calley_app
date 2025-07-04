import 'dart:async';

import 'package:flutter/material.dart';

import '../../config/routes/route_names.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.chooseYourLanguageScreen, (route) => false);
    });
  }
}
