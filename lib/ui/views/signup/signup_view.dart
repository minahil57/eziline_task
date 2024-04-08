import 'package:eziline_task/ui/common/app_colors.dart';
import 'package:eziline_task/ui/common/ui_helpers.dart';
import 'package:eziline_task/ui/views/signup/widgets/form.dart';
import 'package:eziline_task/ui/views/signup/widgets/role_selector_tabs.dart';
import 'package:eziline_task/ui/widgets/common/rounded_elevated_button/rounded_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Stack(children: [
            Container(
                decoration: const BoxDecoration(
              color: kcBackgroundColor,
            )),
            Positioned.fill(
                child: Container(
              height: screenHeight(context),
              width: screenWidth(context),
              decoration: const BoxDecoration(
                color: kcBackgroundColor,
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 35.0.dg, left: 20.dg, right: 20.dg),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sign Up',
                          style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w900,
                              color: kcWhiteColor)),
                      RoundedElevatedButton(
                        width: 80.w,
                        height: 14.h,

                        onPressed: viewModel.toLogin,
                        buttonText: 'Login',
                        isEnabled: true,
                        borderRadius: 20,
                        borderWidth: 1,
                        textFontSize: 12.sp,
                        textColor: kcPrimaryColor,
                        textFontWeight: FontWeight.w700,
                        // other optional parameters can be provided here
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  verticalSpaceSmall,
                  Text(
                    'Let\'s Create Your Account ',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: kcWhiteColor),
                  ),
                  verticalSpaceSmall,
                  Text(
                    'Sign up as',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: kcWhiteColor),
                  ),
                  verticalSpaceMedium,
                  const RoleSelector(),
                  verticalSpaceLarge,
                  const FormSignUpScreen(),
                ]),
              ),
            )),
          ])),
    );
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
