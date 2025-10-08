import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/login_page_position_top.dart';
import '../../core/sign_up_page_position_top_r.dart';
import 'change_content_position.dart';

/// Converting email text field to an extension for reusability
extension EmailTextFieldX on String {
  /// Returns a styled email TextField widget
  Widget emailTextField(
    BuildContext context,
    TextEditingController emailController,
  ) {
    return TextField(
      onTap: () {
        context.switchPosition();
      },
      onSubmitted: (text) {
        resetContent(context);
      },
      controller: emailController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: this,
        hintStyle: GoogleFonts.poppins(fontSize: 14, color: Color(0xFF868889)),
        prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
      keyboardType: TextInputType.emailAddress,
      style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
    );
  }

  /// Resets the content position and dismisses the keyboard
  void resetContent(BuildContext context) {
    // Dismiss the keyboard when tapping outside of input fields
    FocusScope.of(context).unfocus();
    loginPagePositionTopR = 8.0;
    signUpPagePositionTopR = 8.9;
  }
}
