import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentIndex = 0;
  List<Widget> indicators = [];

  @override
  next() {
    if (currentIndex < 2) {
      currentIndex++;
      if (currentIndex < 3) {
        pageController.nextPage(
            duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
      }
    } else {
      Get.offAllNamed(AppRoutes.signIn);
    }

  }

  @override
  onPageChanged(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  }

