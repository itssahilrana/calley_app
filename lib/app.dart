import 'package:calley_app/config/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'config/routes/route_names.dart';
import 'config/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calley App',
      theme: AppTheme.theme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
