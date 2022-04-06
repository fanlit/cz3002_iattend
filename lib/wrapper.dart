import 'package:cz3002_iattend/HomePage.dart';
import 'package:cz3002_iattend/StartUpPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    if (user == null)  {
      return StartUpPage(title: 'iAttend Demo Home Page');
    }
    else {
      return HomePage();
    }
  }
}