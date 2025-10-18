import 'package:flutter/foundation.dart';
import '../../core/packages_manager/ui_imports.dart';
import '../../core/packages_manager/extensions_imports.dart';
import '../../core/packages_manager/network_imports.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  ///The Background image for the welcome screen
  final String? backgroundImage = 'assets/images/welcome_background.jpg';

  ///The title text for the welcome screen
  final String titleText = 'Welcome';

  ///The description text for the welcome screen
  final String descriptionText =
      'Discover the best groceries at your fingertips. '
      'Start shopping now and enjoy exclusive deals!';

  ///The function to be called when the elevated button is pressed.
  ///Going to Signup screen using function
  void elevatedButtonOnPressed() {
    /// Handle Sign Up navigation here
    if (kDebugMode) {
      print('Create an account button pressed');
    }
    // Go.toNamed('/signup');
    // Navigate to SignupScreen using MaterialPageRoute to avoid route not found error
    Go.to(SignupScreen());
  }

  ///The child widget for the elevated button is "create an account" with person icon image
  final Widget elevatedButtonChild = Container(
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        30.width,
        Image.asset('assets/images/person.png', height: 20, width: 20),
        50.width,
        Text(
          'Create an account',
          style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
        ),
      ],
    ),
  );

  ///The form widgets to be displayed on the welcome screen
  final List<Widget> formWidgets = [
    ///The child widget for the elevated button is "Continue with Google" with google logo image
    ElevatedButton(
      onPressed: () {
        // Handle Google Sign-In here
      },
      style: ElevatedButton.styleFrom(
        //hide the button shadow
        elevation: 0,
        backgroundColor: Colors.white,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ), // زوايا مستديرة
        minimumSize: Size(double.infinity, 47), // عرض افتراضي
        maximumSize: Size(double.infinity, 50), // عرض افتراضي
      ),
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            10.width,
            Image.asset('assets/images/google_logo.png', height: 20, width: 20),
            50.width,
            Text(
              'Continue with Google',
              style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
            ),
          ],
        ),
      ),
    ),
  ];

  ///The navigation text and link title for the welcome screen
  final String navigationText = 'Already have an account?';

  ///The navigation link title for the welcome screen
  final String navigationLinktitle = 'Login';

  @override
  Widget build(BuildContext context) {
    //Using the Welcome widget to build the welcome screen
    return Welcome(
      positionedTop: MediaQuery.of(context).size.height * 2 / 5.9,
      titleText: titleText,
      backgroundImage: backgroundImage,
      elevatedButtonChild: elevatedButtonChild,
      elevatedButtonOnPressed: () {
        // elevatedButtonOnPressed();
        /// Handle Sign Up navigation here
        /// For example, navigate to the SignUpScreen
        /// Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
        /// Or using named routes if set up
        /// Navigator.pushNamed(context, '/signup');
        /// Using Go class for navigation
        if (kDebugMode) {
          print('Create an account button pressed');
        }
        Go.toName('/signup');
        // Navigate to SignupScreen using MaterialPageRoute to avoid route not found error
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const SignupScreen()),
        // );
      },
      descriptionText: descriptionText,
      formWidgets: formWidgets,
      navigationText: navigationText,
      navigationLinktitle: navigationLinktitle,
      navigationOnPressed: () {
        // Handle login navigation here
        // For example, navigate to the LoginScreen
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => LoginScreen()),
        // );
        Go.toName('/login');
      },
    );
  }
}
