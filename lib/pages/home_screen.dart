import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:grocery_app/widgets/category_widget.dart';
import '../../extensions/customization_string.dart';
import '../../extensions/sized_box_x.dart';
import '../../widgets/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Home',
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              //todo: Search Bar
              SearchBar(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                ),
                //Let the search bar background color from F4F5F9 to 868889
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.focused)) {
                    return const Color(0xff868889);
                  }
                  return const Color(0xffF4F5F9);
                }),
                leading: Icon(Icons.search, color: Color(0xff868889)),
                trailing: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.tune, color: Color(0xff868889)),
                  ),
                ],
                hintText: 'Search Keywords..',
                hintStyle: WidgetStateProperty.resolveWith((states) {
                  return TextStyle(
                    color: states.contains(WidgetState.focused)
                        ? Colors.white
                        : Color(0xff868889),
                  );
                }),
                onChanged: (value) {
                  // Handle search input change
                },
              ),
              10.height,
              //todo: cover image
              // a text over the image that says "20% OFF on your first purchase"
              Container(
                width: double.infinity,
                height: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/home_screen_cover.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Align(
                  alignment: Alignment(-0.5, 0.3), // left center
                  child: Text(
                    '20% OFF on your first purchase'.addNewLine(maxLength: 15),
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              //todo: categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories",style: GoogleFonts.poppins(
                    fontSize: 18,fontWeight: FontWeight.w700
                  ),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_right))
                ],
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 5,
                  children: [
                    //todo: create a list includes all categories
                    for(int i=0; i< 10; i++)
                      CategoryWidget(
                          circleColor: Color(0xffE6F2EA),
                          image: "assets/images/vegetables_icon.png",
                          title: "Vegetables"
                      )
                  ],
                ),
              )
              //todo: featured products
            ],
          ),
        ),
      ),
    );
  }
}
