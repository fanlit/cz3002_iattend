import 'package:flutter/material.dart';
import 'OrganiserEventAttendeePage.dart';
import 'Templates.dart';
import 'globalenv.dart';
import 'Models/event.dart';


class OrganiserEventInfoPage extends StatefulWidget{
  OrganiserEventInfoPage({ Key? key, required Event this.eventItem}) : super(key: key);
  Event eventItem;

  @override
  State<OrganiserEventInfoPage> createState() => _OrganiserEventInfoPageState();
}

class _OrganiserEventInfoPageState extends State<OrganiserEventInfoPage>{
  TemplateMaker templatemkr = TemplateMaker();

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
                                height: 40), //spacing n between logo and fields

                            // replace the widgets below with the function
                            templatemkr.EventDetailsContainer(widget.eventItem),

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
                                                onPressed: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrganiserEventAttendeePage(eventName: widget.eventItem.eventName, eventID: widget.eventItem.eventID,)));
                                                },
                                                child: const Text(
                                                  'Participants',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: 'DMSans'),
                                                )))
                                      ])
                                ]))
                          ])))))
    );
  }
}