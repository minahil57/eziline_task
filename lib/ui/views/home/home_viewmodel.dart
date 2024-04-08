
import 'package:eziline_task/app/app.dialogs.dart';
import 'package:eziline_task/app/app.locator.dart';
import 'package:eziline_task/app/app.router.dart';
import 'package:eziline_task/models/meeting_model.dart';
import 'package:eziline_task/models/phase_model.dart';
import 'package:eziline_task/services/auth_service.dart';
import 'package:eziline_task/services/phase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
 final _authService = locator<AuthService>();
  final _phaseService = locator<PhaseService>();
  final _navigationService = locator<NavigationService>();
  List<Meeting> combinedMeetings = [];

  @override
  List<ListenableServiceMixin> get listenableServices => [_phaseService];

  List<PhaseModel> get fetchPhases {
    return _phaseService.phases;
  }

  void showAddPhaseDialog() async {
    await _dialogService.showCustomDialog(variant: DialogType.addPhase);
    rebuildUi();
  }

  void showUpdatePhaseDialog(PhaseModel phase, index) async {
    await _dialogService
        .showCustomDialog(variant: DialogType.updatePhase, data: {
      'phase': phase,
      'index': index,
    });
  }

  List<Meeting> getMonthlySource() {
    List<Meeting> meetings = _phaseService.phases
        .map((e) => Meeting(
              e.phaseName,
              e.startDate,
              e.endDate,
              Color(int.parse('0xFF${e.phaseColor}')),
              false,
            ))
        .toList();

    if (meetings.isEmpty) {
      meetings = [
        Meeting(
          '',
          DateTime.now(),
          DateTime.now(),
          Colors.transparent,
          false,
        )
      ];
    }

    return meetings;
  }

  void onViewModelReady() async {
    setBusy(true);
    _phaseService.clearPhases();
    _phaseService.getPhases();

    setBusy(false);
  }

  void logout() async{
    EasyLoading.show();
    await _authService.signout();
    _navigationService.replaceWithLoginView();
    EasyLoading.dismiss();
  }
}
