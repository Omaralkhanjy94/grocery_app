import '../../core/packages_manager/ui_imports.dart';
import '../../core/packages_manager/network_imports.dart';

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
