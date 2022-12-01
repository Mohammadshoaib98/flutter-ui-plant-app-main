import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Container(
    color:Constants.backgroundColor,
    width: double.maxFinite,
    height: double.maxFinite,
    child:const Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: CircularProgressIndicator(
          backgroundColor: Constants.primaryColor,
        ),
      ),
    ),
  );
  }


}