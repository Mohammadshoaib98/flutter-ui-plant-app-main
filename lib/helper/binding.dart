import 'package:flutter_onboarding/core/viewModel/auth_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut(()=>AuthViewModel());

  }

}