import 'package:calley_app/config/routes/route_names.dart';
import 'package:calley_app/config/themes/extensions/query_extension.dart';
import 'package:calley_app/config/themes/extensions/theme_extension.dart';
import 'package:calley_app/core/constants/app_colors.dart';
import 'package:calley_app/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    const videoUrl = "https://youtu.be/xSsFtDY-nOw?si=4ukPAulfy6IjVIzj";
    final videoId = YoutubePlayer.convertUrlToId(videoUrl)!;

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              // Header Card
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.pinkAccent,
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello Swati",
                          style: context.typography.textSemiBoldMedium
                              .copyWith(color: context.colors.whiteColor),
                        ),
                        Text(
                          "Calley Personal",
                          style: context.typography.textSemiBoldLarge
                              .copyWith(color: context.colors.whiteColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Instruction Box
              Container(
                width: context.queryWidth * 0.98,
                decoration: BoxDecoration(
                  color: context.colors.secondaryColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "If you are here for the first time then ensure that you have uploaded the list to call from calley Web Panel hosted on https://app.getcalley.com",
                        style: context.typography.textBodyMedium
                            .copyWith(color: context.colors.whiteColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: context.colors.primaryColor,
                      ),
                      child: YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              const Spacer(),

              // Bottom Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.successColor,
                        ),
                        image: DecorationImage(
                          image: AssetImage(AppImages.whatsappLogo),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 3,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.colors.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          "Star Calling Now",
                          style: context.typography.textBodyMedium.copyWith(
                            color: context.colors.whiteColor,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesName.navScreen);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
