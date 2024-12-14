import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final cEmail = TextEditingController();
  final cPass = TextEditingController();

  @override
  void onClose() {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3262100314.
    cEmail.dispose();
    cPass.dispose();
    super.onClose();
  }
}
