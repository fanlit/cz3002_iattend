// ignore_for_file: unused_field, avoid_init_to_null, avoid_print

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:logger/logger.dart';
import 'LocatorService.dart';
import 'FaceDetectorService.dart';

class CameraService{
  final FaceDetectorService _detectorService = locator<FaceDetectorService>();

  late CameraController? _cameraController = null;
  late InputImageRotation _cameraRotation;
  late String? _imagePath;
  late XFile? _imageFile;

  final log = Logger();

  CameraController? get cameraController => _cameraController;
  InputImageRotation get cameraRotation => _cameraRotation;
  String? get imagePath => _imagePath;
  XFile? get imageFile => _imageFile;

  Future<void> initialize() async{
    if(_cameraController == null){
      CameraDescription description = await _getCameraDescription();
      await _setupCameraController(description: description);
      _cameraRotation = rotationIntToImageRotation(description.sensorOrientation);
    }
    log.d("Orientation is ${_cameraRotation}");
  }

  dispose() async{
    if(_cameraController == null){return;}
    await _cameraController?.dispose();
    _cameraController = null;
  }

  //get available camera and the front camera will be used 
  Future<CameraDescription> _getCameraDescription() async {
    List<CameraDescription> cameras = await availableCameras();

    if(cameras.length != 1){
      return cameras.firstWhere((CameraDescription camera) => 
      camera.lensDirection == CameraLensDirection.front);
    }

    return cameras[0];
  }

  Future _setupCameraController({required CameraDescription description}) async{
    _cameraController = CameraController(
      description, 
      ResolutionPreset.low,
      enableAudio: false,
      );
    await _cameraController?.initialize();
  }

  InputImageRotation rotationIntToImageRotation(int rotation){
    switch(rotation){
      case 90:
        return InputImageRotation.Rotation_90deg;
      case 180:
        return InputImageRotation.Rotation_180deg;
      case 270:
        return InputImageRotation.Rotation_270deg;
      default:
        return InputImageRotation.Rotation_0deg;
    }
  }

  Future<XFile?> takePicture(dynamic context) async{

    await Future.delayed(const Duration(milliseconds: 700));
    await _cameraController?.stopImageStream();
    await Future.delayed(const Duration(milliseconds: 300));
    _imageFile = await _cameraController!.takePicture();
    _imagePath = _imageFile?.path;
    return _imageFile;
  }

  Size? getImageSize(){
    if(_cameraController == null){return null;}
    return _cameraController!.value.previewSize;
  }

}