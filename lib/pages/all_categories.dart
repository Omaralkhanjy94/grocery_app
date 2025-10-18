import '../../core/packages_manager/ui_imports.dart';
import '../../core/packages_manager/extensions_imports.dart';
import '../../core/packages_manager/network_imports.dart';
import '../../core/packages_manager/data_imports.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(child: Container()),
      title: "Categories",
    );
  }
}
