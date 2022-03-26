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
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.deepOrange,
          ),
          home: Wrapper(),
        ),
      );
    }
}
