import 'package:cz3002_iattend/globalenv.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:math' as math;
import 'dart:io';

import 'package:cz3002_iattend/Services/LocatorService.dart';
import 'package:cz3002_iattend/Services/CameraService.dart';
// import 'package:cz3002_iattend/Services/FaceDetectorService.dart';
import 'package:cz3002_iattend/Widget/CameraWidget.dart';

class PhotoTakingPage extends StatefulWidget {
  PhotoTakingPage({ Key? key }) : super(key: key);

  @override
  State<PhotoTakingPage> createState() => _PhotoTakingPageState();

}

class _PhotoTakingPageState extends State<PhotoTakingPage> {
  final CameraService _cameraService = locator<CameraService>();
  XFile? imageFile;

  bool imageTaken = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Widget heading, body, floatingActionButton;

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

    //if image not yet taken will display camera 
    if(!imageTaken){
      body = Camera(onFaceDeteced: (){});

      floatingActionButton = FloatingActionButton(
        onPressed: () async {
          imageFile = await _cameraService.takePicture(context);
          if(imageFile != null){
            setState(() {
              imageTaken = true; 
            });
          
          }
        }, child: const Icon(Icons.camera));
    }
    //if image take will display the captured image
    else{
      body = Transform(
        transform: Matrix4.rotationY(math.pi),
        alignment: Alignment.center,
        child: Image.file(File(imageFile!.path), fit: BoxFit.fill,),
      );

      floatingActionButton = FloatingActionButton(
        onPressed: (){
          //TODO
        }, child: const Text("Save"));
    }


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
                              SizedBox(width: width, height: height * 0.6,child: body),
                            ]))))
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: floatingActionButton,
      );
  }
}
