import 'package:flutter_onboarding/constants.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  goToPageSignIn();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToPageSignIn() {
    Get.offAllNamed(AppRoutes.signIn);
  }
}