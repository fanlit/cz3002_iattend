import 'package:flutter/material.dart';
import 'RegisterPage.dart';
import 'globalenv.dart';
import 'LoginPage.dart';


class StartUpPage extends StatefulWidget {
  const StartUpPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StartUpPage> createState() => _StartUpPageState();
}

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
                          ))),
                  // ElevatedButton(onPressed: (){
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => FacialDetectionPage()));},
                  //     child: Text("face"))
                ]),
          ),
        ));
  }
}