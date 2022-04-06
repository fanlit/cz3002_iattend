import 'dart:math';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as imglib;
import 'package:cz3002_iattend/globalenv.dart';
import 'ImageConverter.dart';

class MLService {
  late Interpreter _interpreter;
  double threshold = 0.7;

  late List _predictedData;
  List get predictedData => _predictedData;

  Future initialize() async {
    try {
      this._interpreter = await Interpreter.fromAsset('mobilefacenet.tflite',);
    } catch (e) {
      print('Failed to load model.');
      print(e);
    }
  }

  Float32List imageToByteFloat32List(imglib.Image image) {
    var convertedBytes = Float32List(1 * 112 * 112 * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;

    for (var i = 0; i < 112; i++) {
      for (var j = 0; j < 112; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (imglib.getRed(pixel) - 128) / 128;
        buffer[pixelIndex++] = (imglib.getGreen(pixel) - 128) / 128;
        buffer[pixelIndex++] = (imglib.getBlue(pixel) - 128) / 128;
      }
    }
    return convertedBytes.buffer.asFloat32List();
  }

  imglib.Image _convertCameraImage(CameraImage image) {
    var img = convertToImage(image);
    var img1 = imglib.copyRotate(img!, -90);
    return img1;
  }

  // function to extract the facial image by cropping the original captured image
  imglib.Image _cropFace(CameraImage image, Face faceDetected) {
    imglib.Image convertedImage = _convertCameraImage(image);
    double x = faceDetected.boundingBox.left - 10.0;
    double y = faceDetected.boundingBox.top - 10.0;
    double w = faceDetected.boundingBox.width + 10.0;
    double h = faceDetected.boundingBox.height + 10.0;
    return imglib.copyCrop(
        convertedImage, x.round(), y.round(), w.round(), h.round());
  }

  List _preProcess(CameraImage image, Face faceDetected) {
    imglib.Image croppedImage = _cropFace(image, faceDetected);
    imglib.Image img = imglib.copyResizeCropSquare(croppedImage, 112);

    Float32List imageAsList = imageToByteFloat32List(img);
    return imageAsList;
  }

  List setCurrentPrediction(CameraImage cameraImage, Face face) {
    List input = _preProcess(cameraImage, face);

    input = input.reshape([1, 112, 112, 3]);
    List output = List.generate(1, (index) => List.filled(192, 0));

    // run the preprocessed image through the MobileFacenet CNN module.
    _interpreter.run(input, output);
    output = output.reshape([192]);

    this._predictedData = List.from(output);
    return this._predictedData;
  }

  double _euclideanDistance(List e1, List e2) {
    if (e1 == null || e2 == null) throw Exception("Null argument");

    double sum = 0.0;
    for (int i = 0; i < e1.length; i++) {
      sum += pow((e1[i] - e2[i]), 2);
    }
    return sqrt(sum);
  }

  bool searchResult(List predictedData) {
    double currDist = 0.0;

    currDist = _euclideanDistance(userFaceArray, predictedData);
    if(currDist <= threshold){
      return true;
    }
    else{return false;}
  }

  dispose() {

  }
}





