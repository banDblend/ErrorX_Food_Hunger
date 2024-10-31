import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_bank/models/profile_model.dart';
import 'package:get/get.dart';

class ProfileRepository extends GetxController {
  static ProfileRepository get instance => Get.put(ProfileRepository());

  final _db = FirebaseFirestore.instance;

  // Define the createProfile method
  Future<void> createProfile(ProfileMode1 profile) async {
    try {
      await _db.collection("profile").doc(profile.id).set(profile.toJson());
      Get.snackbar(
        "Success",
        "Your profile has been updated.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      print(error.toString());
    }
  }

  Future<DocumentSnapshot> getProfile(String userId) async {
    return await _db.collection("profile").doc(userId).get();
  }
}
