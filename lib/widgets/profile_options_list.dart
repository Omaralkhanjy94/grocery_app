import '../core/packages_manager/ui_imports.dart';
import '../core/packages_manager/network_imports.dart';
import '../core/packages_manager/extensions_imports.dart';
import '../core/packages_manager/data_imports.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class ProfileOptionsList extends StatelessWidget {
  ProfileOptionsList({super.key});

  ///Map of options
  final options = [
    {
      "id": 1,
      "icon": Icon(Icons.person_outline, color: Color(0xFF28B446)),
      "title": "About me",
      "onTap": () {},
    },
    {
      "id": 2,
      "icon": Icon(Icons.inventory_2_outlined, color: Color(0xFF28B446)),
      "title": "My Orders",
      "onTap": () {},
    },
    {
      "id": 3,
      "icon": Icon(Icons.favorite_outline, color: Color(0xFF28B446)),
      "title": "My Favorites",
      "onTap": () {
        Go.toName("/favorites");
      },
    },
    {
      "id": 4,
      "icon": Icon(Icons.pin_drop_outlined, color: Color(0xFF28B446)),
      "title": "My Address",
      "onTap": () {},
    },
    {
      "id": 5,
      "icon": Icon(Icons.credit_card_outlined, color: Color(0xFF28B446)),
      "title": "Credit Cards",
      "onTap": () {},
    },
    {
      "id": 6,
      "icon": Icon(Icons.currency_exchange, color: Color(0xFF28B446)),
      "title": "Transactions",
      "onTap": () {},
    },
    {
      "id": 7,
      "icon": Icon(Icons.notifications_outlined, color: Color(0xFF28B446)),
      "title": "Notifications",
      "onTap": () {},
    },
    {
      "id": 8,
      "icon": Icon(Icons.logout_outlined, color: Color(0xFF28B446)),
      "title": "Sign out",
      "onTap": () {
        if (userLoggedIn == true) {
          userLoggedIn = false;
          showSnackBar("You have logged out successfuly.");
          Go.toReplaceName("/home");
          
        } else {
          Go.toReplaceName("/home");
        }
        
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemExtent: 40,
        padding: 0.paddingAll,
        itemCount: options.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: options[index]["onTap"] as VoidCallback,
            child: ListTile(
              leading: options[index]["icon"] as Widget,
              title: Text(
                options[index]["title"] as String,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
              ),
              trailing: (index != (options.length - 1)
                  ? Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xFF868889),
                      size: 30,
                    )
                  : SizedBox()),
            ),
          );
        },
      ),
    );
  }

  static void showSnackBar(String message) {
    // Requires a top-level key, e.g.:
    // final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
    // and set it on MaterialApp: MaterialApp(scaffoldMessengerKey: rootScaffoldMessengerKey, ...)
    rootScaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 3)),
    );
  }
}
