// ignore_for_file: prefer_const_constructors, avoid_init_to_null, prefer_conditional_assignment

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:logger/logger.dart';

class FaceDetectorService{
  late FaceDetector? _faceDetector = null;
  List<Face> _faces = [];
  
  FaceDetector? get faceDetector => _faceDetector;
  List<Face> get faces => _faces;
  bool get faceDetected => _faces.isNotEmpty;

  final log = Logger();

  void initialize(){    
    if(_faceDetector == null) {
      _faceDetector = GoogleMlKit.vision.faceDetector(FaceDetectorOptions(mode: FaceDetectorMode.fast,));
    }    
  }

  dispose(){
    _faceDetector?.close();
    _faceDetector = null;
    _faces = [];
  }

  Future<void> detectFacesFromImage(CameraImage image, InputImageRotation imageRotation) async{
    //process camera image into input image to feed into ml kit to find faces
    final planeData = image.planes.map((Plane plane){
      return InputImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow, 
          height:plane.height, 
          width:plane.width);
    }).toList();

    final WriteBuffer allBytes = WriteBuffer();

    for (Plane plane in image.planes){
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize = Size(image.width.toDouble(), image.height.toDouble());

    final InputImageFormat inputImageFormat = InputImageFormatMethods.fromRawValue(image.format.raw) ?? InputImageFormat.NV21;

    final inputImageData = InputImageData(
      size: imageSize,
      imageRotation: imageRotation,
      inputImageFormat: inputImageFormat,
      planeData: planeData,
    );

    final inputImage = InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

    _faces = (await _faceDetector?.processImage(inputImage))!;
    log.d("Faces deteced = ${_faces.length}");
  }

}