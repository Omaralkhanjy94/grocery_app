import "../core/packages_manager/ui_imports.dart";

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final bool showAppBar;
  final bool resizeToAvoidBottomInset;
  final Widget? bottomNavigationBar;
  const CustomScaffold({
    super.key,
    required this.body,
    required this.title,
    this.showAppBar = false,
    this.resizeToAvoidBottomInset = true,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    if (showAppBar == true && resizeToAvoidBottomInset == true) {
      if (bottomNavigationBar != null) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 1,
            bottomOpacity: 1.9,
          ),
          body: body,
          bottomNavigationBar: bottomNavigationBar,
        );
      } else {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 1,
            bottomOpacity: 1.9,
          ),
          body: body,
        );
      }
    } else if (showAppBar == false && resizeToAvoidBottomInset == true) {
      if (bottomNavigationBar != null) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
        );
      } else {
        return Scaffold(resizeToAvoidBottomInset: true, body: body);
      }
    } else if (showAppBar == false && resizeToAvoidBottomInset == false) {
      if (bottomNavigationBar != null) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
        );
      } else {
        return Scaffold(resizeToAvoidBottomInset: false, body: body);
      }
    } else {
      if (bottomNavigationBar != null) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 1,
            bottomOpacity: 1.9,
          ),
          body: body,
          bottomNavigationBar: bottomNavigationBar,
        );
      } else {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 1,
            bottomOpacity: 1.9,
          ),
          body: body,
        );
      }
    }
  }
}
