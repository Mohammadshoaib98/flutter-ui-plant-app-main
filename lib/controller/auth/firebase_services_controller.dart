import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

abstract class ProfileServicesController extends GetxController {
  getImageFromCamera();
  getImageFromGallery();
  signOut();
}

class ProfileServicesControllerImp extends ProfileServicesController {
 final FirebaseAuth _auth=FirebaseAuth.instance;
 
  XFile? pickedImageFile;
  File? imageFile;



  @override
 Future<void> getImageFromCamera() async {
    pickedImageFile =await ImagePicker().pickImage(source: ImageSource.camera);
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: pickedImageFile!.path, maxHeight: 2048, maxWidth: 2048);
    if (croppedImage != null) {
      imageFile = File(croppedImage.path);
    }
    update();
  }

  @override
  getImageFromGallery() async {
    pickedImageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: pickedImageFile!.path, maxHeight: 1080, maxWidth: 1080);
    if (croppedImage != null) {
      imageFile = File(croppedImage.path);
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  @override
 Future<void> signOut() async {
   await _auth.signOut();
   Get.offAllNamed(AppRoutes.signIn);
  }
}
