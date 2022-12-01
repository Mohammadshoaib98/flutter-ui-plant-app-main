import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/core/viewModel/auth_view_model.dart';
import 'package:flutter_onboarding/view/screens/widgets/profile_widget.dart';
import 'package:get/get.dart';
import '../../controller/auth/firebase_services_controller.dart';

class ProfilePage extends GetView<ProfileServicesControllerImp> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 145,
                    width: 145,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Constants.primaryColor.withOpacity(.5),
                        width: 5.0,
                      ),
                    ),
                    child: GestureDetector(
                      child: GetBuilder<ProfileServicesControllerImp>(
                        init: ProfileServicesControllerImp(),
                        builder: (controller) => ClipRRect(
                          borderRadius: BorderRadius.circular(150),
                          child: controller.imageFile == null
                              ? Image.asset(
                                  'assets/images/profile.jpg',
                                  fit: BoxFit.fill,
                                )
                              : Image.file(
                                  controller.imageFile!,
                                ),
                        ),
                      ),
                      onTap: () {
                        showBottomSheet(context);
                        print("image");
                      },
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Mohammad Shoaib',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                        height: 24,
                        child: Image.asset("assets/images/verified.png")),
                  ],
                ),
              ),
              Text(
                'johndoe@gmail.com',
                style: TextStyle(
                  color: Constants.blackColor.withOpacity(.3),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: size.height * 0.58,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: ProfileWidget(
                        icon: Icons.person,
                        title: 'My Profile',
                      ),
                    ),
                    ProfileWidget(
                      icon: Icons.settings,
                      title: 'Settings',
                    ),
                    ProfileWidget(
                      icon: Icons.notifications,
                      title: 'Notifications',
                    ),
                    ProfileWidget(
                      icon: Icons.chat,
                      title: 'FAQs',
                    ),
                    ProfileWidget(
                      icon: Icons.share,
                      title: 'Share',
                    ),
                    GestureDetector(
                      onTap: (){
                        controller.signOut();
                      },
                      child: ProfileWidget(
                        icon: Icons.logout,
                        title: 'Log Out',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showBottomSheet(BuildContext context) {
    Get.lazyPut(() => ProfileServicesControllerImp());
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Please choose Image',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  controller.getImageFromGallery();
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: const Icon(
                          Icons.photo_outlined,
                          size: 20,
                        ),
                      ),
                      Text(
                        'From Gallary',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.getImageFromCamera();
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: const Icon(
                          Icons.camera,
                          size: 20,
                        ),
                      ),
                      Text(
                        'From Camera',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
