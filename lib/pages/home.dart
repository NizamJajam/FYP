import 'package:FaceNetAuthentication/pages/db/database.dart';
import 'package:FaceNetAuthentication/pages/sign-in.dart';
import 'package:FaceNetAuthentication/pages/sign-up.dart';
import 'package:FaceNetAuthentication/services/facenet.service.dart';
import 'package:FaceNetAuthentication/services/ml_vision_service.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

//HomePage is stateful
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //on top are the initializations that will occur when app starts
  //i know i am confused too but hey it works
  FaceNetService _faceNetService = FaceNetService();
  MLVisionService _mlVisionService = MLVisionService();
  DataBaseService _dataBaseService = DataBaseService();

  CameraDescription cameraDescription;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _startUp();
  }


  _startUp() async {
    _setLoading(true);

    //this obtains a list of available cameras
    List<CameraDescription> cameras = await availableCameras();

    //uses front camera
    cameraDescription = cameras.firstWhere(
      (CameraDescription camera) => camera.lensDirection == CameraLensDirection.front,
    );

    // start the services, loads the facenet model lmao
    await _faceNetService.loadModel();
    await _dataBaseService.loadDB();
    _mlVisionService.initialize();

    _setLoading(false);
  }

  // shows or hides the circular progress indicator
  _setLoading(bool value) {
    setState(() {
      loading = value;
    });
  }
//the User Interface Design
//Honestly this shit is pretty simple from a design perspective
//Your UI design skills are still terrible my man
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SMART HADIR V2'),
        centerTitle: true,
        leading: Container(),
      ),
      floatingActionButton: FloatingActionButton(child: Text('debug'),
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => SignUp(
                cameraDescription: cameraDescription,
              ),
            ),
          );
        },),
      //if still loading, show container
      body: !loading
          ? Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                    "assets/clocktower.jpg",
                    fit:BoxFit.cover,

                ),

                Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
                  Container(

                  ),
                  RaisedButton(
                    child: Text('Sign In'),
                    textColor: Colors.white,
                    color: Colors.pinkAccent,

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SignIn(
                            cameraDescription: cameraDescription,
                          ),
                        ),
                      );
                    },
                  ),
                  // FloatingActionButton(
                  //   child: Text('debug'),
                  //   backgroundColor: Colors.pinkAccent,
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (BuildContext context) => SignUp(
                  //           cameraDescription: cameraDescription,
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                  // RaisedButton(
                  //   child: Text('Clean DB'),
                  //   onPressed: () {
                  //     _dataBaseService.cleanDB();
                  //   },
                  // ),
                ],
              ),
              ],
            )
          //if not loading, it shows a circular progress indicator
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
