import 'package:eziline_task/ui/common/app_colors.dart';
import 'package:eziline_task/ui/common/ui_helpers.dart';
import 'package:eziline_task/ui/views/login/widgets/form.dart';
import 'package:eziline_task/ui/widgets/common/rounded_elevated_button/rounded_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: kcBackgroundColor,
          body: Stack(children: [
            Container(
              height: screenHeight(context),
              width: screenWidth(context),
              decoration: const BoxDecoration(
                color: kcBackgroundColor,
              ),
            ),
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
                      Text('Login',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: kcWhiteColor,
                            fontWeight: FontWeight.w900,
                          )),
                      RoundedElevatedButton(
                        onPressed: viewModel.toSignUp,
                        buttonText: 'Sign up',
                        width: 80.dg,
                        height: 14.dg,
                        textFontSize: getResponsiveLargeFontSize(context),
                        isEnabled: true,
                      )
                    ],
                  ),
                  verticalSpaceLarge,
                  Text(
                    'Welcome Back ',
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: kcWhiteColor,
                        fontWeight: FontWeight.w700),
                  ),
                  verticalSpaceSmall,
                  Text(
                    'Login Here',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: kcWhiteColor,
                        fontWeight: FontWeight.w400),
                  ),
                  verticalSpaceLarge,
                  const FormLoginView(),
                  verticalSpaceLarge,
                ]),
              ),
            )),
          ])),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
