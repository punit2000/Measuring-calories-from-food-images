import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter_auth/Screens/Dashboard/dashboard_screen.dart';
import 'package:flutter_auth/Screens/Dashboard/bmiinput_screen.dart';

import 'package:flutter_auth/Screens/Dashboard/profile_screen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List _children = [
    MyHomePage(),
    InputPage(),
    EditProfilePage()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //const Color(0xFFE9E9E9),
      body: _children[_currentIndex], // new
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          child: BottomNavigationBar(
            iconSize: 40,
            selectedIconTheme: IconThemeData(
              color: const Color(0xFF6161A1),
            ),
            unselectedIconTheme: IconThemeData(
              color: Colors.white,
            ),
            onTap: onTabTapped, // new
            currentIndex: _currentIndex, // new
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              new BottomNavigationBarItem(icon: Icon(Icons.fitness_center), title: Text('BMI')),
              new BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile'))
            ],
          )),
    );
  }
}
