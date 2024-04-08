import 'package:eziline_task/ui/dialogs/add_phase/widgets/bottom_buttons.dart';
import 'package:eziline_task/ui/dialogs/add_phase/widgets/close_btn.dart';
import 'package:eziline_task/ui/dialogs/add_phase/widgets/color_seletcor.dart';
import 'package:eziline_task/ui/dialogs/add_phase/widgets/date_seletor.dart';
import 'package:eziline_task/ui/dialogs/add_phase/widgets/task_name.dart';
import 'package:flutter/material.dart';
import 'package:eziline_task/ui/common/app_colors.dart';
import 'package:eziline_task/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'add_phase_dialog_model.dart';


class AddPhaseDialog extends StackedView<AddPhaseDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const AddPhaseDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddPhaseDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: kcBackgroundColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CloseBtnTitleAddPhaseDialog(completer: completer),
              verticalSpaceMedium,
             const TaskName(),
              verticalSpaceMedium,
              const DateSelectorAddPhaseDialog(title: 'Start Date'),
              verticalSpaceMedium,
              const DateSelectorAddPhaseDialog(title: 'End Date'),
              verticalSpaceMedium,
              const ColorSelectorAddPhaseDialog(),
              verticalSpaceSmall,
              BottomButtonsAddPhaseDialog(completer: completer),
            ],
          ),
        ),
      ),
    );
  }

  @override
  AddPhaseDialogModel viewModelBuilder(BuildContext context) =>
      AddPhaseDialogModel();
}
