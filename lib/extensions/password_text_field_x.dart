//Converting password text field to an extension for reusability
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grossery/core/login_page_position_top.dart';
import 'package:grossery/core/sign_up_page_position_top_r.dart';
import 'package:grossery/extensions/change_content_position.dart';

class PasswordTextFieldX extends StatefulWidget {
  final String hintText;
  final VoidCallback? onPressed;
  final Widget? suffixIcon;
  bool isPasswordVisible;
  final TextEditingController passwordController;
  PasswordTextFieldX({
    super.key,
    required this.hintText,
    this.onPressed,
    this.suffixIcon,
    this.isPasswordVisible = false,
    required this.passwordController,
  });

  @override
  State<PasswordTextFieldX> createState() => PasswordTextFieldState();
}

class PasswordTextFieldState extends State<PasswordTextFieldX> {
  /// Controller for the password text field
  TextEditingController get passwordController => widget.passwordController;

  /// Indicates whether the password is visible or obscured
  bool get isPasswordVisible => widget.isPasswordVisible;

  /// Sets the visibility of the password text
  set isPasswordVisible(bool value) {
    widget.isPasswordVisible = value;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (text) {
        resetContent(context);
      },
      onTap: () {
        context.switchPosition();
      },
      controller: passwordController,
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        // Display dots instead of the actual hint text for obscured password
        hintText: widget.hintText,
        hintStyle: GoogleFonts.poppins(fontSize: 14, color: Color(0xFF868889)),
        prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[600]),
        suffixIcon: widget.suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 12.0,
        ),
      ),
    );

    /// Converts the password hint text to dots for obscured display
  }

  void resetContent(BuildContext context) {
    // Dismiss the keyboard when tapping outside of input fields
    FocusScope.of(context).unfocus();
    loginPagePositionTopR = 8.0;
    signUpPagePositionTopR = 8.9;
  }

  String convertHintTextToDots(String hintText) {
    return '•' * hintText.length;
  }
}
