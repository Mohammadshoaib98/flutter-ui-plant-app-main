import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/controller/onBoardingController.dart';
import 'package:flutter_onboarding/data/dataSource/static/static.dart';
import 'package:get/get.dart';

class OnboardingScreen extends GetView<OnBoardingControllerImp> {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: InkWell(
              onTap: () {
                      Get.offAllNamed(AppRoutes.signIn);
                   }, //to login screen. We will update later
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              controller.onPageChanged(page);
            },
            controller: controller.pageController,
            children: onBoardingList,
          ),
          Positioned(
            bottom: 80,
            left: 30,
            child: GetBuilder<OnBoardingControllerImp>(builder: (controller)=>Row(children:_buildIndicator())    ,)
          ),
          Positioned(
            bottom: 60,
            right: 30,
            child: Container(
              child: IconButton(
                  onPressed: () => controller.next(),
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                    color: Colors.white,
                  )),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Extra Widgets

  //Create the indicator decorations widget
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10.0,
      width: isActive ? 20 : 8,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

//Create the indicator list
  List<Widget> _buildIndicator() {
    Get.put(OnBoardingControllerImp());
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (controller.currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}
