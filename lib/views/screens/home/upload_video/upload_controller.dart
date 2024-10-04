import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';

class UploadController extends GetxController {

  compressVideoFile(String videoFilePath) async {
    await VideoCompress.compressVideo(path)
  }
}