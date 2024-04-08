import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eziline_task/models/user_model.dart';
import 'package:eziline_task/services/instances/firebase_instance.dart';
import 'package:eziline_task/ui/common/toast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UserService {
  get firebasestore => null;

  static Future<bool> storeUserRoleAndName({
    required UserModel userModel,
  }) async {
    final user = firebaseAuth.currentUser;
    if (user == null) {
      // User not signed in or created
      throw Exception("User not signed in or created");
    }

    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    DocumentSnapshot userSnapshot = await usersCollection.doc(user.uid).get();
    userModel.uid = userSnapshot.id;

    if (!userSnapshot.exists) {
      // User not stored in Firestore, so add their data
      await usersCollection.doc(user.uid).set(
            userModel.toJson(),
          );

      return true;
    } else {
      return false;
    }
  }

  Future<UserModel> getUserDetails() async {
    try {
    EasyLoading.show();
    CollectionReference usersCollection = firebasestore.collection('users');

    QuerySnapshot userSnapshot = await usersCollection
        .where('uid', isEqualTo: firebaseAuth.currentUser!.uid)
        .get();

    log(userSnapshot.docs.toString());

    if (userSnapshot.docs.isNotEmpty) {
      DocumentSnapshot userDoc = userSnapshot.docs.first;
      EasyLoading.dismiss();
      showToast(message: 'User Data fetched successfully');

      return UserModel.fromSnapshot(userDoc);
    } else {
      EasyLoading.dismiss();
      throw Exception("User not found in Firestore");
    }
    } catch (e) {
      EasyLoading.dismiss();
      showToast(message: e.toString());
      throw Exception(e.toString());
    }
  }
}
