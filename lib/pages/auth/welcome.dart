import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grossery/core/login_page_position_top.dart';
import 'package:grossery/core/sign_up_page_position_top_r.dart';
import '../../widgets/custom_scaffold.dart';
import '../../extensions/sized_box_x.dart';
import '../../main.dart';

class Welcome extends StatelessWidget {
  final String? backgroundImage;
  final String titleText;
  final String descriptionText;
  final VoidCallback elevatedButtonOnPressed;
  final Widget elevatedButtonChild;
  final List<Widget> formWidgets;
  final String navigationText;
  final String navigationLinktitle;
  final VoidCallback navigationOnPressed;
  double positionedTop;
  Welcome({
    super.key,
    this.backgroundImage,
    required this.titleText,
    required this.descriptionText,
    required this.elevatedButtonOnPressed,
    required this.elevatedButtonChild,
    required this.formWidgets,
    required this.navigationText,
    required this.navigationLinktitle,
    required this.navigationOnPressed,
    this.positionedTop = 220,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resizeToAvoidBottomInset: false,
      showAppBar: false,
      title: 'Welcome',
      body: InkWell(
        onTap: () {
          resetContent(context);
        },
        child: Stack(
          children: [
            Container(
              height: double.infinity / 2,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    backgroundImage ?? 'assets/images/welcome_background.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ), //add background image here,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 8, right: 8),
                child: Row(
                  children: [
                    if (GlobalKey<NavigatorState>().currentState?.canPop() ??
                        true)
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Go.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    if (!(navigatorKey.currentState?.canPop() ?? false))
                      (MediaQuery.sizeOf(context).width / 4).width,
                    if (!(navigatorKey.currentState?.canPop() ?? true))
                      (MediaQuery.sizeOf(context).width / 3.5).width,
                    Text(
                      'Welcome',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: positionedTop,
              left: 0,
              right: 0,
              child: SafeArea(
                minimum: EdgeInsets.only(top: 150, left: 0, right: 0),
                top: false,
                bottom: true,
                right: false,
                left: false,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 20,
                    bottom: 40,
                  ),
                  constraints: BoxConstraints(maxWidth: 300, minHeight: 100),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xffF4F5F9), // Overlay color
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.height,
                      Text(
                        titleText,
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 3,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      5.height,
                      Text(
                        descriptionText,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Color(0xff868889),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      //"Continue with Google" button
                      20.height,
                      ...formWidgets,
                      10.height,
                      //The elevated button with gradient background
                      ElevatedButton(
                        onPressed: elevatedButtonOnPressed,

                        style: ElevatedButton.styleFrom(
                          padding: 5.onlyBottom, // حتى يغطي التدرج كامل الزر
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              strokeAlign: 300,
                            ),
                            borderRadius: BorderRadius.circular(
                              5,
                            ), // زوايا مستديرة
                          ),
                          backgroundColor:
                              Colors.transparent, // اجعل الخلفية شفافة
                          shadowColor: const Color.fromARGB(235, 249, 255, 249),
                          overlayColor: const Color.fromARGB(
                            235,
                            250,
                            250,
                            250,
                          ).withValues(
                            alpha: 50,
                            red: 50,
                            green: 50,
                            blue: 50,
                            colorSpace: ColorSpace.sRGB,
                          ), // لون التفاعل عند الضغط

                          minimumSize: Size(double.infinity, 50),
                        ),
                        //Applying gradient to button
                        child: Ink(
                          height: 50,
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
                              maxHeight: 50,
                            ), // حجم افتراضي
                            child: elevatedButtonChild,
                          ),
                        ),
                      ),

                      ///"already have an account? Login" text button
                      /// Positioned at the center bottom of the screen
                      1.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            navigationText,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Color(0xff868889),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle navigation here
                              navigationOnPressed();
                            },
                            child: Text(
                              navigationLinktitle, //navigation link title
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void resetContent(BuildContext context) {
    // Dismiss the keyboard when tapping outside of input fields
    FocusScope.of(context).unfocus();
    loginPagePositionTopR = 8.0;
    signUpPagePositionTopR = 8.9;
  }
}
