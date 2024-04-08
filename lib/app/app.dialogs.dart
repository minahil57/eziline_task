// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/add_phase/add_phase_dialog.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/update_phase/update_phase_dialog.dart';

enum DialogType {
  infoAlert,
  addPhase,
  updatePhase,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.addPhase: (context, request, completer) =>
        AddPhaseDialog(request: request, completer: completer),
    DialogType.updatePhase: (context, request, completer) =>
        UpdatePhaseDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
