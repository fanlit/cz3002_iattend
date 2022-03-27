import 'package:flutter/material.dart';
import 'Templates.dart';
import 'FacialAuthenticationPage.dart';
import 'globalenv.dart';

class AttendEventPage extends StatefulWidget {
  const AttendEventPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AttendEventPageState();
}

class _AttendEventPageState extends State<AttendEventPage> {
  TemplateMaker templatemkr = TemplateMaker();

  // TODO: set to true/false based on whether user has previous attendance with the event or not.
  bool _isAttended = false;
  var eventName = "gameshow 1"; //TODO: Remove, dummy data for testing only

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
                      const SizedBox(
                          height: 40), //spacing n between logo and fields
                      Container(
                          color: const Color.fromARGB(
                              255, 255, 255, 255), // background color
                          height: 100,
                          width: 350,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                templatemkr.HintfieldwithBG(
                                    "Please enter the event code",
                                    "Event Code",
                                    eventcode_controller,
                                    const Color.fromARGB(255, 179, 112, 112),
                                    const Color.fromARGB(255, 255, 255, 255)),
                                const SizedBox(height: 20)
                              ])),

                              // Pass the event ID/Name to this function
                          templatemkr.EventDetailsContainer(eventcode_controller.text),


                      Container(
                          child: Column(children: <Widget>[
                        const SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width: 30),
                              templatemkr.BackButton('back', context),
                              const SizedBox(
                                  width:
                                      60), // spacing in between back and attend button
                              SizedBox(
                                  width: 150.0,
                                  height: 52.0,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          onSurface: Colors.deepOrange),
                                      onPressed: () {_isAttended ? null : _NavigateToFacialAuthAndReturnResult(context);
                                      },
                                      child: const Text(
                                        'ATTEND',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'DMSans'),
                                      )))
                            ])
                      ]))
                    ]))))));
  }

  void _NavigateToFacialAuthAndReturnResult(BuildContext context) async {
    _isAttended = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => FacialAuthenticationPage()));
  }
}
