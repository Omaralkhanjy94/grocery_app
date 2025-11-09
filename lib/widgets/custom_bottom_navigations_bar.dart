import '../core/packages_manager/ui_imports.dart';
import '../core/packages_manager/network_imports.dart';

class CustomBottomNavigationsBar extends StatelessWidget {
  const CustomBottomNavigationsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 4,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      currentIndex: currentPageIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            currentPageIndex = 0;
            Go.toName("/home");
            break;
          case 1:
            currentPageIndex = 1;
            Go.toName("/profile");
            break;
          case 2:
            currentPageIndex = 2;
            Go.toName("/favorites");
            break;
          case 3:
            currentPageIndex = 3;
            Go.toName("/cart");
            break;
        }
      },
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 30),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, size: 30),
          label: 'Profile',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border, size: 30),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFF6CC51D),
              borderRadius: BorderRadius.circular(23),
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
              size: 24,
            ),
          ),
          label: '',
        ),
      ],
    );
  }
}
