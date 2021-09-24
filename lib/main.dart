import 'package:FaceNetAuthentication/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:FaceNetAuthentication/pages/my_performance.dart';
import 'package:FaceNetAuthentication/pages/scanner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
