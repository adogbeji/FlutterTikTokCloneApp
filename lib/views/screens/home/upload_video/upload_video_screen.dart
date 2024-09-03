import 'package:flutter/material.dart';

class UploadVideoScreen extends StatefulWidget {
  const UploadVideoScreen({super.key});

  @override
  State<UploadVideoScreen> createState() => _UploadVideoScreenState();
}

class _UploadVideoScreenState extends State<UploadVideoScreen> {
  displayDialogBox() {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          SimpleDialogOption(
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/upload.png', width: 260,),

            const SizedBox(height: 20,),

            ElevatedButton(
              onPressed: () {}, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text('Upload New Video', style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),),
          ],
        ),
      ),
    );
  }
}