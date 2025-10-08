import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../extensions/customization_string.dart';

class CoverWidget extends StatelessWidget {
  final String imagePath;
  final String offerText;
  const CoverWidget({super.key, required this.imagePath, required this.offerText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/home_screen_cover.jpg',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Align(
        alignment: Alignment(-0.5, 0.3), // left center
        child: Text(
          '20% OFF on your first purchase'.addNewLine(
            maxLength: 15,
          ),
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}