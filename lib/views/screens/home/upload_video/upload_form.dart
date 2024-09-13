import 'dart:io';

import 'package:flutter/material.dart';

class UploadForm extends StatefulWidget {
  const UploadForm({super.key, required this.videoFile, required this.videoPath});

  final File videoFile;
  final String videoPath;

  @override
  State<UploadForm> createState() => _UploadFormState();
}

class _UploadFormState extends State<UploadForm> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Upload Form'),
      ),
    );
  }
}