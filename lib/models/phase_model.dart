import 'package:cloud_firestore/cloud_firestore.dart';

class PhaseModel {
  final String phaseName;
  final DateTime startDate;
  final DateTime endDate;
  final String phaseColor;
  final String phaseId;
  final String uid;
  PhaseModel(
      {required this.phaseName,
      required this.startDate,
      required this.endDate,
      required this.phaseId,
      required this.phaseColor,
      required this.uid}); //constructor

  Map<String, dynamic> toJson() {
    return {
      'phaseName': phaseName,
      'startDate': startDate,
      'endDate': endDate,
      'phaseId': phaseId,
      'phaseColor': phaseColor,
      'uid': uid
    };
  }

  factory PhaseModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return PhaseModel(
      phaseName: data['phaseName'],
      uid: data['uid'],
      startDate: data['startDate'].toDate(),
      endDate: data['endDate'].toDate(),
      phaseId: data['phaseId'],
      phaseColor: data['phaseColor'],
    );
  }
}
