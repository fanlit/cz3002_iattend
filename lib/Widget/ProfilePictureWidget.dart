// ignore_for_file: unnecessary_const

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cz3002_iattend/globalenv.dart';
import 'package:cz3002_iattend/Services/FileImageService.dart';

class ProfilePicture extends StatelessWidget {
  ProfilePicture({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    String defaultImagePath = 'assets/images/tim.jpg'; //default if no user photo
    File profilePicImage = getImage();
    ImageProvider imageProvider;

    if(profilePicImage.existsSync()){ //use user picture if it exists 
      imageProvider = FileImage(profilePicImage); 
    }
    else{
      imageProvider = AssetImage(defaultImagePath);
    }

    return Container(//Image
      child: Center(child: 
        CircleAvatar(
          backgroundImage: imageProvider,
          radius: 70,
        ),
      ),          
    );
  }
}