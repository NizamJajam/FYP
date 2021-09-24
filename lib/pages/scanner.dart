import 'dart:convert';

import 'package:FaceNetAuthentication/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:barcode_scan/barcode_scan.dart';


class Scanner extends StatefulWidget {

 //this function sends data to php
  const Scanner({this.username});
  final String username;

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  @override
  initState() {
    super.initState();
  }

  String barcode ="";
  List <String> result;
  String classname ="";
  String lecturerfname ="";
  String lecturerlname ="";
  String classcode = "";
  String attendanceid ="";
  String classyear ="";
  String fulltext="";
  var _firstPress=true;
  Future<List> senddata() async{
    final response = await http.post("https://fyp2nizamwebsite.000webhostapp.com/takeattendance.php", body: {
      "subject_id": result[5],
      "student_id": widget.username,

    });
    var datauser = json.decode(response.body);
    return datauser;

  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException{
      setState(() => this.barcode = 'scan properly please');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text("Hello, " + widget.username),
        centerTitle: true,
        actions: <Widget>[

        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
                if (_firstPress){
                  _firstPress = false;
                  await senddata();
                }

                },
        label: Text("Sign in"),
        icon: Icon(Icons.thumb_up),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text("SCAN QR"),
                textColor: Colors.white,
                color: Colors.pinkAccent,
                onPressed: (){
                  scan();
                  result = barcode.split(',');
                  classcode = result[0];
                  classname = result[1];
                  classyear = result [2];
                  lecturerfname = result [3];
                  lecturerlname = result [4];
                  attendanceid = result [5];
                  fulltext = "Code: "+ classcode + "\n"+"Class: "+ classname + " \n"+ "Lecturer: "+ lecturerfname+ " "+ lecturerlname;
                },
              ),
              Text(
                  fulltext,
              ),
            ],
          )
      ),
    );
  }
}
