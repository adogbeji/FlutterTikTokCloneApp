import 'dart:io';

import 'package:get/get.dart';

class AuthController extends GetxController {

  late Rx<File?> _pickedFile;  // Stores image user picked from phone gallery
  File? get profileImage => _pickedFile.value;


  void chooseImageFromGallery() async {}
}