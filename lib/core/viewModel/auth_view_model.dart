import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>["email"]);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late TextEditingController email;
  late TextEditingController name;
  late TextEditingController password;
  late TextEditingController numberPhone;
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
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    email.clear();
    password.clear();
    super.onClose();
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      User? user;
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      user = userCredential.user;
      print(user);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> createAccountWithEmailAndPassword() async {
    try {
      User? user;
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: email.text, password: password.text);
      user = userCredential.user;
      print(user);
      Get.offAllNamed(AppRoutes.rootPage);
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

  Future<void> loginByGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    try {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser!.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      print("authCredential :");
      print(authCredential);

      if (_auth
          .signInWithCredential(authCredential)
          .toString()
          .contains("[<!DOCTYPE html>")) {
        Get.snackbar("Turn on ", "VPN");
        return;
      }
      UserCredential userCredential =
          await _auth.signInWithCredential(authCredential);

      print("UserCredential  :");
      print(userCredential);
      var name = userCredential.user!.displayName;
      var image = userCredential.user!.photoURL;
      var phoneNumber = userCredential.user!.phoneNumber;

      print("name::::" + name.toString());
      print("image::::" + image.toString());
      print("phone::::" + phoneNumber.toString());
      Get.offAllNamed(AppRoutes.rootPage);
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}
