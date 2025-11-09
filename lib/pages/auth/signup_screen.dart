import 'package:flutter/foundation.dart';
import '../../core/packages_manager/ui_imports.dart';
import '../../core/packages_manager/extensions_imports.dart';
import '../../core/packages_manager/network_imports.dart';
import '../../core/packages_manager/state_imports.dart';

///Password TextEditingController
///To manage the state of the password visibility
bool isPasswordVisible = false;

/// The SignupScreen widget
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

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

  ///The navigation text displayed below the form widgets
  final String navigationText = 'Already have an account?';

  ///The navigation link title
  final String navigationLinktitle = 'Login';
  void _togglingPasswordVisibility(bool currentState, BuildContext context) {
    BlocProvider.of<IsPasswordVisibleCubit>(context).togglePasswordVisibility();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      bloc: BlocProvider.of<AuthCubit>(context),
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AuthFailure) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        } else if (state is AuthSuccess) {
          // Navigate to home or another screen on success
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Go.toReplaceName('/home');
          });
        }
        return Welcome(
          positionedTop:
              MediaQuery.of(context).size.height * 2 / signUpPagePositionTopR,
          titleText: titleText,
          backgroundImage: backgroundImage,
          elevatedButtonChild: elevatedButtonChild,
          elevatedButtonOnPressed: () async {
            if (kDebugMode) {
              print('Sign Up button pressed');
            }
            // await signUp(
            //   email: emailController.text.trim(),
            //   password: passwordController.text,
            // );
            //Using the AuthCubit to handle sign up
            BlocProvider.of<AuthCubit>(
              context,
            ).signUp(emailController.text.trim(), passwordController.text);
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
              hintText: 'Password',
              passwordController: passwordController,
              isPasswordVisible: isPasswordVisible,
              onPressed: () {
                // Toggle password visibility
                // Using setState to update the UI
                _togglingPasswordVisibility(isPasswordVisible, context);
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
                  //Let the password visibility or invisibility be managed by the Cubit
                  _togglingPasswordVisibility(isPasswordVisible, context);
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
            Go.toName('/login');
          },
        );
      },
    );
  }

  // //Signing up
  // Future<void> signUp({required String email, required String password}) async {
  //   // Handle Sign Up logic here
  //   // After successful sign up, navigate to home or another screen
  //   if (email != "" || !email.contains('@')) {
  //     if (kDebugMode) {
  //       throw Exception('Invalid email address');
  //     }
  //   } else {
  //     Go.toReplaceName('/home');
  //   }
  //   if (kDebugMode) {
  //     print('You has logged in successfully!\n the user email: $email');
  //   }
  //   return Future.delayed(const Duration(seconds: 2));
  // }
}
