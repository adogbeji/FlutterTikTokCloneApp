import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {

  static AuthController instanceAuth = Get.find();  // Stores instance of AuthController class

  late Rx<File?> _pickedFile;  // Stores image user picked from phone gallery
  File? get profileImage => _pickedFile.value;

  
  // Picks image from phone gallery
  void chooseImageFromGallery() async {

    final pickedImageFile = await ImagePicker().pickImage(source: ImageSource.gallery);  // Stores picked image

    if (pickedImageFile != null) {
      Get.snackbar(
        'Profile Image', 
        'Profile picture chosen!',
      );
    }

    _pickedFile = Rx<File?>(File(pickedImageFile!.path));  // Converts picked image to type Rx<File>
  }

  // Captures image with phone camera
  void captureImageWithCamera() async {

    final pickedImageFile = await ImagePicker().pickImage(source: ImageSource.camera);  // Stores captured image

    if (pickedImageFile != null) {
      Get.snackbar(
        'Profile Image', 
        'Profile picture captured!',
      );
    }

    _pickedFile = Rx<File?>(File(pickedImageFile!.path));  // Converts captured image to type Rx<File>
  }
  
  // Creates new user account
  void createAccountForNewUser(File imageFile, String userName, String userEmail, String userPassword) async {
    // 1) Create new user in Firebase authentication
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: userEmail, 
          password: userPassword
        );  // Creates user account using email & password

    // 2) Save user profile image to Firebase storage

    // 3)  Save user data to Firestore database
  }
}