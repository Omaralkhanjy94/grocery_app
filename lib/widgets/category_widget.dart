import '../../core/packages_manager/ui_imports.dart';
import '../../core/packages_manager/network_imports.dart';
import '../../core/packages_manager/data_imports.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({super.key, required this.category});

  ///Category name
  String get name => category.name;

  ///Category image
  String get imagePath => category.imagePath;

  ///Category circle color
  Color get circleColor => category.circleColor;

  ///Category onTap
  VoidCallback? get onTap => category.onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        spacing: 5,
        children: [
          CircleAvatar(
            radius: 52 / 2,
            backgroundColor: circleColor,
            child: Image.asset(imagePath, height: 25, width: 25),
          ),
          Text(
            name,
            style: GoogleFonts.poppins(fontSize: 12, color: Color(0xff868889)),
          ),
        ],
      ),
    );
  }
}
