import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:tiktok_clone/models/user.dart' as userModel;
import 'package:tiktok_clone/models/utils/global.dart';
import 'package:tiktok_clone/views/screens/auth/login_screen.dart';
import 'package:tiktok_clone/views/screens/auth/register_screen.dart';
import 'package:tiktok_clone/views/screens/home/home_screen.dart';

class AuthController extends GetxController {

  static AuthController instanceAuth = Get.find();  // Stores instance of AuthController class
  late Rx<User?> _currentUser;  // Stores instance of user

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
    try {
      // 1) Create new user in Firebase authentication
      UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: userEmail, 
          password: userPassword
        );  // Creates user account using email & password

      // 2) Save user profile image to Firebase storage
      String imageDownloadURL = await uploadImageToStorage(imageFile);

      // 3)  Save user data to Firestore database
      userModel.User user = userModel.User(
        name: userName,
        email: userEmail,
        image:imageDownloadURL,
        uid: credential.user!.uid,
      );

      await FirebaseFirestore.instance
        .collection('users')
        .doc(credential.user!.uid)
        .set(user.toJson());
    } catch (e) {
      Get.snackbar(
        'Account Creation Failed',
        'Error Occurred. Try Again!'
      );
      
      showProgressBar = false;
      // Get.to(const LoginScreen());
    }
  }

  // Uploads profile picture to Firebase Storage
  Future<String> uploadImageToStorage(File imageFile) async {
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('Profile Images')
        .child(FirebaseAuth.instance.currentUser!.uid);  // Stores user uid for image
    
    UploadTask uploadTask = reference.putFile(imageFile);  // Stores uploaded image
    TaskSnapshot taskSnapshot = await uploadTask;  // Stores result of uploading image

    String downloadURL = await taskSnapshot.ref.getDownloadURL();  // Stores image download URL

    return downloadURL;
  }

  // Logs in users
  void loginUserNow(String userEmail, String userPassword) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail, 
        password: userPassword,
      );  // Logs in user withemail and password

      Get.snackbar(
        'Login Successful',
        'Welcome to the app!'
      );
      
      showProgressBar = false;
      // Get.to(const RegisterScreen());
    } catch (e) {
      Get.snackbar(
        'Login Failed',
        'Error Occurred. Try Again!'
      );
      
      showProgressBar = false;
      Get.to(const RegisterScreen());
    }
  }

  // Sends users to home screen dashboard if they're logged in
  // goToScreen(User? currentUser) {
  //   // If user is not logged in
  //   if (currentUser == null) {
  //     Get.offAll(const LoginScreen());
  //   } else {
  //     Get.offAll(const HomeScreen());
  //   }
  // }

  // @override
  // void onReady() {
  //   // TODO: implement onReady
  //   super.onReady();

  //   _currentUser = Rx<User?>(FirebaseAuth.instance.currentUser);  // Current user state
  //   _currentUser.bindStream(FirebaseAuth.instance.authStateChanges());  // Handles curent user state
  //   ever(_currentUser, goToScreen);
  // }
}