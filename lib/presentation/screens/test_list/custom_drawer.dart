import 'package:calley_app/config/themes/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: context.colors.whiteColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(18),
            ),
          ),
          child: Column(
            children: [
              // Top profile section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.colors.primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18),
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person,
                          color: context.colors.primaryColor, size: 30),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Swati',
                              style: context.typography.textSemiBoldXLarge
                                  .copyWith(color: context.colors.whiteColor),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              '. Personal',
                              style: context.typography.textSemiBoldMedium
                                  .copyWith(
                                color: AppColors.orange,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'swati@cstech.in',
                          style: context.typography.textBodyMedium
                              .copyWith(color: context.colors.whiteColor),
                        ),
                        SizedBox(height: 4),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Menu Items
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildDrawerItem(
                        context, Icons.rocket_launch, "Getting Started"),
                    _buildDrawerItem(
                        context, Icons.cloud_done_outlined, "Sync Data"),
                    _buildDrawerItem(context, Icons.widgets, "Gamification"),
                    _buildDrawerItem(
                        context, Icons.phone_callback_rounded, "Send Logs"),
                    _buildDrawerItem(context, Icons.settings, "Settings"),
                    _buildDrawerItem(
                        context, Icons.headset_mic_outlined, "Help?"),
                    _buildDrawerItem(
                        context, Icons.cancel_outlined, "Cancel Subscription"),
                    const SizedBox(height: 16),
                    const Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "App Info",
                        style: context.typography.textSemiBoldXLarge
                            .copyWith(color: context.colors.primaryColor),
                      ),
                    ),
                    _buildDrawerItem(context, Icons.info_outline, "About Us"),
                    _buildDrawerItem(
                        context, Icons.privacy_tip_outlined, "Privacy Policy"),
                    _buildDrawerItem(
                        context, Icons.verified_user, "Version 1.01.52"),
                    _buildDrawerItem(
                        context, Icons.share_outlined, "Share App"),
                    _buildDrawerItem(context, Icons.logout, "Logout"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      leading: Icon(icon, color: context.colors.textPrimary),
      title: Text(
        title,
        style: context.typography.textSemiBoldMedium.copyWith(
          color: context.colors.textPrimary,
        ),
      ),
      onTap: () {
        //todo: Add navigation logic here
      },
    );
  }
}
