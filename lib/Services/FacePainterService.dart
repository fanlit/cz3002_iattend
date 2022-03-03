import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class FacePainter extends CustomPainter{
  final Face? face;
  final Size imageSize;
  InputImageRotation rotation;
  final log = Logger();
  

  FacePainter({required this.face, required this.imageSize, required this.rotation});

  @override
  void paint(Canvas canvas, Size size) {
    if(face == null) return;
    Paint paint;

    paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3.0
    ..color = Colors.green;
    
    canvas.drawRect(
      Rect.fromLTRB(
        translateX(face!.boundingBox.left, rotation, size, imageSize),
        translateY(face!.boundingBox.top, rotation, size, imageSize),
        translateX(face!.boundingBox.right, rotation, size, imageSize),
        translateY(face!.boundingBox.bottom, rotation, size, imageSize),
      ),
      paint,
    );

  }

  @override
  bool shouldRepaint(FacePainter oldDelegate) {
    return oldDelegate.imageSize != imageSize || oldDelegate.face != face;
  }

  double translateX(double x, InputImageRotation rotation, Size size, Size absoluteImageSize) {
    switch (rotation) {
      case InputImageRotation.Rotation_90deg:
      case InputImageRotation.Rotation_270deg:
        return size.width - x * size.width / absoluteImageSize.height;
      default:
        return x * size.width / absoluteImageSize.width;
    }
  }

  double translateY(double y, InputImageRotation rotation, Size size, Size absoluteImageSize) {
    switch (rotation) {
      case InputImageRotation.Rotation_90deg:
      case InputImageRotation.Rotation_270deg:
        return y * size.height /absoluteImageSize.width;
      default:
        return y * size.height / absoluteImageSize.height;
    }
  }

}