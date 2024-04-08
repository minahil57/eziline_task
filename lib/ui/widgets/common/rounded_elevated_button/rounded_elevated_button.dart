import 'package:eziline_task/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'rounded_elevated_button_model.dart';

class RoundedElevatedButton extends StackedView<RoundedElevatedButtonModel> {
  final VoidCallback onPressed;
  final String buttonText;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? buttonColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? textFontSize;
  final Color? textColor;
  final FontWeight? textFontWeight;
  final bool isEnabled;

  const RoundedElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.width,
    this.height,
    this.borderRadius,
    this.buttonColor,
    this.borderColor,
    this.borderWidth,
    this.textFontSize,
    this.textColor,
    this.textFontWeight,
    required this.isEnabled,
  });

  @override
  Widget builder(
    BuildContext context,
    RoundedElevatedButtonModel viewModel,
    Widget? child,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 25.0.r),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 1.0,
          ),
        ),
        backgroundColor: buttonColor ?? kcWhiteColor,
        disabledBackgroundColor: kcPrimaryColor.withOpacity(0.2),
        fixedSize: Size(width ?? 231.w, height ?? 41.h),
      ),
      child: Padding(
        padding: EdgeInsets.all(2.0.dg),
        child: FittedBox(
          child: Text(
            buttonText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: textFontSize ?? 14.sp,
              color: isEnabled ? textColor : kcPrimaryColor.withOpacity(0.5),
              fontWeight: textFontWeight,
            ),
          ),
        ),
      ),
    );
  }

  @override
  RoundedElevatedButtonModel viewModelBuilder(
    BuildContext context,
  ) =>
      RoundedElevatedButtonModel();
}
