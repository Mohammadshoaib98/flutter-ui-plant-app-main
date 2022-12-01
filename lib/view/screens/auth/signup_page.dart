import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/controller/auth/signUp_controller.dart';
import 'package:flutter_onboarding/core/viewModel/auth_view_model.dart';
import 'package:flutter_onboarding/view/screens/auth/signin_page.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../widgets/auth/customTextFormAuth.dart';

class SignUp extends GetWidget<AuthViewModel> {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(ImageAssets.signUpImage),
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormAuth(
                hintText: "Enter Full Name",
                iconData: Icons.person,
                isNumber: false,
                labelText: 'Name',
                myController: controller.name, valid: (val){},
                 onSave:(val){}
              ),
              CustomTextFormAuth(
                hintText: "Enter Email",
                iconData: Icons.alternate_email,
                isNumber: false,
                labelText: 'Email',
                myController: controller.email, valid: (){},
                onSave:(val){}
              ),
              CustomTextFormAuth(
                hintText: "Enter Password",
                iconData: Icons.lock,
                isNumber: false,
                labelText: 'Password',
                myController: controller.password, valid: (){},
                 onSave:(val){}
              ),
              CustomTextFormAuth(
                hintText: "Enter Email",
                iconData: Icons.phone_android,
                isNumber: true,
                labelText: 'Phone Number',
                myController: controller.numberPhone,
                 valid: (){},
                  onSave:(val){}
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  controller.createAccountWithEmailAndPassword();
                  controller.onClose();
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
                      'Sign Up',
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
              Container(
                width: size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Constants.primaryColor),
                    borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Image.asset(ImageAssets.googleImage),
                    ),
                    const Text(
                      'Sign Up with Google',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
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
                child:const Center(
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
          ),
        ),
      ),
    );
  }
}
