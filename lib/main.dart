import 'package:flutter/material.dart';
import 'RegisterPage.dart';
import 'globalenv.dart';
import 'LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const StartUpPage(title: 'iAttend Demo Home Page'),
    );
  }
}

class StartUpPage extends StatefulWidget {
  const StartUpPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<StartUpPage> createState() => _StartUpPageState();
}

// Start-up Page
class _StartUpPageState extends State<StartUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // color: Colors.green,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 100.0, left: 30, right: 30, bottom: 30),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        height: iconsize[0],
                        width: iconsize[1],
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/iAttendIcon.png')))),

                    Text("iAttend",
                        style: TextStyle(
                            fontSize: fonttitle,
                            color: Colors.deepOrange,
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.bold))
                  ]),
              const SizedBox(height: 150),
              SizedBox(
                  width: 262.0,
                  height: 52.0,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPageState()));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 30, fontFamily: 'DMSans'),
                      ))),
              const SizedBox(height: 50), // space between the 2 buttons
              SizedBox(
                  width: 262.0,
                  height: 52.0,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPageState()));
                      }, 
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 30, fontFamily: 'DMSans'),
                      )))
            ]),
      ),
    ));
  }
}
