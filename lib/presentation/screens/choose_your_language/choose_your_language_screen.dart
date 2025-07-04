import 'package:calley_app/config/routes/route_names.dart';
import 'package:calley_app/config/themes/extensions/theme_extension.dart';
import 'package:calley_app/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

class ChooseYourLanguageScreen extends StatefulWidget {
  const ChooseYourLanguageScreen({super.key});

  @override
  State<ChooseYourLanguageScreen> createState() =>
      _ChooseYourLanguageScreenState();
}

class _ChooseYourLanguageScreenState extends State<ChooseYourLanguageScreen> {
  String selectedLanguage = 'English';

  final List<Map<String, String>> languages = [
    {'title': 'English', 'subtitle': 'Hi'},
    {'title': 'Hindi', 'subtitle': 'नमस्ते'},
    {'title': 'Bengali', 'subtitle': 'হ্যালো'},
    {'title': 'Kannada', 'subtitle': 'ನಮಸ್ಕಾರ'},
    {'title': 'Punjabi', 'subtitle': 'ਸਤ ਸ੍ਰੀ ਅਕਾਲ'},
    {'title': 'Tamil', 'subtitle': 'வணக்கம்'},
    {'title': 'Telugu', 'subtitle': 'హలో'},
    {'title': 'French', 'subtitle': 'Bonjour'},
    {'title': 'Spanish', 'subtitle': 'Hola'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.whiteColor,
        toolbarHeight: 10,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: languages.length,
                separatorBuilder: (_, __) => Divider(
                  height: 0,
                  color: context.colors.whiteColor,
                ),
                itemBuilder: (context, index) {
                  final lang = languages[index];
                  //final isSelected = selectedLanguage == lang['title'];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedLanguage = lang['title']!;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  lang['title']!,
                                  style: context.typography.textSemiBoldLarge,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  lang['subtitle']!,
                                  style: context.typography.textBodyMedium,
                                ),
                              ],
                            ),
                          ),
                          Radio<String>(
                            value: lang['title']!,
                            groupValue: selectedLanguage,
                            onChanged: (value) {
                              setState(() {
                                selectedLanguage = value!;
                              });
                            },
                            activeColor: context.colors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // select button widget
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: CustomButtonWidget(
                  buttonText: "Select",
                  onPress: () {
                    Navigator.pushReplacementNamed(
                        context, RoutesName.signUpScreen);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
