import 'package:eziline_task/ui/common/app_colors.dart';
import 'package:eziline_task/ui/dialogs/update_phase/widgets/bottom_buttons.dart';
import 'package:eziline_task/ui/dialogs/update_phase/widgets/color_selector.dart';
import 'package:eziline_task/ui/dialogs/update_phase/widgets/date_selector.dart';
import 'package:eziline_task/ui/dialogs/update_phase/widgets/text_field.dart';
import 'package:eziline_task/ui/dialogs/update_phase/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:eziline_task/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'update_phase_dialog_model.dart';


class UpdatePhaseDialog extends StackedView<UpdatePhaseDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const UpdatePhaseDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UpdatePhaseDialogModel viewModel,
    Widget? child,
  ) {
    return Center(
        child: viewModel.isBusy
            ? const SizedBox()
            : Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: kcBackgroundColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TopBarUpdatePhaseDialog(completer: completer),
                        verticalSpaceMedium,
                      const TaskName(),
                        verticalSpaceMedium,
                        const DateSelectorUpdatePhaseDialog(
                          title: 'Start Date',
                        ),
                        verticalSpaceMedium,
                        const DateSelectorUpdatePhaseDialog(
                          title: 'End Date',
                        ),
                        verticalSpaceMedium,
                        const ColorSelectorUpdatePhaseDialog(),
                        verticalSpaceSmall,
                        BottomButtonsUpdatePhaseDialog(completer: completer),
                      ],
                    ),
                  ),
                ),
              ));
  }

@override
  void onViewModelReady(UpdatePhaseDialogModel viewModel) {
    viewModel.onViewModelReady();
    super.onViewModelReady(viewModel);
  }
  @override
  UpdatePhaseDialogModel viewModelBuilder(BuildContext context) =>
      UpdatePhaseDialogModel(phaseId: request.data['phase'], index: request.data['index']);
}
