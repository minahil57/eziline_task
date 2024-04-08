import 'package:eziline_task/ui/common/ui_helpers.dart';
import 'package:eziline_task/ui/views/login/login_viewmodel.dart';
import 'package:eziline_task/ui/widgets/common/rounded_elevated_button/rounded_elevated_button.dart';
import 'package:eziline_task/ui/widgets/common/rounded_transparet_textfield/rounded_transparet_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class FormLoginView extends ViewModelWidget<LoginViewModel> {
  const FormLoginView({super.key});

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        children: [
          RoundedTransparetTextfield(
            obscureText: false,
            controller: viewModel.emailController,
            labelText: 'Email',
            validator: viewModel.validateEmail,
            keyboardType: TextInputType.emailAddress,
          ),
          verticalSpaceSmall,
          verticalSpaceTiny,
          RoundedTransparetTextfield(
            controller: viewModel.passwordController,
            labelText: 'Password',
            keyboardType: TextInputType.visiblePassword,
            obscureText: !viewModel.showPassword,
            suffixIcon: true,
            validator: viewModel.validatePassword,
            onVisibilityToggle: () {
              viewModel.passwordVisibility();
            },
          ),
          verticalSpaceSmall,
          verticalSpaceTiny,
          verticalSpaceSmall,
          verticalSpaceTiny,
          RoundedElevatedButton(
            onPressed: viewModel.login,
            buttonText: 'Login',
            width: 144.dg,
            height: 40.dg,
            textFontSize: 18.sp,
            isEnabled: viewModel.isLoginButtonEnabled(),
          ),
        ],
      ),
    );
  }
}
