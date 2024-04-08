import 'dart:developer';

import 'package:eziline_task/app/app.locator.dart';
import 'package:eziline_task/models/phase_model.dart';
import 'package:eziline_task/services/instances/firebase_instance.dart';
import 'package:eziline_task/services/phase_service.dart';
import 'package:eziline_task/ui/common/app_colors.dart';
import 'package:eziline_task/ui/common/toast.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UpdatePhaseDialogModel extends BaseViewModel {
  final PhaseModel phaseId;
  final int index;
  UpdatePhaseDialogModel({required this.phaseId, required this.index});
  final _navigationService = locator<NavigationService>();
  final TextEditingController taskController = TextEditingController();
  final _phaseService = locator<PhaseService>();
  PhaseModel? phase;


  DateTime? start;
  DateTime? end;
  int selectedColorIndex = 0;
  Color selectedColor = kcPrimaryColor;
  List<PhaseModel> phases = [];

  final List<String> items = ['Bulking', 'Deload', 'Cutting', 'Fighting'];

  void savePhaseData() {
    _phaseService.updatePhase;

    addPhase();
  }

  void updatePhase(phaseId, index) async {
    if (start != end) {
      Map<String, dynamic> updatedData = {
        'phaseName': taskController.text.trim(),
        'startDate': start,
        'endDate': end,
        'phaseColor':
            colors[selectedColorIndex].value.toRadixString(16).padLeft(8, '0'),
        'phaseId': phaseId,
        'uid': firebaseAuth.currentUser!.uid,
      };

      bool check = await _phaseService.updatePhase(phaseId, updatedData);
      if (check == true) {
        _phaseService.updatePhaseAtIndex(index, updatedData);
      }
    } else {
      showToast(message: 'End and start dates cannot be the same');
    }
    _navigationService.back();
    rebuildUi();
  }

  void openStartDateCalendar(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().month),
      lastDate: DateTime(DateTime.now().year + 100),
    );
    if (picked != null) {
      start = picked;
      rebuildUi();
    }
  }

  void deletePhase(PhaseModel phase, index) async {
    await _phaseService.deletePhase(phase.phaseId);
    _phaseService.deletelocalPhase(phase, index);
    _navigationService.back();
    rebuildUi();
  }

  void addPhase() {
    _phaseService.phases.add(PhaseModel(
      phaseId: firestore.collection('phase').doc().id,
      uid: firebaseAuth.currentUser!.uid,
      phaseName: taskController.text.trim(),
      startDate: start!,
      endDate: end!,
      phaseColor:
          colors[selectedColorIndex].value.toRadixString(16).padLeft(8, '0'),
    ));
    rebuildUi();
  }

  void openEndDateCalendar(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().month),
      lastDate: DateTime(DateTime.now().year + 100),
    );
    if (picked != null) {
      if (picked != start) {
        // Check if the picked end date is not equal to the start date
        end = picked;
        rebuildUi();
      } else {
        showToast(message: 'End and start dates cannot be the same');
      }
    }
  }

  void onViewModelReady() async {
    setBusy(true);
    log(phaseId.phaseId);
    phase = await _phaseService.fetchPhaseById(phaseId.phaseId);
    start = phase!.startDate;
    end = phase!.endDate;
    taskController.text = phase!.phaseName;
    selectedColor = Color(int.parse('0x${phase!.phaseColor}'));
    for (int i = 0; i < colors.length; i++) {
      if (colors[i] == selectedColor) {
        selectedColorIndex = i;
        break;
      }
    }
    setBusy(false);
  }

  

  void chooseColor(int index) {
    selectedColorIndex = index;
    rebuildUi();
  }

  final List<Color> colors = [
    const Color(0xFF33FF00),
    const Color(0xFFFF0000),
    const Color(0xFF0020C5),
    const Color(0xFFFFFFFF),
    const Color(0xFF643C3C),
  ];
}
