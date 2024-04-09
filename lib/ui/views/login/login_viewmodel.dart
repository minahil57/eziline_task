import 'package:eziline_task/app/app.locator.dart';
import 'package:eziline_task/app/app.router.dart';
import 'package:eziline_task/services/auth_service.dart';
import 'package:eziline_task/services/user_service.dart';
import 'package:eziline_task/ui/user_Details.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _userService = locator<UserService>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  final _navigationService = locator<NavigationService>();
  bool showPassword = false;
  bool isLoginButtonEnabled() {
    // Add your conditions to enable/disable the login button
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an email address';
    }

    // Use a regular expression for basic email validation
    RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(value)
        ? null
        : 'Please enter a valid email address';
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }

    // Password should be at least 8 characters long
    return value.length >= 8
        ? null
        : 'Password must be at least 8 characters long';
  }

  void login() async {
    if (formKey.currentState?.validate() ?? false) {
      bool success = await AuthService.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (success) {
       userDetails = await _userService.getUserDetails();
        _navigationService.replaceWithHomeView();

      }
    } else {
      _navigationService.replaceWithLoginView();
    }
  }

  void passwordVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void toSignUp() {
    _navigationService.replaceWithSignupView();
  }
}
