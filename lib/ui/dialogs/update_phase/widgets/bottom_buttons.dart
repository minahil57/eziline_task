import 'package:eziline_task/ui/common/app_colors.dart';
import 'package:eziline_task/ui/dialogs/update_phase/update_phase_dialog_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BottomButtonsUpdatePhaseDialog
    extends ViewModelWidget<UpdatePhaseDialogModel> {
  final Function(DialogResponse) completer;

  const BottomButtonsUpdatePhaseDialog({
    super.key,
    required this.completer,
  });

  @override
  Widget build(BuildContext context, UpdatePhaseDialogModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon:
              const Icon(Icons.delete_forever_outlined, color: kcVeryLightGrey),
          onPressed: () {
            viewModel.deletePhase(viewModel.phase!, viewModel.index);
            completer(DialogResponse(confirmed: true));
          },
        ),
        const SizedBox(
          height: 40,
          child: VerticalDivider(
            width: 20,
            thickness: 1,
            color: kcDarkGreyColor,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.check_circle_outline, color: kcVeryLightGrey),
          onPressed: () {
            viewModel.updatePhase(viewModel.phase!.phaseId, viewModel.index);

            completer(DialogResponse(confirmed: true));
          },
        ),
      ],
    );
  }
}
