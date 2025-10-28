import '../core/packages_manager/ui_imports.dart'
    show Widget, StatelessWidget, BuildContext, CategoryProductsWidget;

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryProductsWidget("Grocery", 4);
  }
}