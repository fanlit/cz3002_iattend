import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:cz3002_iattend/globalenv.dart';

setApplicationDirectory() async{
  final directory = await getApplicationDocumentsDirectory();
  applicationDirectory = directory.path;
}

saveImage(File imageFile, String uid) async{
  await imageFile.copy('${applicationDirectory}/$uid.jpg');
}

File getImage(String uid){
  return File('${applicationDirectory}/$uid.jpg');
}
