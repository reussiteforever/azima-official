import 'package:flutter/material.dart';

import 'home/home_screen.dart';
import 'home/sliding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Azima',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}