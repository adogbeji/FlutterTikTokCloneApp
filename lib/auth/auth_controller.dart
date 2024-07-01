import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthController extends GetxController {
  static AuthController instanceAuth = Get.find();


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
  
  // FUNCTION TO CREATE NEW USER ACCOUNT
  void createAccountForNewUser(File imageFile, String userName, String userEmail, String userPassword) async {
    // 1. Create user in Firebase authentication
    // UserCredential credential
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: userEmail, 
          password: userPassword,
        );

    // 2. Save user profile image to Firebase Storage
    String imageDownloadURL = await uploadImageToStorage(imageFile);

    // 3. Save user data to Firestore database
  }
  
  // FUNCTION TO UPLOAD PROFILE IMAGE TO FIREBASE STORAGE
  Future<String> uploadImageToStorage(File imageFile) {
    Reference reference = FirebaseStorage.instance.ref().child('Profile Images').child(FirebaseAuth.instance.currentUser!.uid);
  }
}