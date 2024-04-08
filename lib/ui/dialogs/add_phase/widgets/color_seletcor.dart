import 'package:eziline_task/ui/common/app_colors.dart';
import 'package:eziline_task/ui/dialogs/add_phase/add_phase_dialog_model.dart';
import 'package:eziline_task/ui/widgets/common/color_circle/color_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class ColorSelectorAddPhaseDialog extends ViewModelWidget<AddPhaseDialogModel> {
  const ColorSelectorAddPhaseDialog({super.key});

  @override
  Widget build(BuildContext context, AddPhaseDialogModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(right: 22.0.dg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Color',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: kcWhiteColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              viewModel.colors.length,
              (index) {
                bool isSelected = index == viewModel.selectedColorIndex;
                return GestureDetector(
                  onTap: () {
                    viewModel.chooseColor(index);
                  },
                  child: Opacity(
                    opacity: isSelected ? 1.0 : 0.5,
                    child: ColorCircle(color: viewModel.colors[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
