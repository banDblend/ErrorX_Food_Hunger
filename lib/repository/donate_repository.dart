import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_bank/models/donate_model.dart';
import 'package:get/get.dart';

class DonateRepository extends GetxController {
  static DonateRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createDonate(DonateModel donate) async {
    await _db.collection("Donate").add(donate.toJson()).then(
      (value) {
        Get.snackbar(
          "Success",
          "Your donation has been created.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green,
        );
      },
    ).catchError((error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      print(error.toString());
    });
  }
}
