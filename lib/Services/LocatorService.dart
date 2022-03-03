import 'package:get_it/get_it.dart';

import 'CameraService.dart';
import 'FaceDetectorService.dart';

final locator = GetIt.instance;

//singleton implementation 
void setupServices(){
  locator.registerLazySingleton<CameraService>(() => CameraService());
  locator.registerLazySingleton<FaceDetectorService>(() => FaceDetectorService());
}