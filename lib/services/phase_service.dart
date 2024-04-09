import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eziline_task/models/phase_model.dart';
import 'package:eziline_task/ui/common/toast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:stacked/stacked.dart';

class PhaseService with ListenableServiceMixin {
  List<PhaseModel> phases = [];

  clearPhases() {
    phases.clear();
    notifyListeners();
  }

  getPhases() async {
    phases = await fetchAllPhases();
    notifyListeners();
  }

  deletelocalPhase(PhaseModel phase, index) {
    if (index >= 0 && index < phases.length) {
      phases.removeAt(index);
      notifyListeners();
    }
  }

  addlocalPhase(PhaseModel phase) {
    phases.add(phase);

    notifyListeners();
  }

  updatePhaseAtIndex(int index, Map<String, dynamic> newValue) {
    if (index >= 0 && index < phases.length) {
      phases[index] = PhaseModel(
        uid: newValue['uid'],
        phaseId: newValue['phaseId'],
        phaseName: newValue['phaseName'],
        startDate: newValue['startDate'],
        endDate: newValue['endDate'],
        phaseColor: newValue['phaseColor'],
      );
      notifyListeners();
    } else {
      // Handle index out of bounds error or other invalid scenarios
      log('Invalid index');
    }
  }

  Future<bool> savePhaseData(PhaseModel phase) async {
    try {
      EasyLoading.show();

      // Get reference to the Firestore collection
      CollectionReference phasesCollection = FirebaseFirestore.instance.collection('phase');
      Map<String, dynamic> phaseData = phase.toJson();

      // Add the phase to Firestore
      DocumentReference docRef = await phasesCollection.add(phaseData);

      // Get the ID of the newly added document
      String phaseId = docRef.id;

      // Update the document with the phaseId
      await docRef.update({'phaseId': phaseId});

      EasyLoading.dismiss();
      showToast(message: 'Phase added successfully');
      return true;
      // }
    } catch (e) {
      log('Error adding phase: $e');
      EasyLoading.dismiss();
      showToast(message: 'Error adding phase');

      return false;

      // Handle error
    }
  }

  Future<PhaseModel> fetchPhaseById(String phaseId) async {
  try {
    if (phaseId.isEmpty) {
      throw ArgumentError("phaseId cannot be empty");
    }

    EasyLoading.show();

    // Get reference to the Firestore document with the specified phaseId
    DocumentSnapshot phaseSnapshot = await FirebaseFirestore.instance
        .collection('phase')
        .doc(phaseId)
        .get();

    // Check if the document exists
    if (phaseSnapshot.exists) {
      // Convert the document snapshot to a PhaseModel object
      EasyLoading.dismiss();
      return PhaseModel.fromSnapshot(phaseSnapshot);
    } else {
      // Handle case where document does not exist
      EasyLoading.dismiss();
      return PhaseModel(
          phaseName: '',
          startDate: DateTime.now(),
          endDate: DateTime.now(),
          phaseId: phaseId,
          phaseColor: '',
          uid: '');
    }
  } catch (e) {
    // Handle error
    EasyLoading.dismiss();
    return PhaseModel(
        phaseName: '',
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        phaseId: phaseId,
        phaseColor: '',
        uid: '');
  }
}


  Future<bool> updatePhase(String phaseId, updatedData) async {
    try {
      EasyLoading.show();

      // Get reference to the Firestore collection
      CollectionReference phasesCollection = FirebaseFirestore.instance.collection('phase');

      // Update the phase with the specified phaseId
      await phasesCollection.doc(phaseId).update(updatedData);

      EasyLoading.dismiss();
      showToast(message: 'Phase updated successfully');
      return true;
    } catch (e) {
      log('Error updating phase: $e');
      EasyLoading.dismiss();
      showToast(message: 'Error updating phase');
      return false;

      // Handle error
    }
  }

  Future<void> deletePhase(String phaseId) async {
    try {
      EasyLoading.show();

      // Get reference to the Firestore collection
      CollectionReference phasesCollection = FirebaseFirestore.instance.collection('phase');

      // Delete the phase with the specified phaseId
      await phasesCollection.doc(phaseId).delete();
      log(phaseId);

      EasyLoading.dismiss();
      showToast(message: 'Phase deleted successfully');
    } catch (e) {
      log('Error deleting phase: $e');
      EasyLoading.dismiss();
      showToast(message: 'Error deleting phase');

      // Handle error
    }
  }



Future<List<PhaseModel>> fetchAllPhases() async {
  List<PhaseModel> phases = [];
  try {
    EasyLoading.show();

    // Get reference to the Firestore collection
    CollectionReference phasesCollection =
        FirebaseFirestore.instance.collection('phase');

    // Fetch all documents in the collection
    QuerySnapshot querySnapshot = await phasesCollection.get();

    // Loop through the documents and convert them to PhaseModel objects
    for (var doc in querySnapshot.docs) {
      PhaseModel phase = PhaseModel.fromSnapshot(doc);
      phases.add(phase);
    }

    EasyLoading.dismiss();
    return phases;
  } catch (e) {
    log('Error fetching phases: $e');
    EasyLoading.dismiss();
    // Return empty list if error occurs
    return phases;
  }
}

}
