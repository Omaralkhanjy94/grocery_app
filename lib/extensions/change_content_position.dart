// import '../../core/login_page_position_top.dart';
// import '../../core/sign_up_page_position_top_r.dart';
import '../core/packages_manager/extensions_imports.dart'
    show loginPagePositionTopR, signUpPagePositionTopR;

extension ChangeContentPosition on void {
  void switchPosition() {
    if (loginPagePositionTopR == 8.0) {
      loginPagePositionTopR = 15.0;
    } else {
      loginPagePositionTopR = 8.0;
    }
    if (signUpPagePositionTopR == 8.9) {
      signUpPagePositionTopR = 32.9;
    } else {
      signUpPagePositionTopR = 8.9;
    }
  }
}
