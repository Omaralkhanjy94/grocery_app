import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grossery/core/sign_up_page_position_top_r.dart';
import '../home_screen.dart';
import 'login_screen.dart';
import 'welcome.dart';
import '../../extensions/email_text_field_x.dart';
import '../../extensions/password_text_field_x.dart';
import '../../extensions/phone_number_x.dart';
import '../../extensions/sized_box_x.dart';
import '../../go.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  ///Email TextEditingController
  final TextEditingController emailController = TextEditingController();

  ///Password TextEditingController
  final TextEditingController passwordController = TextEditingController();

  ///Phone number TextEditingController
  final TextEditingController phoneNumberController = TextEditingController();

  ///The Background image for the signup screen
  final String? backgroundImage = 'assets/images/signup_screen_background.jpg';

  ///The title text for the signup screen
  final String titleText = 'Create account';

  ///The description text for the signup screen
  final String descriptionText = 'Quickly create an account';

  ///The child widget for the elevated button is "Sign Up"
  final Widget elevatedButtonChild = Container(
    alignment: Alignment.center,
    child: Text(
      'Sign Up',
      style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
    ),
  );

  ///Password TextEditingController
  ///To manage the state of the password visibility
  bool isPasswordVisible = false;

  ///The navigation text displayed below the form widgets
  final String navigationText = 'Already have an account?';

  ///The navigation link title
  final String navigationLinktitle = 'Login';

  void _togglingPasswordVisibility(bool currentState) {
    setState(() {
      isPasswordVisible = !currentState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Welcome(
      positionedTop:
          MediaQuery.of(context).size.height * 2 / signUpPagePositionTopR,
      titleText: titleText,
      backgroundImage: backgroundImage,
      elevatedButtonChild: elevatedButtonChild,
      elevatedButtonOnPressed: () {
        // Handle Sign Up logic here
        if (kDebugMode) {
          print('Sign Up button pressed');
        }
        // After successful sign up, navigate to home or another screen
        // Go.toNamed('/home');
        Go.to(const HomeScreen());
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const HomeScreen()),
        // );
      },
      descriptionText: descriptionText,
      formWidgets: [
        //Sign Up form fields
        //Email TextField with email hint text and icon
        "Email address".emailTextField(context, emailController),
        5.height,
        //Phone number TextField with phone icon and hint text
        "Phone number".phoneNumberTextField(context, phoneNumberController),
        5.height,
        //Password TextField
        PasswordTextFieldX(
          passwordController: passwordController,
          isPasswordVisible: isPasswordVisible,
          hintText: 'Password',
          onPressed: () {
            // Toggle password visibility
            // Using setState to update the UI
            _togglingPasswordVisibility(isPasswordVisible);
          },
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Colors.grey[600],
            ),
            onPressed: () {
              // Toggle password visibility
              // Using setState to update the UI
              _togglingPasswordVisibility(isPasswordVisible);
            },
          ),
        ),
        10.height,
      ],
      navigationText: navigationText,
      navigationLinktitle: navigationLinktitle,
      navigationOnPressed: () {
        // Handle login navigation here
        // For example, navigate to the LoginScreen
        // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        // Or using named routes if set up
        // Navigator.pushNamed(context, '/login');
        // Using Go class for navigation
        // Go.toNamed('/login');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      },
    );
  }
}
