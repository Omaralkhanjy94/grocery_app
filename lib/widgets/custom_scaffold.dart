import "../core/packages_manager/ui_imports.dart";

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final bool showAppBar;
  final bool resizeToAvoidBottomInset;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  const CustomScaffold({
    super.key,
    required this.body,
    required this.title,
    this.showAppBar = false,
    this.resizeToAvoidBottomInset = true,
    this.bottomNavigationBar,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: showAppBar == true
          ? AppBar(
              title: Text(title),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 1,
              bottomOpacity: 1.9,
            )
          : null,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
