import 'package:flutter/material.dart';
import '../../extensions/change_content_position.dart';
import '../../extensions/email_text_field_x.dart';

extension PhoneNumberX on String {
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
        hintStyle: TextStyle(color: Color(0xFF868889), fontSize: 14),
        prefixIcon: Icon(Icons.phone_outlined, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
      keyboardType: TextInputType.phone,
      style: TextStyle(fontSize: 15, color: Colors.black),
    );
  }
}
