import 'package:flutter/material.dart';
import 'package:flutter_onboarding/view/onboarding_screen.dart';
import 'package:flutter_onboarding/view/root_page.dart';
import 'package:flutter_onboarding/view/scan_page.dart';
import 'package:flutter_onboarding/view/screens/auth/forgot_password.dart';
import 'package:flutter_onboarding/view/screens/auth/signin_page.dart';
import 'package:flutter_onboarding/view/screens/auth/signup_page.dart';
import 'package:flutter_onboarding/view/screens/auth/verifyCodesSignUp.dart';

import 'view/screens/auth/reset_password.dart';
import 'view/screens/auth/successResetPassword.dart';
import 'view/screens/auth/successSignUp.dart';

class Constants {
  //Primary color
  static const Color primaryColor = Color(0xff296e48);
  static const Color blackColor = Colors.black54;
  static const Color backgroundColor = Color(0xffF8F9FD) ; 
  static const Color grey = Color(0xff8e8e8e);


  //icon NavigationBar
 static const List<IconData> iconsBottomNavBar = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];
  //Onboarding texts
  static var titleOne = "Learn more about plants";
  static var descriptionOne = "Read how to care for plants in our rich plants guide.";
  static var titleTwo = "Find a plant lover friend";
  static var descriptionTwo = "Are you a plant lover? Connect with other plant lovers.";
  static var titleThree = "Plant a tree, green the Earth";
  static var descriptionThree = "Find almost all types of plants that you like here.";
}

class ImageAssets{
//root ImageAssets
  static const String rootAssets="assets/images";
//onBoarding
  static const String onBoardingOne="$rootAssets/plant-one.png";
  static const String onBoardingTwo="$rootAssets/plant-two.png";
  static const String onBoardingThree="$rootAssets/plant-three.png";
 //Authentication
  static const String signUpImage="$rootAssets/signup.png";
  static const String googleImage="$rootAssets/google.png"; // static const String onBoardingOne="";
  static const String signInImage="$rootAssets/signin.png";
  static const String forgetPasswordImage="$rootAssets/reset-password.png";
  //Scan Screen
  static const String scanImage="$rootAssets/code-scan.png";
 
  //Floating Action Button 
  static const String floatingActionButtonImage="$rootAssets/code-scan-two.png";


}

Map<String ,Widget Function(BuildContext context)>route={
AppRoutes.onBoarding:(context) => const OnboardingScreen(),
AppRoutes.signIn:(context) => const SignIn(),
AppRoutes.signUp:(context) => const SignUp(),
AppRoutes.forgetPassword:(context) => const ForgotPasswordPage(),
AppRoutes.resetPassword:(context) =>  const ResetPassword(),
AppRoutes.successResetPassword:(context) => const SuccessResetPassword(),
AppRoutes.successSignUp:(context) => const SuccessSignUp(),
AppRoutes.verifyEmailCode:(context)=>const VerfiyCodeSignUp(),
AppRoutes.qrPage:(context)=> const ScanPage(),
AppRoutes.rootPage:(context) => const RootPage()

};


class AppRoutes{
  static const String onBoarding="/onBoarding";
  static const String signIn="/signIn";
  static const String signUp="/signUp";
  static const String forgetPassword="/forgetPassword";
  static const String verifyEmailCode="/verifyCode";
  static const String resetPassword="/resetPassword";
  static const String successSignUp="/successSignUp";
  static const String successResetPassword="/successResetPassword";
  static const String qrPage="/scanCode";
  static const String rootPage="/root";
}