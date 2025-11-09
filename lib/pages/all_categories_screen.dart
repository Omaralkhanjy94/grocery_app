import '../../core/packages_manager/ui_imports.dart';
import '../../core/packages_manager/extensions_imports.dart';
import '../../core/packages_manager/network_imports.dart';
import '../../core/packages_manager/data_imports.dart';

class AllCategories extends StatelessWidget {
  AllCategories({super.key});

  ///Categories list
  final List<Category> categories = Categories.getCategories();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppBar: true,
      showAppBarButtons: true,
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Container(
          height: MediaQuery.heightOf(context),
          padding: 10.paddingAll,
          width: MediaQuery.widthOf(context),
          decoration: BoxDecoration(color: secondaryColor),
          child: GridView.builder(
            shrinkWrap: true,
            padding: 5.paddingAll,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              mainAxisExtent: 110,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Container(
                margin: 5.paddingAll,
                padding: 10.paddingAll,
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFFFFBFB),
                ),
                child: Center(
                  child: CategoryWidget(
                    category: categories[index],
                  ), //Categories
                ),
              );
            },
          ),
        ),
      ),
      title: "Categories",
      appBarActions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.tune, size: 30, color: Colors.black),
        ),
      ],
    );
  }
}
