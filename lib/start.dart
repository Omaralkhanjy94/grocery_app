import 'package:flutter/material.dart';
import 'package:grocery_app/go_routes.dart';
import 'package:short_navigation/short_navigation.dart' show Go;
import 'pages/splash_screen.dart';

/// The main entry point of the application.
class Grocery extends StatelessWidget {
  const Grocery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Go.navigatorKey,
      title: 'Grocery App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: SplashScreen(),
      routes: GoRoutes(),
    );
  }
}
