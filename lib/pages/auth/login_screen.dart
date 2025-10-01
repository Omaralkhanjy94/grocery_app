import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grossery/core/login_page_position_top.dart';
import 'package:grossery/pages/auth/welcome.dart';
import 'package:grossery/extensions/email_text_field_x.dart';
import 'package:grossery/extensions/password_text_field_x.dart';
import 'package:grossery/pages/home_screen.dart';
import '../../extensions/sized_box_x.dart';
import '../../go.dart';
import 'forgot_password_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ///Email TextEditingController
  final TextEditingController emailController = TextEditingController();

  ///Password TextEditingController
  final TextEditingController passwordController = TextEditingController();

  ///The Background image for the Login screen
  final String? backgroundImage = 'assets/images/login_screen_background.jpg';

  ///The title text for the login screen
  final String titleText = 'Welcome back!';

  ///The description text for the login screen
  final String descriptionText = 'Sign in to your account';

  //The child widget for the elevated button is "create an account" with person icon image
  final Widget elevatedButtonChild = Container(
    alignment: Alignment.center,
    child: Text(
      'Login',
      style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
    ),
  );

  ///The navigation text and link title for the login screen
  final String navigationText = 'Don\'t have an account?';

  ///The navigation link title for the login screen
  final String navigationLinktitle = 'Sign Up';

  ///To manage the state of the "Remember me" checkbox
  bool _isChecked = false;

  ///To manage the state of the password visibility
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Welcome(
      positionedTop:
          MediaQuery.of(context).size.height * 2 / loginPagePositionTopR,
      titleText: titleText,
      backgroundImage: backgroundImage,
      elevatedButtonChild: elevatedButtonChild,
      elevatedButtonOnPressed: () {
        //todo: Handle home screen if login is successful
        // Navigator.pushNamed(context, '/home');
        // Using Go class for navigation
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      },
      descriptionText: descriptionText,
      formWidgets: [
        //Login form fields
        //Email TextField with email hint text and icon
        "Email address".emailTextField(context, emailController),
        5.height,
        //Password TextField with lock icon and hint text
        PasswordTextFieldX(
          passwordController: passwordController,
          isPasswordVisible: isPasswordVisible,
          hintText: "Password",
          onPressed: () {
            // Handle password visibility toggle if needed
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Colors.grey[600],
            ),
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
          ),
        ),
        5.height,
        //Remember me checkbox and forgot password row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Checkbox and forgot password row
            InkWell(
              onTap: () {
                setState(() {
                  _isChecked = !_isChecked;
                });
              },
              child: Row(
                children: [
                  Container(
                    height: 20,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Color(0xff868889),
                        strokeAlign: BorderSide.strokeAlignOutside,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment:
                          _isChecked
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Color(0xff868889),
                              width: 2,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.width,
                  Text(
                    'Remember me',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Color(0xff868889),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle forgot password navigation here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordScreen(),
                  ),
                );
              },
              child: Text(
                'Forgot Password?',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
      navigationText: navigationText,
      navigationLinktitle: navigationLinktitle,
      navigationOnPressed: () {
        // Handle sign up navigation here
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignupScreen()),
        );
      },
    );
  }
}
