import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import 'package:tiktok_clone/models/utils/global.dart';
import 'package:tiktok_clone/views/screens/home/upload_video/upload_controller.dart';
import 'package:tiktok_clone/views/widgets/input_text_widget.dart';

import 'package:video_player/video_player.dart';

class UploadForm extends StatefulWidget {
  const UploadForm({super.key, required this.videoFile, required this.videoPath});

  final File videoFile;
  final String videoPath;

  @override
  State<UploadForm> createState() => _UploadFormState();
}

class _UploadFormState extends State<UploadForm> {
  UploadController uploadVideoController = Get.put(UploadController()); 
  VideoPlayerController? playerController;
  TextEditingController artistSongTextEditingController = TextEditingController();
  TextEditingController descriptionTagsTextEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      playerController = VideoPlayerController.file(widget.videoFile);
    });

    playerController!.initialize();
    playerController!.play();
    playerController!.setVolume(2);
    playerController!.setLooping(true);  // Allows autoplay

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    playerController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Display video player
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.6,
              child: VideoPlayer(playerController!),
            ),

            const SizedBox(height: 30,),

            showProgressBar == true ? Container(
              child: const SimpleCircularProgressBar(
                  progressColors: [
                    Colors.green,
                    Colors.blueAccent,
                    Colors.red,
                    Colors.amber,
                    Colors.purpleAccent,
                  ],
                  animationDuration: 3,
                  backColor: Colors.white38,
                ),
            ): Column(
              children: [
              // ARTIST/SONG
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InputTextWidget(
                  textEditingController: artistSongTextEditingController,
                  labelString: 'Artist - Song',
                  iconData: Icons.music_video_sharp,
                  isObscure: false,
                ),
              ),

              const SizedBox(height: 10,),

              // DESCRIPTION TAGS
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InputTextWidget(
                  textEditingController: descriptionTagsTextEditingController,
                  labelString: 'Description - Tags',
                  iconData: Icons.slideshow_sharp,
                  isObscure: false,
                ),
              ),
              
              // UPLOAD BUTTON
              Container(
                width: MediaQuery.of(context).size.width,
                height: 54,
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),  
                child: InkWell(
                  onTap: () {
                    if (artistSongTextEditingController.text.isNotEmpty 
                          && descriptionTagsTextEditingController.text.isNotEmpty) {
                            uploadVideoController.saveVideoInfo(
                              artistSongTextEditingController.text, 
                              descriptionTagsTextEditingController.text, 
                              widget.videoPath, 
                              context
                            );

                            setState(() {
                              showProgressBar = true;
                            });
                          }

                    // setState(() {
                    //   showProgressBar = true;
                    // });
                  },
                  child: const Center(
                    child: Text('Upload Now', style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),),
                  ),
                ),              
              ),
              ],
            ),
          ],
        ),
      )
    );
  }
}