import 'package:flutter/material.dart';
import 'package:grocery_app/core/packages_manager/network_imports.dart'
    show Go, Cubit;

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    try {
      // Simulate a sign-up process
      await Future.delayed(Duration(seconds: 2));
      if (email.isEmpty || !email.contains('@')) {
        throw Exception("Sign up failed");
      }
      emit(AuthSuccess(message: "Sign up successful with email: $email."));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  /// Simulated login method
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      // Simulate a login process
      await Future.delayed(Duration(seconds: 2));
      if (email.isEmpty || !email.contains('@')) {
        throw Exception("Login failed");
      }
      if (password.isEmpty || password.length < 6) {
        throw Exception("Password must be at least 6 characters long");
      }
      emit(AuthSuccess(message: "Login successful with email: $email."));
      // Navigate to home screen on successful login
      Go.toReplaceName("/home");
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  /// Simulated logout method
  Future<void> logout() async {
    emit(AuthLoading());
    try {
      // Simulate a logout process
      await Future.delayed(Duration(seconds: 2));
      emit(AuthSuccess(message: "Logout successful."));
      // Navigate to login screen on successful logout
      Go.toReplaceName("/login");
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  /// Simulated password reset method
  Future<void> resetPassword(String email) async {
    emit(AuthLoading());
    try {
      // Simulate a password reset process
      await Future.delayed(Duration(seconds: 2));
      if (email.isEmpty || !email.contains('@')) {
        throw Exception("Password reset failed");
      }
      emit(
        AuthSuccess(message: "Password reset successful for email: $email."),
      );
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
