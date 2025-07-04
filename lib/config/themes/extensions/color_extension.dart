import 'package:flutter/material.dart';

@immutable
class AppColorExtension extends ThemeExtension<AppColorExtension> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color surfaceColor;
  final Color cardColor;
  final Color dividerColor;
  final Color highlightColor;
  final Color splashColor;
  final Color appBarColor;
  final Color scaffoldBackgroundColor;
  final Color dialogBackgroundColor;
  final Color accentColor;
  final Color textPrimary;
  final Color textSecondary;
  final Color textHint;
  final Color textDisabled;
  final Color whiteColor;
  final Color errorColor;

  const AppColorExtension({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.surfaceColor,
    required this.cardColor,
    required this.dividerColor,
    required this.highlightColor,
    required this.splashColor,
    required this.appBarColor,
    required this.scaffoldBackgroundColor,
    required this.dialogBackgroundColor,
    required this.accentColor,
    required this.textPrimary,
    required this.textSecondary,
    required this.textHint,
    required this.textDisabled,
    required this.whiteColor,
    required this.errorColor,
  });

  @override
  ThemeExtension<AppColorExtension> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? surfaceColor,
    Color? cardColor,
    Color? dividerColor,
    Color? highlightColor,
    Color? splashColor,
    Color? appBarColor,
    Color? scaffoldBackgroundColor,
    Color? dialogBackgroundColor,
    Color? accentColor,
    Color? textPrimary,
    Color? textSecondary,
    Color? textHint,
    Color? textDisabled,
    Color? whiteColor,
    Color? errorColor,
  }) {
    return AppColorExtension(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      cardColor: cardColor ?? this.cardColor,
      dividerColor: dividerColor ?? this.dividerColor,
      highlightColor: highlightColor ?? this.highlightColor,
      splashColor: splashColor ?? this.splashColor,
      appBarColor: appBarColor ?? this.appBarColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
      dialogBackgroundColor: dialogBackgroundColor ?? this.dialogBackgroundColor,
      accentColor: accentColor ?? this.accentColor,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textHint: textHint ?? this.textHint,
      textDisabled: textDisabled ?? this.textDisabled,
      whiteColor: whiteColor ?? this.whiteColor,
      errorColor: errorColor ?? this.errorColor,
    );
  }

  @override
  ThemeExtension<AppColorExtension> lerp(
      covariant ThemeExtension<AppColorExtension>? other, double t) {
    if (other is! AppColorExtension) {
      return this;
    }
    return AppColorExtension(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      surfaceColor: Color.lerp(surfaceColor, other.surfaceColor, t)!,
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      highlightColor: Color.lerp(highlightColor, other.highlightColor, t)!,
      splashColor: Color.lerp(splashColor, other.splashColor, t)!,
      appBarColor: Color.lerp(appBarColor, other.appBarColor, t)!,
      scaffoldBackgroundColor: Color.lerp(scaffoldBackgroundColor, other.scaffoldBackgroundColor, t)!,
      dialogBackgroundColor: Color.lerp(dialogBackgroundColor, other.dialogBackgroundColor, t)!,
      accentColor: Color.lerp(accentColor, other.accentColor, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textHint: Color.lerp(textHint, other.textHint, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      whiteColor: Color.lerp(whiteColor, other.whiteColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
    );
  }
}
