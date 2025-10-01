import 'package:grossery/core/login_page_position_top.dart';
import 'package:grossery/core/sign_up_page_position_top_r.dart';

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
