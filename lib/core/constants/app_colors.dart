import 'package:flutter/material.dart';

///These Constants are declared on the bases of themes inside config
//TODO: set your desired colors and replace existing if you want to change them
//TODO: do not change any variable name in this file because they are called in app_theme.dart

class AppColors {
  // Primary and Secondary Colors
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Color(0xff1A265E);

  // Background and Surface Colors
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color surfaceColor = Color(0xFFFFFFFF);

  // Card and Divider Colors
  static const Color cardColor = Color(0xFFEEEEEE);
  static const Color dividerColor = Color(0xFFBDBDBD);

  // Highlight and Splash Colors
  static const Color highlightColor = Color(0xFF7C4DFF);
  static const Color splashColor = Color(0xFFB39DDB);

  // AppBar and Scaffold Colors
  static const Color appBarColor = Color(0xFF1976D2);
  static const Color scaffoldBackgroundColor = Color(0xFFFFFFFF);

  // Dialog and Accent Colors
  static const Color dialogBackgroundColor = Color(0xFFF1F1F1);
  static const Color accentColor = Color(0xFFFFC107);

  // Text Colors
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFF9E9E9E);
  static const Color textDisabled = Color(0xFFBDBDBD);

  // General Colors
  static const Color whiteColor = Color(0xFFFFFFFF); // White color
  static const Color errorColor = Color(0xFFD32F2F); // Error color (Red)
  static const Color successColor = Colors.green;
  static const Color orange = Colors.orange;
  static const Color purple = Colors.purple;
}
