import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_splash_screen.dart';
import '../extensions/spaces_x.dart';

import '../widgets/custom_scaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

int currentIndexNow = 0;

class _SplashScreenState extends State<SplashScreen> {
  /// to control pageview
  final PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 1.0,
  );
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Splash Screen',
      body: Stack(
        children: [
          PageView(
            onPageChanged: (int index) {
              setState(() {
                currentIndexNow = index;
              });
            },
            controller: pageController,
            scrollDirection: Axis.horizontal,
            children: [
              splashScreens[0],
              splashScreens[1],
              splashScreens[2],
              splashScreens[3],
            ],
          ),
          //indicator dots
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              // padding: const EdgeInsets.only(bottom: 100.0),
              padding: 100.paddingOnly.copyWith(bottom: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color:
                          currentIndexNow == index
                              ? Color(0xff6CC51D)
                              : Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                }),
              ),
            ),
          ),
          // Get Started button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: 8.0.paddingAll,
              child: ElevatedButton(
                onPressed: () {
                  // هنا منطق الضغط
                  navigateToNextScreen(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: 0.paddingAll, // حتى يغطي التدرج كامل الزر
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // زوايا مستديرة
                  ),
                  backgroundColor: Colors.transparent, // اجعل الخلفية شفافة
                  shadowColor:
                      Colors.transparent, // حتى لا يختلط ظل الزر مع التدرج
                ),
                //Applying gradient to button
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xffAEDC81), Color(0xff6CC51D)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      minWidth: 100,
                      maxWidth: 380,
                      minHeight: 47,
                      maxHeight: 60,
                    ), // حجم افتراضي
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      //making slide show with splashscreen1,2,3
    );
  }

  //List of splash screens
  List<Widget> splashScreens = [
    SplashScreen1(),
    SplashScreen2(),
    SplashScreen3(),
    SplashScreen4(),
  ];
}

void navigateToNextScreen(BuildContext context) {
  Navigator.pushReplacementNamed(context, '/welcome');
}

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    currentIndexNow = 0;
    return //splashscreen1
    CustomSplashScreen(
      pageTitle: "splashscreen1",
      title1: Text("Welcome to", style: GoogleFonts.poppins(fontSize: 25)),
      title2: Image.asset(
        "assets/images/bigCart1.png",
        width: 127,
        height: 50,
      ), //big cart image
      description:
          "Lorem ipsum dolor sit amet, consetetur"
          "\nsadipscing elitr, sed diam nonumy",
      imagePath: 'assets/images/b1.jpg',
      currentIndex: 0,
    );
  }
}

class SplashScreen2 extends StatelessWidget {
  SplashScreen2({super.key});

  final String pageTitle = "splashscreen2";
  final Widget title1 = Text(
    "Buy Quality",
    style: GoogleFonts.poppins(fontSize: 25),
  );
  final Widget title2 = Text(
    "Dairy Products",
    style: GoogleFonts.poppins(fontSize: 25),
  );
  final String description =
      "Lorem ipsum dolor sit amet, consetetur"
      "\nsadipscing elitr, sed diam nonumy";
  final String imagePath = 'assets/images/b2.jpg';
  final int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    currentIndexNow = 1;
    return //splashscreen2
    //splashscreen2
    CustomSplashScreen(
      pageTitle: "splashscreen2",
      title1: Text("Buy Quality", style: GoogleFonts.poppins(fontSize: 25)),
      title2: Text("Dairy Products", style: GoogleFonts.poppins(fontSize: 25)),
      description:
          "Lorem ipsum dolor sit amet, consetetur"
          "\nsadipscing elitr, sed diam nonumy",
      imagePath: 'assets/images/b2.jpg',
      currentIndex: 1,
    );
  }
}

class SplashScreen3 extends StatelessWidget {
  const SplashScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    currentIndexNow = 2;
    return //splashscreen3
    CustomSplashScreen(
      pageTitle: "splashscreen3",
      title1: Text("Buy Premium", style: GoogleFonts.poppins(fontSize: 25)),
      title2: Text("Quality Fruits", style: GoogleFonts.poppins(fontSize: 25)),
      description:
          "Lorem ipsum dolor sit amet, consetetur"
          "\nsadipscing elitr, sed diam nonumy",
      imagePath: 'assets/images/b3.jpg',
      currentIndex: 2,
    );
  }
}

class SplashScreen4 extends StatelessWidget {
  const SplashScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return //splashscreen4
    CustomSplashScreen(
      pageTitle: "splashscreen4",
      title1: Text("Get Discounts", style: GoogleFonts.poppins(fontSize: 25)),
      title2: Text("On All Products", style: GoogleFonts.poppins(fontSize: 25)),
      description:
          "Lorem ipsum dolor sit amet, consetetur"
          "\nsadipscing elitr, sed diam nonumy",
      imagePath: 'assets/images/b4.jpg',
      currentIndex: 3,
    );
  }
}
