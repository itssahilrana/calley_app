import 'package:calley_app/config/routes/route_names.dart';
import 'package:calley_app/config/themes/extensions/theme_extension.dart';
import 'package:calley_app/presentation/widgets/custom_text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_button_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: context.typography.textHeaderHero,
                textAlign: TextAlign.center,
              ),

              //space
              const SizedBox(height: 12),

              Text(
                "Please Sign In to Continue",
                style: context.typography.textBodyMedium,
                textAlign: TextAlign.center,
              ),

              //space
              const SizedBox(height: 32),

              //email textfield
              CustomTextField(
                controller: mailController,
                hintText: "Email Address",
                icon: CupertinoIcons.mail,
              ),

              //space
              const SizedBox(height: 12),

              //password textfield
              CustomTextField(
                controller: passwordController,
                hintText: "Password",
                icon: CupertinoIcons.lock,
              ),

              //space
              const SizedBox(height: 100),

              // Resend
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an Account? ",
                    style: context.typography.textBodyMedium,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.signUpScreen);
                    },
                    child: Text(
                      "Sign Up",
                      style: context.typography.textBodyMedium
                          .copyWith(color: context.colors.primaryColor),
                    ),
                  ),
                ],
              ),

              // Verify Button
              CustomButtonWidget(
                buttonText: "Sign In",
                onPress: () {
                  Navigator.pushNamed(context, RoutesName.welcomeScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
