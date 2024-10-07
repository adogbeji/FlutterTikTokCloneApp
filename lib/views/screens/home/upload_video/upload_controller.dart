import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';

class UploadController extends GetxController {

  compressVideoFile(String videoFilePath) async {
    final compressedVideoFile = await VideoCompress.compressVideo(videoFilePath, quality: VideoQuality.LowQuality);

    return compressedVideoFile!.file;  // Returns compressed video
  }
}