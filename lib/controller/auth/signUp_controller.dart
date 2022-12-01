import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  goToSignIn();
  createAccountWithEmailAndPassword();
}

class SignUpControllerImp extends SignUpController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController name;
  late TextEditingController numberPhone;

  @override
  goToSignIn() {
  Get.offNamed(AppRoutes.signIn);
  } 

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    name = TextEditingController();
    numberPhone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    name.dispose();
    numberPhone.dispose();
    super.dispose();
  }

  @override
  Future<void> createAccountWithEmailAndPassword() async {
    try {
      User? user;
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: email.text, password: password.text);
      user = userCredential.user;
      print(user);
    } on PlatformException catch (e) {
      if (e.message!.contains("[<!DOCTYPE html>")) {
        Get.snackbar("Turn on VPN", e.message.toString(),
            backgroundColor: Colors.redAccent,
            colorText: Constants.backgroundColor,
            snackPosition: SnackPosition.BOTTOM);

        print(e);
      } else {
        Get.snackbar("Turn on VPN", e.message.toString(),
            backgroundColor: Colors.redAccent,
            colorText: Constants.backgroundColor,
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }
}
