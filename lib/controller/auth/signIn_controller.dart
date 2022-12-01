import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class SignInController extends GetxController {
  goToSignUp();
  loginByGoogle();
  signInWithEmailAndPassword();
}

class SignInControllerImp extends SignInController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late TextEditingController email;
  late TextEditingController password;

  @override
  goToSignUp() {
    Get.toNamed(AppRoutes.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
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
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @override
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

}
