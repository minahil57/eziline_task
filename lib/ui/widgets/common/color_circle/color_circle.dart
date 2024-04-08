import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'color_circle_model.dart';

class ColorCircle extends StackedView<ColorCircleModel> {
  final Color color;
  const ColorCircle({super.key, required this.color});

  @override
  Widget builder(
    BuildContext context,
    ColorCircleModel viewModel,
    Widget? child,
  ) {
    return Container(
      width: 35.w,
      height: 17.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  @override
  ColorCircleModel viewModelBuilder(
    BuildContext context,
  ) =>
      ColorCircleModel();
}
