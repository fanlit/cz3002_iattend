import 'package:flutter/material.dart';
import 'Templates.dart';
import 'globalenv.dart';

import 'PhotoTakingPage.dart';


class RegisterPageState extends StatelessWidget {
  templatemaker templatemkr = templatemaker();
  TextEditingController email_controller = TextEditingController();
  TextEditingController name_controller = TextEditingController();
  TextEditingController shdw_controller = TextEditingController();
  TextEditingController shdw2_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
        body: Container(
            child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                child: SingleChildScrollView(
                    child: Container(
                      // color: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(height: 50),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text("iAttend",
                                      style: TextStyle(
                                          fontSize: fonttitle,
                                          color: Colors.deepOrange,
                                          fontFamily: 'DMSans',
                                          fontWeight: FontWeight.bold))
                                ]),
                            const SizedBox(height: 40), //spacing n between logo and fields
                            Container(
                              color: Color.fromRGBO(199, 199, 199, 1),  // background color
                                height: 470,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:<Widget>[
                                  templatemkr.TextfieldwithBG("Name", "Name", name_controller,Color.fromRGBO(255, 255, 255, 1)),
                                const SizedBox(height:20),
                                templatemkr.TextfieldwithBG("Email", "Email", email_controller,Color.fromRGBO(255, 255, 255, 1)),
                                const SizedBox(height:30),
                                templatemkr.TextfieldwithBG("Pasword", "Password", shdw_controller,Color.fromRGBO(255, 255, 255, 1)),
                                const SizedBox(height:40),
                                templatemkr.TextfieldwithBG("Repeat Password", "Password", shdw2_controller,Color.fromRGBO(255, 255, 255, 1)),
                                const SizedBox(height:50),
                                Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                              width: 200.0,
                                              height: 60.0,
                                              child: ElevatedButton(
                                                  onPressed: () {}, // TODO: upload photo
                                                  child: const Text(
                                                    'Upload Facial Picture',
                                                    style: TextStyle(fontSize: 15, fontFamily: 'DMSans'),
                                                  ))),
                                                  SizedBox(width:50), // spacing in between upload and camera
                                                  SizedBox( //camera logo
                                                    width: 60.0,
                                                    height: 60.0,
                                                    child: ElevatedButton.icon(
                                                        onPressed: () {
                                                            Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoTakingPage()));
                                                        }  // TODO: Implement button to be able to open device camera
                                                          ,
                                                        icon: const Icon(Icons.camera_alt, size: 24),
                                                        label: const Text("")),
                                                            )
                                        ]
                                  )])),
                            Container(
                              height:100,
                              width:300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                SizedBox(
                                              width: 300.0,
                                              height: 52.0,
                                              child: ElevatedButton(
                                                  onPressed: () {}, // TODO: Create account with details
                                                  child: const Text(
                                                    'register',
                                                    style: TextStyle(fontSize: 30, fontFamily: 'DMSans'),
                                                  )))
                                ]

                              )
    
    )]))))));
    throw UnimplementedError();
  }
}