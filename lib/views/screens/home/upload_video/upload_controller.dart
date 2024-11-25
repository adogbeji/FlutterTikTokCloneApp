import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/views/screens/home/upload_video/video.dart';
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
      DocumentSnapshot userDocumentSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
      String videoID = DateTime.now().millisecondsSinceEpoch.toString();

      // 1) Upload Video To Firebase Storage
      String videoDownloadURL = await uploadCompressedVideo(videoID, videoFilePath);  // Stores download URL
    
      // 1) Upload Thumbnail To Firebase Storage
      String thumbnailDownloadURL = await uploadThumbnailImage(videoID, videoFilePath);  // Stores download URL
    
      // 3) Save video info to Firestore Database
      Video videoObect = Video(
        userID: FirebaseAuth.instance.currentUser!.uid,
        userName: (userDocumentSnapshot.data() as Map<String, dynamic>)['name'],
        userProfileImage: (userDocumentSnapshot.data() as Map<String, dynamic>)['image'],
        videoID: videoID,
        totalComments: 0,
        totalShares: 0,
        likesList: [],
        artistSongName: artistSongName,
        descriptionTags: descriptionTags,
        videoUrl: videoDownloadURL,
        thumbnailUrl: thumbnailDownloadURL,
        publishedDateTime: DateTime.now().millisecondsSinceEpoch,
      );
    } catch (errorMsg) {
      Get.snackbar(
        'Video Upload Unsuccessful', 
        'You video could not be uploaded due to an error. Try again.'
      );
    }
  }
}