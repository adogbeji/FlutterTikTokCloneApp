import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';

class UploadController extends GetxController {

  compressVideoFile(String videoFilePath) async {
    final compressedVideoFilePath = await VideoCompress.compressVideo(videoFilePath, quality: VideoQuality.LowQuality);  // Stores compressed video file path

    return compressedVideoFilePath!.file;  // Returns compressed video
  }
}