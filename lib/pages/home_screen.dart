import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Home',
      body: Center(
        child: Text(
          'Welcome to the Home Screen!',
          style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
