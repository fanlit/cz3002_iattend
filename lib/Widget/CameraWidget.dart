// ignore_for_file: avoid_init_to_null

import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';

import 'package:cz3002_iattend/Services/LocatorService.dart';
import 'package:cz3002_iattend/Services/CameraService.dart';
import 'package:cz3002_iattend/Services/FaceDetectorService.dart';
import 'package:cz3002_iattend/Services/FacePainterService.dart';


class Camera extends StatefulWidget {
  final Function(CameraImage image, Face? face) onFaceDeteced; 
  //pass in a function which tell what to do while detecting face  
  const Camera({ Key? key, required this.onFaceDeteced }) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  final CameraService _cameraService = locator<CameraService>();
  final FaceDetectorService _detectorService = locator<FaceDetectorService>();
  final log = Logger();

  bool _initializing = false;
  bool _detectingFaces = false;

  Face? faceDetected = null;
  Size? imageSize;

  @override
  void initState(){
    super.initState();
    _start();
  }

  @override
  void dispose(){
    _cameraService.dispose();
    _detectorService.dispose();
    super.dispose();
  }

  _start() async{
    setState(() {
      _initializing = true;
    });

    await _cameraService.initialize();
    _detectorService.initialize();

    setState(() {
      _initializing = false;
    });

    _detectFaces();
  }

  //stream the camera then perform face detecting 
  void _detectFaces(){
    log.d("Detecting faces now");
    InputImageRotation rotation = _cameraService.cameraRotation;
    imageSize = _cameraService.getImageSize();

    _cameraService.cameraController?.startImageStream((image) async {

      if(_detectingFaces) return;
      _detectingFaces = true;

      try{
        await _detectorService.detectFacesFromImage(image, rotation);
        if(_detectorService.faces.isNotEmpty){
          setState(() {
            faceDetected = _detectorService.faces[0]; 
            // widget.onFaceDeteced(image, faceDetected);
          });
        }
        else{
          setState(() {
            faceDetected = null;
          });
        }
        widget.onFaceDeteced(image, faceDetected);
        _detectingFaces = false;
      }
      catch(e){
        _detectingFaces = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    //if camera still initializing, will show progress  
    if(_initializing){
      body = const Center(child: CircularProgressIndicator(),);
    }
    //contain the camera preview which will display the camera and the painter to draw a box
    else if(_cameraService.cameraController != null){
      body = Stack(
          fit: StackFit.expand,
          children: <Widget>[
            CameraPreview(_cameraService.cameraController!),
            CustomPaint(painter: FacePainter(face: faceDetected, imageSize: imageSize!, rotation: _cameraService.cameraRotation),)
          ],
      );
      // body = Text("hi");
      // body = Stack(fit: StackFit.expand, children: <Widget>[CameraPreview(_cameraService.cameraController!)]);
    }
    else{
      body = const Text("Camera not working");
    }

    return Center(child: body);
    
  }

}