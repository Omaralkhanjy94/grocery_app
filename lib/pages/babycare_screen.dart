import '../core/packages_manager/ui_imports.dart'
    show Widget, StatelessWidget, BuildContext, CategoryProductsWidget;

class BabycareScreen extends StatelessWidget {
  const BabycareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryProductsWidget("Babycare", 7);
  }
}