import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            screenIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white12,
        currentIndex: screenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30,),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30,),
            label: 'Discover'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30,),
            label: 'Upload Video'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox_sharp, size: 30,),
            label: 'Following'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30,),
            label: 'Me'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30,),
            label: 'Home'
          ),
        ],
      ),
    );
  }
}