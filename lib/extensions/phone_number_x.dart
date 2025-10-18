// import 'package:flutter/material.dart';
// import '../../extensions/email_text_field_x.dart';
import "../core/packages_manager/ui_imports.dart"
    show
        EmailTextFieldX,
        Widget,
        BuildContext,
        TextEditingController,
        TextField,
        InputDecoration,
        Color,
        Colors,
        Icon,
        Icons,
        OutlineInputBorder,
        BorderRadius,
        BorderSide,
        EdgeInsets,
        TextInputType;
// import '../../extensions/change_content_position.dart';
import '../core/packages_manager/extensions_imports.dart'
    show ChangeContentPosition;
import '../core/packages_manager/network_imports.dart' show GoogleFonts;

/// Converting phone number text field to an extension for reusability
extension PhoneNumberX on String {
  /// The phone number text field widget
  Widget phoneNumberTextField(
    BuildContext context,
    TextEditingController phoneController,
  ) {
    return TextField(
      onTap: () => context.switchPosition(),
      onSubmitted: (text) => resetContent(context),
      controller: phoneController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: this,
        hintStyle: GoogleFonts.poppins(color: Color(0xFF868889), fontSize: 14),
        prefixIcon: Icon(Icons.phone_outlined, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
      keyboardType: TextInputType.phone,
      style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
    );
  }
}
