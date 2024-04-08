import 'package:eziline_task/ui/common/ui_helpers.dart';
import 'package:eziline_task/ui/views/signup/signup_viewmodel.dart';
import 'package:eziline_task/ui/widgets/common/rounded_elevated_button/rounded_elevated_button.dart';
import 'package:eziline_task/ui/widgets/common/rounded_transparet_textfield/rounded_transparet_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class FormSignUpScreen extends ViewModelWidget<SignupViewModel> {
  const FormSignUpScreen({super.key});

  @override
  Widget build(BuildContext context, SignupViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        children: [
          RoundedTransparetTextfield(
            labelText: 'Name',
            obscureText: false,
            controller: viewModel.textController,
            validator: (p0) => viewModel.validateName(p0),
          ),
          verticalSpaceSmall,
          verticalSpaceTiny,
          RoundedTransparetTextfield(
            controller: viewModel.emailController,
            labelText: 'Email',
            validator: viewModel.validateEmail,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
          ),
          verticalSpaceSmall,
          verticalSpaceTiny,
          RoundedTransparetTextfield(
            controller: viewModel.passwordController,
            labelText: 'Password',
            obscureText: !viewModel.showPassword,
            suffixIcon: true,
            isPasswordVisible: viewModel.showPassword,
            onVisibilityToggle: viewModel.passwordVisibility,
            validator: viewModel.validatePassword,
          ),
          verticalSpaceMedium,
          verticalSpaceSmall,
          RoundedElevatedButton(
            textFontSize: 12.sp,
            width: 240.w,
            height: 40.h,
            borderRadius: 30,
            isEnabled: viewModel.isSignupButtonEnabled(),
            onPressed: viewModel.signup,
            buttonText: 'Create Account',
            // other optional parameters can be provided here
          ),
        ],
      ),
    );
  }
}
