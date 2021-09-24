import 'package:FaceNetAuthentication/pages/profile.dart';
import 'package:flutter/material.dart';

class MyClasses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Classes"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Profile()
                  ),
                );

              })
        ],
      ),
      body: Center(
          child: CircularProgressIndicator()
      ),
    );
  }
}
