import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'AuthenticationService.dart';
import 'package:cz3002_iattend/globalenv.dart';

setApplicationDirectory() async{
  final directory = await getApplicationDocumentsDirectory();
  applicationDirectory = directory.path;
}

saveImage(File imageFile, String username) async{
  await imageFile.copy('${applicationDirectory}/$username.jpg');
}

File getImage(){
  String username = AuthenticationService().getCurrentDisplayName().toString();
  return File('${applicationDirectory}/$username.jpg'); 
}
