import 'package:cz3002_iattend/globalenv.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:logger/logger.dart';

import 'package:cz3002_iattend/Services/LocatorService.dart';
// import 'package:cz3002_iattend/Services/CameraService.dart';
import 'package:cz3002_iattend/Services/FaceDetectorService.dart';
import 'package:cz3002_iattend/Widget/CameraWidget.dart';

class FacialDetectionPage extends StatefulWidget {
  const FacialDetectionPage({ Key? key }) : super(key: key);

  @override
  State<FacialDetectionPage> createState() => _FacialDetectionPageState();
}

class _FacialDetectionPageState extends State<FacialDetectionPage> {
  // final CameraService _cameraService = locator<CameraService>();
  final FaceDetectorService _detectorService = locator<FaceDetectorService>();

  final log = Logger();

  XFile? imageFile; 
  bool imageTaken = false;
  String outputText = "Please show face";

  void onFaceDected(){ //TODO
    setState(() {
      if(_detectorService.faceDetected){outputText="Face detected";}
      else{outputText="Please show face";}
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
      ]
    );
    

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
                              SizedBox(width: width, height: height * 0.6,child: Center(child: Camera(onFaceDeteced: onFaceDected,))),
                              const SizedBox(height: 50),
                              Text(outputText),
                            ]))))));

  }

}

