import 'dart:convert';

import 'package:calley_app/config/routes/route_names.dart';
import 'package:calley_app/config/themes/extensions/theme_extension.dart';
import 'package:calley_app/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../widgets/custom_text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  final dynamic data;
  const SignUpScreen({super.key, this.data});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  bool _agree = false;
  String _countryCode = '+91';
  bool _isLoading = false;

  Future<void> _registerAndSendOtp() async {
    final name = _nameCtrl.text.trim();
    final email = _emailCtrl.text.trim();
    final password = _passCtrl.text;
    final mobile = _phoneCtrl.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }
    if (!_agree) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You must agree to T&C.'),
          backgroundColor: context.colors.errorColor,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      // 1) Register
      final regRes = await http.post(
        Uri.parse('https://mock-api.calleyacd.com/api/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': name,
          'email': email,
          'password': password,
        }),
      );
      print(regRes.body);
      print(regRes.statusCode);
      if (regRes.statusCode != 200) {
        final msg = json.decode(regRes.body)['message'] ?? regRes.reasonPhrase;
      }

      // 2) Send OTP to email
      final otpRes = await http.post(
        Uri.parse('https://mock-api.calleyacd.com/api/auth/send-otp'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email}),
      );
      print(otpRes.body);
      print(otpRes.statusCode);

      if (otpRes.statusCode != 200) {
        final msg = json.decode(otpRes.body)['message'] ?? otpRes.reasonPhrase;
        throw Exception('Send OTP failed: $msg');
      }

      // 3) Navigate to OTP screen
      Navigator.pushNamed(
        context,
        RoutesName.otpScreen,
        arguments: {
          'countryCode': _countryCode,
          'mobileNumber': mobile,
          'email': email,
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(e.toString()),
            backgroundColor: context.colors.errorColor),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: context.colors.whiteColor,
        toolbarHeight: 20,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Text("Welcome!",
                  style:
                      context.typography.textHeaderHero.copyWith(fontSize: 36)),
              const SizedBox(height: 8),
              Text("Please register to continue",
                  style: context.typography.textBodyMedium
                      .copyWith(color: context.colors.textHint)),
              const SizedBox(height: 24),

              // Name / Email / Password / Phone fields...
              CustomTextField(
                  controller: _nameCtrl,
                  hintText: "Name",
                  icon: Icons.person_outline),
              const SizedBox(height: 16),
              CustomTextField(
                  controller: _emailCtrl,
                  hintText: "Email address",
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 16),
              CustomTextField(
                  controller: _passCtrl,
                  hintText: "Password",
                  icon: Icons.lock_outline,
                  obscureText: true),
              const SizedBox(height: 16),
              Row(
                children: [
                  // Country code dropdown...
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: DropdownButton<String>(
                      value: _countryCode,
                      underline: const SizedBox(),
                      items: ['+91', '+1', '+44' /* …etc… */]
                          .map((c) => DropdownMenuItem(
                                value: c,
                                child: Text(c,
                                    style: context.typography.textBodyMedium),
                              ))
                          .toList(),
                      onChanged: (v) => setState(() => _countryCode = v!),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomTextField(
                      controller: _phoneCtrl,
                      hintText: "Mobile number",
                      icon: Icons.phone_android,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    activeColor: context.colors.primaryColor,
                    value: _agree,
                    onChanged: (v) => setState(() => _agree = v!),
                  ),
                  const Text("I agree to the "),
                  GestureDetector(
                    onTap: () {
                      // open your T&C link
                    },
                    child: Text("Terms and Conditions",
                        style: context.typography.textBodyMedium
                            .copyWith(color: context.colors.primaryColor)),
                  ),
                ],
              ),

              const SizedBox(height: 24),
              _isLoading
                  ? CircularProgressIndicator(
                      color: context.colors.primaryColor,
                    )
                  : CustomButtonWidget(
                      buttonText: "Sign Up",
                      onPress: _registerAndSendOtp,
                    ),

              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, RoutesName.signInScreen),
                    child: Text("Sign In",
                        style: context.typography.textBodyMedium
                            .copyWith(color: context.colors.primaryColor)),
                  ),
                ],
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
