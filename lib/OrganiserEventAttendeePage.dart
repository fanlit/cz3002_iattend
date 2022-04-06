import 'package:flutter/material.dart';
import 'Services/DatabaseServices/AttendanceDataService.dart';
import 'Templates.dart';
import 'globalenv.dart';

class OrganiserEventAttendeePage extends StatefulWidget {
  late String eventName;
  late String eventID;
  OrganiserEventAttendeePage({Key? key, required this.eventName, required this.eventID}) : super(key: key);
  @override
  State<OrganiserEventAttendeePage> createState() => _OrganiserEventAttendeePageState();
}

class _OrganiserEventAttendeePageState extends State<OrganiserEventAttendeePage> {
  TemplateMaker templatemkr = TemplateMaker();
  late Future attendanceList;
  Map<String, String> attendees = {};
  AttendanceDataService attendanceMngr = AttendanceDataService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                child: SingleChildScrollView(
                    child: Container(
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
                                  height: 480,
                                  width: 350,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(height: 10),
                                        Text(
                                          "" + widget.eventName,
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
                                        SizedBox(height: 10),
                                        FutureBuilder(
                                            future: attendanceMngr.getAttendanceListByEventID(widget.eventID),
                                            builder: (BuildContext context, AsyncSnapshot snapshot){
                                              if(snapshot.connectionState == ConnectionState.waiting){
                                                  return const CircularProgressIndicator();
                                              }
                                              if(snapshot.hasError){
                                                return Text(
                                                  '${snapshot.error}',
                                                  style: const TextStyle(color: Colors.red),
                                                );
                                              }
                                              if(snapshot.hasData){
                                                attendees = snapshot.data;
                                                return Container(
                                                    // color: Colors.amberAccent,
                                                    height: 380,
                                                    width: 325,
                                                    child: SingleChildScrollView(
                                                        child: Column(
                                                            crossAxisAlignment:  CrossAxisAlignment.center,
                                                            children: <Widget>[
                                                              for(var attendee in attendees.entries)
                                                                templatemkr.attendeeModule(attendee.key, attendee.value)
                                                            ])));
                                              }
                                              return Container();
                                            },
                                        )
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
