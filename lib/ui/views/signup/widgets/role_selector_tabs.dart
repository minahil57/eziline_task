import 'package:eziline_task/ui/common/app_colors.dart';
import 'package:eziline_task/ui/common/ui_helpers.dart';
import 'package:eziline_task/ui/views/signup/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RoleSelector extends ViewModelWidget<SignupViewModel> {
  const RoleSelector({super.key});

  @override
  Widget build(BuildContext context, SignupViewModel viewModel) {
    return Container(
      height: screenHeight(context) * 0.08,
      decoration: BoxDecoration(
        color: kcPrimaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => viewModel.handleSignUpAs(0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: viewModel.selectedSignUpAs == 'user'
                      ? kcPrimaryColorDark
                      : Colors.transparent,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: kcWhiteColor,
                    ),
                    SizedBox(height: 3),
                    Text(
                      'User',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kcWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () => viewModel.handleSignUpAs(1),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 2,
                      color: kcWhiteColor.withOpacity(0.2),
                    ),
                    left: BorderSide(
                      width: 2,
                      color: kcWhiteColor.withOpacity(0.2),
                    ),
                  ),
                  color: viewModel.selectedSignUpAs == 'manager'
                      ? kcPrimaryColorDark
                      : Colors.transparent,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_library_rounded,
                      color: kcWhiteColor,
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Manager',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kcWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => viewModel.handleSignUpAs(2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: viewModel.selectedSignUpAs == 'admin'
                      ? kcPrimaryColorDark
                      : Colors.transparent,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.admin_panel_settings_rounded,
                      color: kcWhiteColor,
                    ),
                    verticalSpaceTiny,
                    Text(
                      'Admin',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kcWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
