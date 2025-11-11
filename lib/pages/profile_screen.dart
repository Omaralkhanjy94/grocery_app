import '../core/packages_manager/ui_imports.dart';
import '../core/packages_manager/extensions_imports.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBottomNavigationsBar: true,
      bottomNavigationBar: bottomNavigationsBar,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 4,
                child: Container(
                  height: MediaQuery.heightOf(context),
                  color: secondaryColor,
                ),
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              50.height,
              UserInfoWidget(),

              Flexible(
                flex: 2,
                child: Container(
                  height: MediaQuery.heightOf(context) - 300,
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.heightOf(context) - 100,
                  ),
                  child: Center(child: ProfileOptionsList()),
                ),
              ),
            ],
          ),
        ],
      ),
      title: "Profile",
    );
  }

  Widget get bottomNavigationsBar {
    return CustomBottomNavigationsBar();
  }
}
