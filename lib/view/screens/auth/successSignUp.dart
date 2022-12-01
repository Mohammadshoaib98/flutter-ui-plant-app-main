import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/view/screens/widget/auth/custombuttonauth.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constants.backgroundColor,
        elevation: 0.0,
        title: Text("Success",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Constants.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
            Icons.check_circle_outline,
            size: 200,
            color: Constants.primaryColor,
          )),
          Text("congratulations",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 30)),
        const Text("successfully registered"),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomBottomAuth(
                text: "Go To Login",
                onPressed: () {
                Get.toNamed(AppRoutes.signIn);
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}
