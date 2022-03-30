import 'dart:io';
import 'package:cz3002_iattend/globalenv.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:logger/logger.dart';
import 'package:cz3002_iattend/Services/LocatorService.dart';
import 'package:cz3002_iattend/Services/CameraService.dart';
import 'package:cz3002_iattend/Services/FaceDetectorService.dart';
import 'package:cz3002_iattend/Widget/CameraWidget.dart';
import 'package:cz3002_iattend/Services/MLService.dart';


class FacialAuthenticationPage extends StatefulWidget {
  String joiningCode;
  FacialAuthenticationPage({Key? key, required this.joiningCode}) : super(key: key);
  @override
  State<FacialAuthenticationPage> createState() => _FacialAuthenticationPageState();
}

class _FacialAuthenticationPageState extends State<FacialAuthenticationPage> {
  final CameraService _cameraService = locator<CameraService>();
  final FaceDetectorService _detectorService = locator<FaceDetectorService>();
  final MLService _mlService = locator<MLService>();
  // final AttendanceDataService attendanceMngr = AttendanceDataService();
  int popCount = 1;
  final log = Logger();
  // XFile? imagepath;
  // bool imageTaken = false;
  bool authenticated = false;
  int dialogShown = 0;
  String outputText = "Please show your face to the camera for attendance verification";

  //Will be passed to the camera widget so it will be executed when it is streaming images
  void onFaceDetected(CameraImage image, Face? face) {
    bool authRes = false;
    setState(() {
      if (face != null && authenticated == false) {
        predictedData = _mlService.setCurrentPrediction(image, _detectorService.faces[0]);
        authRes = _mlService.searchResult(predictedData);
        if (authRes == true && authenticated == false) {
          authenticated == true;
          _cameraService.cameraController?.pausePreview();
          outputText = "User Authenticated!";
            dialogShown +=1;
          if(dialogShown==1){
            showDialog(
            context: context, 
            builder:(context)=> AlertDialog(
              title: const Text("Authenticated. Welcome!"),
              content: Text("Event code: ${widget.joiningCode}"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'OK');
                    Navigator.pop(context, authRes);
                    },
                  child: const Text('OK'),
                )],
              )          
            );
          }
        }
      } else {
        outputText =
            "Please show your face to the camera for attendance verification";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Widget heading;

    heading = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("iAttend",
              style: TextStyle(
                  fontSize: fonttitle,
                  color: Colors.deepOrange,
                  fontFamily: 'DMSans',
                  fontWeight: FontWeight.bold))
        ]);

    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
            child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                child: SingleChildScrollView(
                    child: Container(
                        // color: Colors.green,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                          const SizedBox(height: 50),
                          heading,
                          SizedBox(
                              width: width,
                              height: height * 0.6,
                              child: Center(
                                  child: Camera(onFaceDeteced: onFaceDetected))),
                          const SizedBox(height: 50),
                          Text(outputText, textAlign: TextAlign.center),
                    ]))))));
  }
}
