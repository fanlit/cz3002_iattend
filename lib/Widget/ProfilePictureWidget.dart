// ignore_for_file: unnecessary_const

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cz3002_iattend/globalenv.dart';

class ProfilePicture extends StatelessWidget {
  ProfilePicture({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String defaultImagePath = 'assets/images/tim.jpg'; //default if no user photo
    String profilePath = profilePicturePath;  //user photo location
    File profilefile = File(profilePath);

    ImageProvider imageProvider;

    if(profilePath!=""){
      imageProvider = FileImage(profilefile);
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