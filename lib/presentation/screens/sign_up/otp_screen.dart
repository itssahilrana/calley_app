import 'dart:convert';

import 'package:calley_app/config/routes/route_names.dart';
import 'package:calley_app/config/themes/extensions/theme_extension.dart';
import 'package:calley_app/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  final dynamic data;
  const OtpScreen({super.key, this.data});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool _isLoading = false;
  TextEditingController otpController = TextEditingController();

  Future<void> _verifyOtp() async {
    final otp = otpController.text.trim();
    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a 6‑digit code.'),
          backgroundColor: context.colors.errorColor,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      // Build & send request
      var request = http.Request(
        'POST',
        Uri.parse('https://mock-api.calleyacd.com/api/auth/verify-otp'),
      );
      request.headers['Content-Type'] = 'application/json';
      request.body = json.encode({
        'email': widget.data?['email'] ?? '',
        'otp': otp,
      });

      final response = await request.send();
      final body = await response.stream.bytesToString();
      debugPrint('OTP verify status: ${response.statusCode}');
      debugPrint('OTP verify body:   $body');

      if (response.statusCode == 200) {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, RoutesName.signInScreen);
      } else {
        final msg = (json.decode(body)['message'] ?? response.reasonPhrase)!;
        throw Exception(msg);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verification failed: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

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
                "Whatsapp OTP\nVerification",
                style: context.typography.textHeaderHero,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                "Please ensure that the email id mentioned is valid\nas we have sent an OTP to your email.",
                style: context.typography.textBodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // OTP Fields
              PinCodeTextField(
                appContext: context,
                length: 6,
                controller: otpController,
                onChanged: (value) {},
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(6),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  inactiveColor: Colors.grey.shade300,
                  activeColor: context.colors.primaryColor,
                  selectedColor: context.colors.primaryColor,
                ),
              ),
              const SizedBox(height: 8),

              Text(
                "${widget.data?["countryCode"] ?? ""} ${widget.data?["mobileNumber"] ?? ""}",
                style: context.typography.textSemiBoldMedium,
              ),
              const SizedBox(height: 100),

              // Resend
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive OTP code? ",
                    style: context.typography.textBodyMedium,
                  ),
                  GestureDetector(
                    onTap: () {
                      ///todo: Handle resend
                    },
                    child: Text(
                      "Resend OTP",
                      style: context.typography.textBodyMedium
                          .copyWith(color: context.colors.primaryColor),
                    ),
                  ),
                ],
              ),

              // Verify Button
              _isLoading
                  ? CircularProgressIndicator(
                      color: context.colors.primaryColor,
                    )
                  : CustomButtonWidget(
                      buttonText: "Verify",
                      onPress: _verifyOtp,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
