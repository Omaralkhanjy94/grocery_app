import "package:grocery_app/core/packages_manager/network_imports.dart";
import "package:grocery_app/core/packages_manager/ui_imports.dart";

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final bool showAppBar;
  final bool resizeToAvoidBottomInset;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool showAppBarButtons;
  final List<Widget>? appBarActions;
  final bool showBottomNavigationsBar;
  const CustomScaffold({
    super.key,
    required this.body,
    required this.title,
    this.showAppBar = false,
    this.resizeToAvoidBottomInset = true,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.showAppBarButtons = false,
    this.appBarActions,
    this.showBottomNavigationsBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: showAppBar == true
          ? showAppBarButtons == true
                ? AppBar(
                    title: Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 1,
                    bottomOpacity: 1.9,
                    actions: appBarActions!,
                  )
                : AppBar(
                    title: Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 1,
                    bottomOpacity: 1.9,
                  )
          : null,
      body: body,
      bottomNavigationBar: (showBottomNavigationsBar)
          ? bottomNavigationBar
          : null,
    );
  }
}
