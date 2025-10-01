import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../extensions/sized_box_x.dart';

class CustomSplashScreen extends StatelessWidget {
  final String? pageTitle;
  final Widget? title1;
  final Widget? title2;
  final String? description;
  final String? imagePath;
  final int? currentIndex;
  const CustomSplashScreen({
    super.key,
    this.title1,
    this.title2,
    this.description,
    this.imagePath,
    this.currentIndex,
    this.pageTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: 8.paddingAll,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath!),
          fit: BoxFit.cover,
        ),
      ), //add background image here,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          40.height,
          title1!,
          title2!,

          /// const SizedBox(height: 10),
          10.height,

          ///description text
          Text(
            description!,
            style: GoogleFonts.poppins(fontSize: 12, color: Color(0xff868889)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
