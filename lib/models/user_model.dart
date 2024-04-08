import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? name;
  final String? userRole;
  String? uid;
  final String? email;
  final DateTime? createdTime;

  UserModel({
    this.userRole,
    this.email,
    this.name,
    this.uid,
    this.createdTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_role': userRole,
      'uid': uid,
      'created_time': createdTime,
      'name': name,
      'email': email
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return UserModel(
      uid: data['uid'],
      userRole: data['user_role'],
      name: data['name'],
      email: data['email'],
      createdTime: (data['created_time'] as Timestamp?)?.toDate(),
    );
  }
}
