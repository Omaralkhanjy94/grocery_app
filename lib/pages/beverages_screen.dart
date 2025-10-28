import '../core/packages_manager/ui_imports.dart'
    show Widget, StatelessWidget, BuildContext, CategoryProductsWidget;

class BeveragesScreen extends StatelessWidget {
  const BeveragesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryProductsWidget("Beverages", 3);
  }
}