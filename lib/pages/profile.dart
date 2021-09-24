

import 'dart:io';
import 'package:FaceNetAuthentication/pages/my_classes.dart';
import 'package:flutter/material.dart';
import 'package:FaceNetAuthentication/pages/widgets/display-picture-screen.dart';
import 'package:FaceNetAuthentication/pages/my_performance.dart';
import 'package:FaceNetAuthentication/pages/scanner.dart';
import 'package:FaceNetAuthentication/pages/sign-in.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'home.dart';



class Profile extends StatelessWidget {

  const Profile({Key key, @required this.username, this.imagePath}) : super(key: key);


  final String username;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    String studentName="";

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text(username),
              //tried to put taken picture in the drawer, but i am too dumb
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.pinkAccent,

                ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Profile Page"),
        actions: <Widget>[

          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage()
                  ),
                );
              })

        ],
        leading: Container(),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assets/umscanselor.jpg",
              fit:BoxFit.cover,

            ),
            Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Welcome back, " + username),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Scanner(
                                 username:username,
                              )
                          ),
                        );
                      },
                      child: Text("Scan QR"),
                      color: Colors.pinkAccent,
                      textColor: Colors.white,
                  ),
                  // RaisedButton(
                  //   onPressed: (){
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => MyClasses()
                  //       ),
                  //     );
                  //   },
                  //   child: Text("My Classes"),
                  //   color: Colors.pinkAccent,
                  //   textColor: Colors.white,
                  // ),
                ],
              ), Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // RaisedButton(
                  //   onPressed: (){
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => MyPerformance()
                  //       ),
                  //     );
                  //   },
                  //   child: Text("My Performance"),
                  //   color: Colors.pinkAccent,
                  //   textColor: Colors.white,
                  // ),
                  // RaisedButton(
                  //   onPressed: (){
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => DisplayPictureScreen()
                  //       ),
                  //     );
                  //   },
                  //   child: Text("Show Picture taken"),
                  //   color: Colors.pinkAccent,
                  //   textColor: Colors.white,
                  // ),
                ],
              ),

              // RaisedButton(
              //   child: Text('Logout'),
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => MyHomePage()
              //       ),
              //     );
              //   },
              // )
            ],
          ),
        ]
        ),
      ),
    );
  }
}
