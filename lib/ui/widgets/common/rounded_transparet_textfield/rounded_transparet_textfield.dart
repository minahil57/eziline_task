import 'package:eziline_task/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'rounded_transparet_textfield_model.dart';

class RoundedTransparetTextfield
    extends StackedView<RoundedTransparetTextfieldModel> {
  final TextEditingController? controller;
  final String labelText;
  final bool obscureText;
  final bool? suffixIcon;
  final bool? prefixIcon;
  final Icon? suffixIconData;
  final Icon? prefixIconData;
  final bool? isPasswordVisible;
  final double? borderRadius;
  final Color? fillColor;
  final Color? textColor;
  final Function(String)? onChanged;
  final Function()? onVisibilityToggle;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  const RoundedTransparetTextfield({
    super.key,
    this.controller,
    required this.labelText,
    required this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconData,
    this.prefixIconData,
    this.isPasswordVisible,
    this.borderRadius,
    this.fillColor,
    this.textColor,
    this.onChanged,
    this.onVisibilityToggle,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget builder(
    BuildContext context,
    RoundedTransparetTextfieldModel viewModel,
    Widget? child,
  ) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      controller: controller,
      validator: validator,
      style: TextStyle(fontSize: 12.sp, color: textColor ?? kcWhiteColor),
      decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ?? kcVeryLightGrey.withOpacity(0.2),
          labelStyle:
              TextStyle(fontSize: 14.sp, color: textColor ?? kcWhiteColor),
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25.0.r),
            borderSide: BorderSide(color: kcWhiteColor.withOpacity(0.2)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25.0.r),
            borderSide: BorderSide(color: kcWhiteColor.withOpacity(0.2)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25.0.r),
            borderSide: BorderSide(
                color: kcWhiteColor.withOpacity(0.2)), // Unfocused border color
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25.0.r),
            borderSide: const BorderSide(
              color: kcErrorColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25.0.r),
            borderSide: const BorderSide(
              color: kcErrorColor,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          prefix: prefixIconData,
          suffix: suffixIconData,
          suffixIcon: suffixIcon == true
              ? GestureDetector(
                  onTap: onVisibilityToggle,
                  child: Icon(
                    isPasswordVisible == true
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: textColor ?? kcWhiteColor,
                  ))
              : null),
    );
  }

  @override
  RoundedTransparetTextfieldModel viewModelBuilder(
    BuildContext context,
  ) =>
      RoundedTransparetTextfieldModel();
}
