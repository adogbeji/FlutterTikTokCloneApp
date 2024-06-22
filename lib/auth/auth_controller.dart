import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  late Rx<File?> _pickedFile;  // Stores image picked from phone gallery
  File? get profileImage => _pickedFile.value;
  
  // FUNCTION TO PICK IMAGE FROM PHONE GALLERY
  void chooseImageFromGallery() async {
    // Stores image picked from phone gallery
    final pickedImageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImageFile != null) {  // Snackbar shown if profile picture selected
      Get.snackbar(
        'Profile Image',
        'Successfully selected profile image!',
      );
    }

    _pickedFile = Rx<File?>(File(pickedImageFile!.path));
  }

  // FUNCTION TO CAPTURE IMAGE USING PHONE CAMERA
  void captureImageWithCamera() async {
    // Stores image captured wit phone camera
    final pickedImageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImageFile != null) {  // Snackbar shown if profile picture captured
      Get.snackbar(
        'Profile Image',
        'Successfully captured profile image!',
      );
    }

    _pickedFile = Rx<File?>(File(pickedImageFile!.path));
  }
}