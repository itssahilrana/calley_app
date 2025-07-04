import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import 'extensions/color_extension.dart';
import 'extensions/typography_extension.dart';

class AppTheme {
  static ThemeData theme(BuildContext context) => ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.appBarColor,
          titleTextStyle: TextStyle(
            color: AppColors.textPrimary,
          ),
        ),
        extensions: const [
          AppColorExtension(
            primaryColor: AppColors.primaryColor,
            secondaryColor: AppColors.secondaryColor,
            backgroundColor: AppColors.backgroundColor,
            surfaceColor: AppColors.surfaceColor,
            cardColor: AppColors.cardColor,
            dividerColor: AppColors.dividerColor,
            highlightColor: AppColors.highlightColor,
            splashColor: AppColors.splashColor,
            appBarColor: AppColors.appBarColor,
            scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
            dialogBackgroundColor: AppColors.dialogBackgroundColor,
            accentColor: AppColors.accentColor,
            textPrimary: AppColors.textPrimary,
            textSecondary: AppColors.textSecondary,
            textHint: AppColors.textHint,
            textDisabled: AppColors.textDisabled,
            whiteColor: AppColors.whiteColor,
            errorColor: AppColors.errorColor,
          ),
          AppTypographyExtension(
            textBodyXXSmall: TextStyle(
              fontSize: 8,
              color: AppColors.textPrimary,
            ),
            textBodyXSmall: TextStyle(
              fontSize: 10,
              color: AppColors.textPrimary,
            ),
            textBodySmall: TextStyle(
              fontSize: 12,
              color: AppColors.textPrimary,
            ),
            textBodyMedium: TextStyle(
              fontSize: 14,
              color: AppColors.textPrimary,
            ),
            textBodyLarge: TextStyle(
              fontSize: 16,
              color: AppColors.textPrimary,
            ),
            textBodyXLarge: TextStyle(
              fontSize: 18,
              color: AppColors.textPrimary,
            ),
            textBodyXXLarge: TextStyle(
              fontSize: 20,
              color: AppColors.textPrimary,
            ),
            textBodyHero: TextStyle(
              fontSize: 32,
              color: AppColors.textPrimary,
            ),
            textSemiBoldXSmall: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 10,
              color: AppColors.textPrimary,
            ),
            textSemiBoldSmall: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: AppColors.textPrimary,
            ),
            textSemiBoldMedium: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppColors.textPrimary,
            ),
            textSemiBoldLarge: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.textPrimary,
            ),
            textSemiBoldXLarge: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: AppColors.textPrimary,
            ),
            textHeaderSmall: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: AppColors.textPrimary,
            ),
            textHeaderMedium: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: AppColors.textPrimary,
            ),
            textHeaderLarge: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppColors.textPrimary,
            ),
            textHeaderXLarge: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: AppColors.textPrimary,
            ),
            textHeaderXXLarge: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: AppColors.textPrimary,
            ),
            textHeaderHero: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 32,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      );
}
