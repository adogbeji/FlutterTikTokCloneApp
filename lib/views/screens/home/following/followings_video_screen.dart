import 'package:flutter/material.dart';

class FollowingsVideoScreen extends StatefulWidget {
  const FollowingsVideoScreen({super.key});

  @override
  State<FollowingsVideoScreen> createState() => _FollowingsVideoScreenState();
}

class _FollowingsVideoScreenState extends State<FollowingsVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Followings Video Screen'),
      ),
    );
  }
}