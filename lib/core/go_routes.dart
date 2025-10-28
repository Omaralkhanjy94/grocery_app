import 'dart:collection';

import 'package:grocery_app/pages/edible_oils_screen.dart';
import 'package:grocery_app/pages/household_screen.dart';

import '../core/packages_manager/ui_imports.dart';

/// A class that defines the routes for the application.
class GoRoutes extends MapBase<String, WidgetBuilder> {
  final Map<String, WidgetBuilder> _routes = {
    '/home': (context) => HomeScreen(),
    '/welcome': (context) => WelcomeScreen(),
    '/login': (context) => LoginScreen(),
    // Add other routes here as needed
    '/signup': (context) => SignupScreen(),
    '/all_categories': (context) => AllCategories(),
    '/vegetables': (context) => VegetablesScreen(),
    '/fruits': (context) => FruitesScreen(),
    '/beverages': (context) => BeveragesScreen(),
    '/grocery': (context) => GroceryScreen(),
    '/edible_oils': (context) => EdibleOilsScreen(),
    '/household': (context) => HouseholdScreen(),
    '/babycare': (context) => BabycareScreen(),
  };

  @override
  /// Returns the widget builder for the given route key.
  WidgetBuilder? operator [](Object? key) => _routes[key];

  @override
  /// Sets the widget builder for the given route key.
  void operator []=(String key, WidgetBuilder value) {
    _routes[key] = value;
  }

  @override
  /// Clears all routes from the map.
  void clear() {
    _routes.clear();
  }

  @override
  /// Returns the number of routes in the map.
  Iterable<String> get keys => _routes.keys;

  @override
  /// Returns the number of routes in the map.
  WidgetBuilder? remove(Object? key) => _routes.remove(key);
}
