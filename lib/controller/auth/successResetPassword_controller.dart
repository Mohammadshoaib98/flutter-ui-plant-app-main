
import 'package:flutter_onboarding/constants.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {

goToPageSignIn() ; 

}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToPageSignIn() {
     Get.offAllNamed(AppRoutes.signIn) ; 
  }

}
