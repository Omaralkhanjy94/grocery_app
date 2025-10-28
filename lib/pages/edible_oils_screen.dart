import '../core/packages_manager/ui_imports.dart'
    show Widget, StatelessWidget, BuildContext, CategoryProductsWidget;

class EdibleOilsScreen extends StatelessWidget {
  const EdibleOilsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryProductsWidget("EdibleOil", 5);
  }
}
