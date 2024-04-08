import 'package:eziline_task/ui/common/app_colors.dart';
import 'package:eziline_task/ui/dialogs/add_phase/add_phase_dialog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CloseBtnTitleAddPhaseDialog extends ViewModelWidget<AddPhaseDialogModel> {
  final Function(DialogResponse) completer;
  const CloseBtnTitleAddPhaseDialog({
    super.key,
    required this.completer,
  });

  @override
  Widget build(BuildContext context, AddPhaseDialogModel viewModel) {
    return Column(children: [
      Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () => completer(DialogResponse(confirmed: true)),
          icon: const Icon(
            Icons.close,
            color: kcWhiteColor,
          ),
        ),
      ),
      Text(
        'Make A Task',
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: kcWhiteColor,
        ),
      ),
    ]);
  }
}
