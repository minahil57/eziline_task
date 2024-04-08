import 'package:eziline_task/app/app.locator.dart';
import 'package:eziline_task/models/phase_model.dart';
import 'package:eziline_task/services/instances/firebase_instance.dart';
import 'package:eziline_task/services/phase_service.dart';
import 'package:eziline_task/ui/common/toast.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddPhaseDialogModel extends BaseViewModel {
  final TextEditingController notesController = TextEditingController();
  final _phaseService = locator<PhaseService>();

  late Function(DialogResponse) completer;
  final DateTime now = DateTime.now();
  DateTime start = DateTime.now();
  DateTime end = DateTime.now();
  int selectedColorIndex = 0;
  List<PhaseModel> phases = [];

  final TextEditingController taskName = TextEditingController();

  void onViewModelReady(Function(DialogResponse) completer) {
    this.completer = completer;
  }

  Future<void> savePhaseData() async {
    if (start != end) {
      final phase = PhaseModel(
          uid: firebaseAuth.currentUser!.uid,
          phaseName: taskName.text.trim(),
          startDate: start,
          endDate: end,
          phaseId: '',
          phaseColor: colors[selectedColorIndex]
              .value
              .toRadixString(16)
              .padLeft(8, '0'),
);
      final check = await _phaseService.savePhaseData(phase);
      // ignore: unrelated_type_equality_checks
      if (check == true) {
        _phaseService.addlocalPhase(phase);
        //completer(DialogResponse(data: phase,confirmed: true),);
      }
    } else {
      showToast(message: 'End and start dates cannot be the same');
    }
  }

  void openStartDateCalendar(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      helpText: 'Select Start Date',
      firstDate: DateTime(DateTime.now().month),
      lastDate: DateTime(DateTime.now().year + 100),
    );
    if (picked != null) {
      start = picked;
      rebuildUi();
    }
  }

  void openEndDateCalendar(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      helpText: 'Select End Date',
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

  void addPhase() {
    _phaseService.phases.add(PhaseModel(
      uid: firebaseAuth.currentUser!.uid,
      phaseId: firestore.collection('phase').doc().id,
      phaseName: taskName.text.trim(),
      startDate: start,
      endDate: end,
      phaseColor:
          colors[selectedColorIndex].value.toRadixString(16).padLeft(8, '0'),
    ));
    rebuildUi();
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
