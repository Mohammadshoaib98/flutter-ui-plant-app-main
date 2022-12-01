import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/controller/forgetPassword/forgetPassword_controller.dart';
import 'package:flutter_onboarding/view/screens/auth/signin_page.dart';
import 'package:flutter_onboarding/view/screens/widgets/auth/customtextformauth.dart';
import 'package:get/get.dart';

import 'package:page_transition/page_transition.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        Get.put(ForgetPasswordControllerImp());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(ImageAssets.forgetPasswordImage),
              const Text(
                'Forgot\nPassword',
                  style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
               CustomTextFormAuth(
                hintText: "Enter Email",
                iconData: Icons.alternate_email,
                isNumber: false,
                labelText: 'Email',
                myController: null, valid: (){},
                onSave: (){},
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.verifyEmailCode );
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: const Center(
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const SignIn(),
                          type: PageTransitionType.bottomToTop));
                },
                child: const Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Have an Account? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
            //go to check email page
          ),
        ),
      ),
    );
  }
}
