//When the user forgets their password, he can use this screen to reset it
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:short_navigation/short_navigation.dart' show Go;
import '../../extensions/email_text_field_x.dart';
import '../../extensions/spaces_x.dart';
import '../../widgets/custom_scaffold.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  /// Email TextEditingController
  final TextEditingController emailController = TextEditingController();

  /// Form key to manage form state
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppBar: true,
      title: 'Password Recovery',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //"Forgot Password" title
              Text(
                'Forgot Password',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              5.height, // Add some vertical spacing
              Text(
                'Enter your email to reset your password',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              20.height, // Add some vertical spacing
              "Email Address".emailTextField(context, emailController),
              10.height, // Add some vertical spacing
              // Reset Password button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _resetPassword,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
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
                        maxHeight: 50,
                      ), // حجم افتراضي
                      child:
                          _isLoading
                              ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              )
                              : Text(
                                'Send link',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        if (kDebugMode) {
          print(
            "Attempting to send password reset email to: ${emailController.text.trim()}",
          );
        }
        await sendPasswordResetEmail(email: emailController.text.trim());
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Reset link sent to your email')),
          );
          // Navigator.of(context).pop();
          Go.back();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  /// Simulating sending a password reset email
  Future<void> sendPasswordResetEmail({required String email}) {
    if (email.isEmpty || !email.contains('@')) {
      throw Exception('Invalid email address');
    }
    if (kDebugMode) {
      print('Sending password reset email to $email');
    }
    return Future.delayed(const Duration(seconds: 2));
  }
}
