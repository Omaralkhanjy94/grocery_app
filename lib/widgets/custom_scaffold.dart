import "package:flutter/material.dart";

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final bool showAppBar;
  final bool resizeToAvoidBottomInset;
  const CustomScaffold({
    super.key,
    required this.body,
    required this.title,
    this.showAppBar = false,
    this.resizeToAvoidBottomInset = true,
  });

  @override
  Widget build(BuildContext context) {
    if (showAppBar == true && resizeToAvoidBottomInset == true) {
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
    } else if (showAppBar == false && resizeToAvoidBottomInset == true) {
      return Scaffold(resizeToAvoidBottomInset: true, body: body);
    } else if (showAppBar == false && resizeToAvoidBottomInset == false) {
      return Scaffold(resizeToAvoidBottomInset: false, body: body);
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
