import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/controller/localeController.dart';
import 'package:flutter_onboarding/helper/binding.dart';
import 'package:flutter_onboarding/localization/changeLocal.dart';
import 'package:flutter_onboarding/localization/translation.dart';
import 'package:flutter_onboarding/services/services.dart';
import 'package:flutter_onboarding/view/onboarding_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      // when i want select language Arabic or english
      // translations:MyTranslation()
      initialBinding: Binding(),
      title: 'Onboarding Screen',
      theme: ThemeData(
          appBarTheme:const AppBarTheme(backgroundColor: Colors.white ,
          iconTheme: IconThemeData(color: Colors.black)
          ),
            scaffoldBackgroundColor: const Color(0xFFE5E5E5),
            primaryColor:Constants.primaryColor,
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: Theme.of(context).textTheme.subtitle1,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Constants.primaryColor,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.0),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
            )
        ),
      home: const OnboardingScreen(),
      // locale: controller.language,
      debugShowCheckedModeBanner: false,
      routes: route,
    );
  }
}