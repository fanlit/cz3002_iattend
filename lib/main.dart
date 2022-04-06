import 'package:cz3002_iattend/Services/AuthenticationService.dart';
import 'package:cz3002_iattend/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cz3002_iattend/Services/LocatorService.dart';
import 'package:cz3002_iattend/Services/FileImageService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  setupServices(); //initialize the singleton
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setApplicationDirectory();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
    Widget build(BuildContext context) {
      return StreamProvider<User?>.value(
        initialData: null,
        value: AuthenticationService().user,
        child: MaterialApp(
          title: 'iAttend',
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
          ),
          home: Wrapper(),
        ),
      );
    }
}
