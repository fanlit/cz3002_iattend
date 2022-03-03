import 'package:flutter/material.dart';
import 'Templates.dart';
import 'FacialDetectionPage.dart';
import 'globalenv.dart';

class AttendEventPageState extends StatelessWidget{
  templatemaker templatemkr = templatemaker();
  TextEditingController eventcode_controller = TextEditingController();
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
                              color: Color.fromARGB(255, 255, 255, 255),  // background color
                                height: 100,
                                width: 350,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:<Widget>[
                                  templatemkr.HintfieldwithBG("Please enter the event code","Event Code", eventcode_controller,Color.fromARGB(255, 179, 112, 112),Color.fromARGB(255, 255, 255, 255)),
                                const SizedBox(height:20)
                                ])
                                ),
                                Container(color: Color.fromARGB(255, 182, 182, 182),  // background color
                                height: 450,
                                width: 350,
                                child: Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: <Widget>[
                                      Text("Event Name:",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.deepOrange,
                                          fontFamily: 'DMSans',
                                          fontWeight: FontWeight.bold)),
                                ] // TODO implement fetching list of event details
                                )),
                                Container( 
                                  child: Column (
                                    children :<Widget>[
                                    const SizedBox(height:20),
                                Row ( 
                                  mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(width:30),
                                          templatemkr.BackButton(
                                              'back', context),
                                                  SizedBox(width:60), // spacing in between back and attend button
                                                  SizedBox(
                                              width: 150.0,
                                              height: 52.0,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => FacialDetectionPage()));
                                                  }, // TODO: attend event
                                                  child: const Text(
                                                    'ATTEND',
                                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'DMSans'),
                                                  )))
                                        ]
                                  )
                                    ])
                                )])))))) ;
  }
}
