// A widget that displays the picture taken by the user.
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:FaceNetAuthentication/pages/profile.dart';
import 'package:FaceNetAuthentication/pages/home.dart';
//doesn't work lmao
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display Picture taken'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: (){
                Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => Profile()));
              })
        ],
      ),

      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      //Image.file(File(imagePath))
      body: Center(child: Container(child: Image.file(File(imagePath)))),
    );
  }
}
