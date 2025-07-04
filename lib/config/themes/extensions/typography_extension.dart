import 'package:flutter/material.dart';

class AppTypographyExtension extends ThemeExtension<AppTypographyExtension> {
  final TextStyle textBodySmall;
  final TextStyle textBodyXSmall;
  final TextStyle textBodyXXSmall;
  final TextStyle textBodyMedium;
  final TextStyle textBodyLarge;
  final TextStyle textBodyXLarge;
  final TextStyle textBodyXXLarge;
  final TextStyle textBodyHero;
  final TextStyle textSemiBoldXSmall;
  final TextStyle textSemiBoldSmall;
  final TextStyle textSemiBoldMedium;
  final TextStyle textSemiBoldLarge;
  final TextStyle textSemiBoldXLarge;
  final TextStyle textHeaderSmall;
  final TextStyle textHeaderMedium;
  final TextStyle textHeaderLarge;
  final TextStyle textHeaderXLarge;
  final TextStyle textHeaderXXLarge;
  final TextStyle textHeaderHero;

  const AppTypographyExtension({
    required this.textBodySmall,
    required this.textBodyXSmall,
    required this.textBodyXXSmall,
    required this.textBodyMedium,
    required this.textBodyLarge,
    required this.textBodyXLarge,
    required this.textBodyXXLarge,
    required this.textBodyHero,
    required this.textSemiBoldXSmall,
    required this.textSemiBoldSmall,
    required this.textSemiBoldMedium,
    required this.textSemiBoldLarge,
    required this.textSemiBoldXLarge,
    required this.textHeaderSmall,
    required this.textHeaderMedium,
    required this.textHeaderLarge,
    required this.textHeaderXLarge,
    required this.textHeaderXXLarge,
    required this.textHeaderHero,
  });

  @override
  ThemeExtension<AppTypographyExtension> copyWith({
    TextStyle? textBodySmall,
    TextStyle? textBodyXSmall,
    TextStyle? textBodyXXSmall,
    TextStyle? textBodyMedium,
    TextStyle? textBodyLarge,
    TextStyle? textBodyXLarge,
    TextStyle? textBodyXXLarge,
    TextStyle? textBodyHero,
    TextStyle? textSemiBoldXSmall,
    TextStyle? textSemiBoldSmall,
    TextStyle? textSemiBoldMedium,
    TextStyle? textSemiBoldLarge,
    TextStyle? textSemiBoldXLarge,
    TextStyle? textHeaderSmall,
    TextStyle? textHeaderMedium,
    TextStyle? textHeaderLarge,
    TextStyle? textHeaderXLarge,
    TextStyle? textHeaderXXLarge,
    TextStyle? textHeaderHero,
  }) {
    return AppTypographyExtension(
      textBodySmall: textBodySmall ?? this.textBodySmall,
      textBodyXSmall: textBodyXSmall ?? this.textBodyXSmall,
      textBodyXXSmall: textBodyXXSmall ?? this.textBodyXXSmall,
      textBodyMedium: textBodyMedium ?? this.textBodyMedium,
      textBodyLarge: textBodyLarge ?? this.textBodyLarge,
      textBodyXLarge: textBodyXLarge ?? this.textBodyXLarge,
      textBodyXXLarge: textBodyXXLarge ?? this.textBodyXXLarge,
      textBodyHero: textBodyHero ?? this.textBodyHero,
      textSemiBoldXSmall: textSemiBoldXSmall ?? this.textSemiBoldXSmall,
      textSemiBoldSmall: textSemiBoldSmall ?? this.textSemiBoldSmall,
      textSemiBoldMedium: textSemiBoldMedium ?? this.textSemiBoldMedium,
      textSemiBoldLarge: textSemiBoldLarge ?? this.textSemiBoldLarge,
      textSemiBoldXLarge: textSemiBoldXLarge ?? this.textSemiBoldXLarge,
      textHeaderSmall: textHeaderSmall ?? this.textHeaderSmall,
      textHeaderMedium: textHeaderMedium ?? this.textHeaderMedium,
      textHeaderLarge: textHeaderLarge ?? this.textHeaderLarge,
      textHeaderXLarge: textHeaderXLarge ?? this.textHeaderXLarge,
      textHeaderXXLarge: textHeaderXXLarge ?? this.textHeaderXXLarge,
      textHeaderHero: textHeaderHero ?? this.textHeaderHero,
    );
  }

  @override
  ThemeExtension<AppTypographyExtension> lerp(
      covariant ThemeExtension<AppTypographyExtension>? other, double t) {
    if (other is! AppTypographyExtension) {
      return this;
    }
    return AppTypographyExtension(
      textBodySmall: TextStyle.lerp(textBodySmall, other.textBodySmall, t)!,
      textBodyXSmall: TextStyle.lerp(textBodyXSmall, other.textBodyXSmall, t)!,
      textBodyXXSmall: TextStyle.lerp(textBodyXXSmall, other.textBodyXXSmall, t)!,
      textBodyMedium: TextStyle.lerp(textBodyMedium, other.textBodyMedium, t)!,
      textBodyLarge: TextStyle.lerp(textBodyLarge, other.textBodyLarge, t)!,
      textBodyXLarge: TextStyle.lerp(textBodyXLarge, other.textBodyXLarge, t)!,
      textBodyXXLarge: TextStyle.lerp(textBodyXXLarge, other.textBodyXXLarge, t)!,
      textBodyHero: TextStyle.lerp(textBodyHero, other.textBodyHero, t)!,
      textSemiBoldXSmall: TextStyle.lerp(textSemiBoldXSmall, other.textSemiBoldXSmall, t)!,
      textSemiBoldSmall: TextStyle.lerp(textSemiBoldSmall, other.textSemiBoldSmall, t)!,
      textSemiBoldMedium: TextStyle.lerp(textSemiBoldMedium, other.textSemiBoldMedium, t)!,
      textSemiBoldLarge: TextStyle.lerp(textSemiBoldLarge, other.textSemiBoldLarge, t)!,
      textSemiBoldXLarge: TextStyle.lerp(textSemiBoldXLarge, other.textSemiBoldXLarge, t)!,
      textHeaderSmall: TextStyle.lerp(textHeaderSmall, other.textHeaderSmall, t)!,
      textHeaderMedium: TextStyle.lerp(textHeaderMedium, other.textHeaderMedium, t)!,
      textHeaderLarge: TextStyle.lerp(textHeaderLarge, other.textHeaderLarge, t)!,
      textHeaderXLarge: TextStyle.lerp(textHeaderXLarge, other.textHeaderXLarge, t)!,
      textHeaderXXLarge: TextStyle.lerp(textHeaderXXLarge, other.textHeaderXXLarge, t)!,
      textHeaderHero: TextStyle.lerp(textHeaderHero, other.textHeaderHero, t)!,
    );
  }
}
