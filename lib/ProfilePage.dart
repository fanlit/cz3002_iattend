import 'package:cz3002_iattend/AttendListView.dart';
import 'package:flutter/material.dart';
import 'Templates.dart';
import 'globalenv.dart';
import 'Services/AuthenticationService.dart';
import 'Widget/ProfilePictureWidget.dart';
import 'OrganisedListView.dart';


class ProfilePageState extends StatelessWidget {
  TemplateMaker templatemkr = TemplateMaker();
  final AuthenticationService _auth = AuthenticationService();
  String username = '';
  var eventName = "gameshow";
  Widget build(BuildContext context) {
    username = _auth.getCurrentDisplayName().toString();
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
                      Container(
                          height: 200,
                          width: 350,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ProfilePicture(),
                                Text(
                                    username, // to be changed to fetching of username
                                    style: const TextStyle(
                                        fontSize: 26,
                                        color: Colors.deepOrange,
                                        fontFamily: 'DMSans',
                                        fontWeight: FontWeight.bold))
                              ])),
                      Container(
                          color: const Color.fromRGBO(
                              199, 199, 199, 1), // background color
                          height: 400,
                          width: 350,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                  width: 150,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AttendedListState()));
                                        //Navigator.push(context, MaterialPageRoute(builder: (context) => TestDBPage()));
                                      },
                                      child: const Text(
                                        'Attended',
                                        style: TextStyle(
                                            fontSize: 15, fontFamily: 'DMSans'),
                                      ))),
                              SizedBox(width: 10),
                              SizedBox(
                                  width: 150,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ListExampleClick()),
                                        );
                                      },
                                      child: const Text(
                                        'Organised',
                                        style: TextStyle(
                                            fontSize: 15, fontFamily: 'DMSans'),
                                      ))),
                            ],
                          )),
                      const SizedBox(height: 10),
                      Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                            templatemkr.BackButton('back', context),
                            SizedBox(width: 20),
                          ]))
                    ]))))));
  }
}
