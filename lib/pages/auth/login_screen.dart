import 'package:flutter/foundation.dart';
import '../../core/packages_manager/ui_imports.dart';
import '../../core/packages_manager/extensions_imports.dart';
import '../../core/packages_manager/network_imports.dart';
import '../../core/packages_manager/data_imports.dart';
import '../../core/packages_manager/state_imports.dart';

/// A StatelessWidget for the Login Screen
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

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

  ///The navigation link title for the sign up screen
  final String navigationLinktitle = 'Sign Up';

  @override
  Widget build(BuildContext context) {
    return Welcome(
      positionedTop:
          // MediaQuery.of(context).size.height * 2 / loginPagePositionTopR,
          context.watch<LoginFormPositionCubit>().state
              is LoginFormPositionUpdated
          ? (context.watch<LoginFormPositionCubit>().state
                    as LoginFormPositionUpdated)
                .topPosition
          : MediaQuery.of(context).size.height * 2 / loginPagePositionTopR,
      titleText: titleText,
      backgroundImage: backgroundImage,
      elevatedButtonChild: elevatedButtonChild,
      elevatedButtonOnPressed: () async {
        if (kDebugMode) {
          print(
            'Email: ${emailController.text.trim()}, Password: ${passwordController.text}',
          );
        }

        // Simulate a login process
        // Using AuthCubit to handle login
        BlocProvider.of<AuthCubit>(
          context,
        ).login(emailController.text.trim(), passwordController.text);
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
          isPasswordVisible:
              BlocProvider.of<IsPasswordVisibleCubit>(context).state
                  is IsPasswordVisible,
          hintText: "Password",
          onPressed: () {
            // Handle password visibility toggle if needed
            // setState(() {
            //   isPasswordVisible = !isPasswordVisible;
            // });
            BlocProvider.of<IsPasswordVisibleCubit>(
              context,
            ).togglePasswordVisibility();
          },
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Colors.grey[600],
            ),
            onPressed: () {
              // setState(() {
              //   isPasswordVisible = !isPasswordVisible;
              // });
              BlocProvider.of<IsPasswordVisibleCubit>(
                context,
              ).togglePasswordVisibility();
            },
          ),
        ),
        5.height,
        //Remember me checkbox and forgot password row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Checkbox for remember me
            InkWell(
              onTap: () {
                // _isChecked = !_isChecked;
                BlocProvider.of<RememberMeCubit>(context).state
                        is RememberMeUnchecked
                    ? BlocProvider.of<RememberMeCubit>(context).check()
                    : BlocProvider.of<RememberMeCubit>(context).uncheck();
                if (BlocProvider.of<RememberMeCubit>(context).state
                    is RememberMeChecked) {
                  currentUserEmail = emailController.text.trim();
                  currentUserPassword = passwordController.text;
                }
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
                          BlocProvider.of<RememberMeCubit>(context).state
                              is RememberMeChecked
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ForgotPasswordScreen(),
                //   ),
                // );
                Go.to(ForgotPasswordScreen());
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
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const SignupScreen()),
        // );
        Go.toName('/signup');
      },
    );
  }
}
