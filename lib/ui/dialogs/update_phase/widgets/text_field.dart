
import 'package:eziline_task/ui/dialogs/update_phase/update_phase_dialog_model.dart';
import 'package:eziline_task/ui/widgets/common/rounded_transparet_textfield/rounded_transparet_textfield.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TaskName extends ViewModelWidget<UpdatePhaseDialogModel> {
  const TaskName({super.key});

  @override
  Widget build(BuildContext context, UpdatePhaseDialogModel viewModel) {
    return RoundedTransparetTextfield(
      labelText: 'Task Name',
      obscureText: false,
      controller: viewModel.taskController,
    );
  }
}