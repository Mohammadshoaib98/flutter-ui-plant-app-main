import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  login();
  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;


  @override
  goToVerifyCode() {
    Get.toNamed(AppRoutes.signUp);
  }

  @override
  login() {}
  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
