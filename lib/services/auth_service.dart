import 'dart:developer';

import 'package:eziline_task/models/user_model.dart';
import 'package:eziline_task/services/instances/firebase_instance.dart';
import 'package:eziline_task/services/user_service.dart';
import 'package:eziline_task/ui/common/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AuthService {
  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      EasyLoading.show();
     await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      EasyLoading.dismiss();

      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          showToast(message: 'Invalid email');
        case "user-disabled":
          showToast(message: 'User disabled');
        case "user-not-found":
          showToast(message: 'User not found');
        case "wrong-password":
          showToast(message: 'Wrong password');
        default:
          showToast(message: 'Failed to login');
          break;
      }

      EasyLoading.dismiss();
      return false;
    } catch (e) {
      EasyLoading.dismiss();
      showToast(message: 'Failed to login');
      log(e.toString());
      return false;
    }
  }

 Future<void> signout() {
    return firebaseAuth.signOut();
  }

  Future<bool> signUp({
    required String password,
    required UserModel userModel,
  }) async {
    try {
      EasyLoading.show();
      // Create user with email and password
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: userModel.email!,
        password: password,
      );
      userModel.uid = userCredential.user!.uid;
      // Store user details in Firestore
        await UserService.storeUserRoleAndName(
        userModel: userModel,
      );

      // Update user profile display name
      await userCredential.user!.updateDisplayName(userModel.name);

      UserService.storeUserRoleAndName(userModel: userModel);
      // Return user ID
      EasyLoading.dismiss();
      showToast(message: 'Signed up successfully');
      return true;
    } catch (e) {
      // Handle signup errors
      debugPrint('Error signing up: $e');
      EasyLoading.dismiss();
      showToast(message: 'Failed to sign up because $e');
      return false;
    }
  }
}
