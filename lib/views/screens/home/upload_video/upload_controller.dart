import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadController extends GetxController {

  compressVideoFile(String videoFilePath) async {
    final compressedVideoFilePath = await VideoCompress.compressVideo(videoFilePath, quality: VideoQuality.LowQuality);  // Stores compressed video file path

    return compressedVideoFilePath!.file;  // Returns compressed video
  }

  uploadCompressedVideo(String videoID, String videoFilePath) async {
    UploadTask videoUploadTask = FirebaseStorage.instance
                                                .ref()
                                                .child('All Videos')
                                                .child(videoID)
                                                .putFile(await compressVideoFile(videoFilePath));

    TaskSnapshot snapshot = await videoUploadTask;

    String downloadURL = await snapshot.ref.getDownloadURL();  // Stores download URL

    return downloadURL;
  }

  getThumbnailImage(String videoFilePath) async {
    final thumbnailImage = await VideoCompress.getFileThumbnail(videoFilePath);  // Stores video thumbnail image

    return thumbnailImage;
  }

  uploadThumbnailImage(String videoID, String videoFilePath) async {
    UploadTask thumbnailUploadTask = FirebaseStorage.instance
                                                .ref()
                                                .child('All Thumbnails')
                                                .child(videoID)
                                                .putFile(await getThumbnailImage(videoFilePath));

    TaskSnapshot snapshot = await thumbnailUploadTask;

    String downloadURL = await snapshot.ref.getDownloadURL();  // Stores download URL

    return downloadURL;
  }

  saveVideoInfo(String artistSongName, String descriptionTags, String videoFilePath, BuildContext context) async {
    
    try {
      String videoID = DateTime.now().millisecondsSinceEpoch.toString();

      // 1) Upload Video To Firebase Storage
      await uploadCompressedVideo(videoID, videoFilePath);
    } catch (errorMsg) {
      Get.snackbar(
        'Video Upload Unsuccessful', 
        'You video could not be uploaded due to an error. Try again.'
      );
    }
  }
}