import 'package:cz3002_iattend/globalenv.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:logger/logger.dart';
import 'dart:math' as math;
import 'dart:io';
import 'package:cz3002_iattend/Services/LocatorService.dart';
import 'package:cz3002_iattend/Services/CameraService.dart';
import 'package:cz3002_iattend/Services/FaceDetectorService.dart';
import 'package:cz3002_iattend/Widget/CameraWidget.dart';
import 'package:cz3002_iattend/Services/MLService.dart';

class FacialDetectionPage extends StatefulWidget {
  const FacialDetectionPage({ Key? key }) : super(key: key);

  @override
  State<FacialDetectionPage> createState() => _FacialDetectionPageState();
}

class _FacialDetectionPageState extends State<FacialDetectionPage> {
  final CameraService _cameraService = locator<CameraService>();
  final FaceDetectorService _detectorService = locator<FaceDetectorService>();
  final MLService _mlService = locator<MLService>();
  final log = Logger();
  bool faceDetected = false;
  XFile? imagepath;
  bool imageTaken = false;
  String outputText = "Please show face";


  //will be passed to the camera widget so it will be executed when it is streaming images
  void onFaceDetected(CameraImage image, Face? face){
    setState(() async {
      if(face != null){
        outputText="Face detected";
        _cameraService.cameraController?.pausePreview();
        // faceDetected = true;
        predictedData = _mlService.setCurrentPrediction(image, _detectorService.faces[0]);
        // print(predictedData);
        // Navigator.push(context, MaterialPageRoute(builder: (context) => AuthLoadingPage()));
      }
      else{outputText="Please show your face to the camera for attendance verification";}
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Widget heading;
    Widget body;
    // Widget body= Camera(onFaceDeteced: onFaceDetected)

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

    if(!faceDetected){
      body = Camera(onFaceDeteced: onFaceDetected);}
    else{
      body = Transform(
        transform: Matrix4.rotationY(math.pi),
        alignment: Alignment.center,
        child: Image.file(File(imagepath!.path), fit: BoxFit.fill,),
      );}

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
                              SizedBox(width: width, height: height * 0.6,child: Center(child: body)),
                              const SizedBox(height: 50),
                              Text(outputText,textAlign: TextAlign.center),
                            ]))))));

  }
}