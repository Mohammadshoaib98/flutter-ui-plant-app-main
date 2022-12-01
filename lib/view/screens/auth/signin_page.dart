import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/controller/auth/signIn_controller.dart';
import 'package:flutter_onboarding/core/viewModel/auth_view_model.dart';
import 'package:flutter_onboarding/view/root_page.dart';
import 'package:flutter_onboarding/view/screens/auth/forgot_password.dart';
import 'package:flutter_onboarding/view/screens/auth/signup_page.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../widgets/auth/customTextFormAuth.dart';

class SignIn extends GetWidget<AuthViewModel> {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 //   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(ImageAssets.signInImage),
                const Text(
                  'Sign In',
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
                    myController: controller.email //controller.email,
                    ,
                    valid: (val) {
                      
                    },
                    onSave: (val) {
                    }),
                CustomTextFormAuth(
                  hintText: "Enter Password",
                  iconData: Icons.lock,
                  isNumber: false,
                  labelText: 'Password',
                  //myController: controller.password,
                  valid: (val) {
                   
                  },
                  onSave: (val) {
                  },
                  myController: controller.password,
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                   
                      try {
                        controller.signInWithEmailAndPassword().then((value) {
                          
                        Get.offNamed(AppRoutes.rootPage);
                        controller.onClose();  
                        },);
                      } on PlatformException catch (e) {
                        print(e.message);
                        Get.snackbar("Error Login ", e.message.toString(),
                            colorText: Constants.backgroundColor,snackPosition: SnackPosition.BOTTOM);
                      }

                      //   Navigator.pushReplacement(
                      //       context,
                      //       PageTransition(
                      //           child: const RootPage(),
                      //           type: PageTransitionType.bottomToTop));
                      //
                    
                  },
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: const ForgotPasswordPage(),
                            type: PageTransitionType.bottomToTop));
                  },
                  child: const Center(
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: 'Forgot Password? ',
                          style: TextStyle(
                            color: Constants.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Reset Here',
                          style: TextStyle(
                            color: Constants.primaryColor,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('OR'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: Container(
                    width: size.width / 1.125,
                    decoration: BoxDecoration(
                        border: Border.all(color: Constants.primaryColor),
                        borderRadius: BorderRadius.circular(30)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 30,
                          child: Image.asset(ImageAssets.googleImage),
                        ),
                        const Text(
                          'Sign In with Google',
                          style: TextStyle(
                            color: Constants.blackColor,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    controller.loginByGoogle();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: const SignUp(),
                            type: PageTransitionType.bottomToTop));
                  },
                  child: const Center(
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: 'New to Plenty ? ',
                          style: TextStyle(
                            color: Constants.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Register',
                          style: TextStyle(
                            color: Constants.primaryColor,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
