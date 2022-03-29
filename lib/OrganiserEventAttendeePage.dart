import 'package:flutter/material.dart';
import 'Templates.dart';
import 'globalenv.dart';

class OrganiserEventAttendeePage extends StatefulWidget {
  late String eventCode;
  OrganiserEventAttendeePage({Key? key, required this.eventCode}) : super(key: key);
  @override
  State<OrganiserEventAttendeePage> createState() => _OrganiserEventAttendeePageState();
}

class _OrganiserEventAttendeePageState extends State<OrganiserEventAttendeePage> {
  TemplateMaker templatemkr = TemplateMaker();
  //TODO: make a function to return the participant list without the Future encapsulation

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
                              const SizedBox(
                                  height:
                                      40), //spacing n between logo and fields
                              Container(
                                  color: const Color.fromRGBO(
                                      199, 199, 199, 1), // background color
                                  height: 470,
                                  width: 350,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(height: 10),
                                        Text(
                                          "" + widget.eventCode,
                                          style: const TextStyle(
                                              fontSize: 30,
                                              color: Colors.deepOrange,
                                              fontFamily: 'DMSans',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const <Widget>[
                                            SizedBox(height: 10),
                                            Text(
                                              "Participants",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.deepOrange,
                                                  fontFamily: 'DMSans',
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        templatemkr.PopulateEventAttendees(),
                                      ])),
                              Container(
                                  height: 100,
                                  width: 300,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        templatemkr.BackButton('back', context)
                                      ]))
                            ]))))));
  }
}
