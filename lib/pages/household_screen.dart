import '../core/packages_manager/ui_imports.dart'
    show Widget, StatelessWidget, BuildContext, CategoryProductsWidget;

class HouseholdScreen extends StatelessWidget {
  const HouseholdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryProductsWidget("Household", 6);
  }
}