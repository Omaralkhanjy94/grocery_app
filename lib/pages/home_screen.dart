import 'package:flutter/material.dart';
import '../../extensions/sized_box_x.dart';
// import 'package:google_fonts/google_fonts.dart';
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
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/home_screen_cover.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.3),
                  ),
                  child: Center(
                    child: Text(
                      '20% OFF on your first purchase',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              //todo: categories
              //todo: featured products
            ],
          ),
        ),
      ),
    );
  }
}
