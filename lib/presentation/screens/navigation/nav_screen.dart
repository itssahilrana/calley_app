import 'package:calley_app/config/themes/extensions/theme_extension.dart';
import 'package:calley_app/presentation/screens/calling/calling_screen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 2;

  final navScreens = [
    CallingScreen(),
    CallingScreen(),
    CallingScreen(),
    CallingScreen(),
    CallingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentIndex,
        selectedItemColor: context.colors.textPrimary,
        selectedColorOpacity: 0.3,
        onTap: (i) => setState(() => currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text(""),
            selectedColor: context.colors.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.contact_mail,
              size: 24,
            ),
            title: Text(""),
            selectedColor: context.colors.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.play_arrow_outlined,
              size: 35,
            ),
            title: Text(""),
            selectedColor: context.colors.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.call),
            title: Text(""),
            selectedColor: context.colors.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.calendar_month_sharp),
            title: Text(""),
            selectedColor: context.colors.primaryColor,
          ),
        ],
      ),
      body: navScreens[currentIndex],
    );
  }
}
