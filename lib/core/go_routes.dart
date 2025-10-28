import 'dart:collection';

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
