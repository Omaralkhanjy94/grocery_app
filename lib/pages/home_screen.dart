// Home Screen
// This screen displays the main content of the app, including categories and featured products.
// It uses a CustomScaffold for consistent layout and styling.
// It includes a search bar, a slideshow of cover images, and sections for categories and featured products.
import '../../core/packages_manager/ui_imports.dart';
import '../../core/packages_manager/extensions_imports.dart';
import '../../core/packages_manager/network_imports.dart';
import '../../core/packages_manager/data_imports.dart';
part 'home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
