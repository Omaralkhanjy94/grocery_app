import '../core/packages_manager/ui_imports.dart'
    show Widget, StatelessWidget, BuildContext, CategoryProductsWidget;

class FruitesScreen extends StatelessWidget {
  const FruitesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryProductsWidget("Fruits", 2);
  }
}
