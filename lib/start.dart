import 'package:flutter/material.dart';
import '../pages/home_screen.dart';
import 'package:short_navigation/short_navigation.dart' show Go;
import 'pages/auth/login_screen.dart';
import 'pages/auth/signup_screen.dart';
import 'pages/auth/welcome_screen.dart' show WelcomeScreen;
import 'pages/splash_screen.dart';

class Groccery extends StatelessWidget {
  const Groccery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Go.navigatorKey,
      title: 'Grocery App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: SplashScreen(),
      routes: {
        '/splash1': (context) => SplashScreen1(),
        '/splash2': (context) => SplashScreen2(),
        '/splash3': (context) => SplashScreen3(),
        '/splash4': (context) => SplashScreen4(),
        '/home': (context) => const HomeScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        // Add other routes here as needed
        '/signup': (context) => SignupScreen(),
      },
    );
  }
}
