import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryWidget extends StatelessWidget {
  final Color circleColor;
  final String image;
  final String title;
  const CategoryWidget({
    super.key,
    required this.circleColor,
    required this.image,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Column(
        spacing: 5,
        children: [
          CircleAvatar(
            radius: 52/2,
            backgroundColor: circleColor,
            child: Image.asset(image,height: 25,width: 25,),
          ),
          Text(title,style: GoogleFonts.poppins(
              fontSize: 12, color: Color(0xff868889)
          ),)
        ],
      ),
    );
  }
}
