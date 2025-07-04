import 'package:calley_app/config/themes/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function() onPress;
  const CustomButtonWidget(
      {super.key, required this.buttonText, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          buttonText,
          style: context.typography.textSemiBoldLarge
              .copyWith(color: context.colors.whiteColor),
        ),
      ),
    );
  }
}
