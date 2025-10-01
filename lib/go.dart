import '../main.dart';
import 'package:flutter/material.dart';

class Go {
  static void off(Widget page) {
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static void to(Widget page) {
    navigatorKey.currentState?.push(MaterialPageRoute(builder: (_) => page));
  }

  static void back() {
    navigatorKey.currentState?.pop();
  }

  static void toNamed(String pagePath) {
    navigatorKey.currentState?.pushNamed(pagePath);
  }

  static void offNamed(String pagePath) {
    navigatorKey.currentState?.pushReplacementNamed(pagePath);
  }
}
