import 'package:flutter/material.dart';
import 'color_extension.dart';
import 'typography_extension.dart';



extension ThemeExtension on BuildContext {
  AppColorExtension get colors {
    return Theme.of(this).extension<AppColorExtension>()!;
  }

  AppTypographyExtension get typography {
    return Theme.of(this).extension<AppTypographyExtension>()!;
  }
}