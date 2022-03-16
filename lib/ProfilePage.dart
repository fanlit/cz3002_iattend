import 'package:flutter/material.dart';
import 'Templates.dart';
import 'globalenv.dart';
import 'Widget/ProfilePictureWidget.dart';


class ProfilePageState extends StatelessWidget {
  templatemaker templatemkr = templatemaker();
  
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
                                Container(
                                  height: 200,
                                  width: 350,
                                   child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:<Widget>[
                                      ProfilePicture(),
                                      Text("Username",  // to be changed to fetching of username
                                      style: TextStyle(
                                          fontSize: 26,
                                          color: Colors.deepOrange,
                                          fontFamily: 'DMSans',
                                          fontWeight: FontWeight.bold))])
                                          ),
                                Container(color: Color.fromRGBO(199, 199, 199, 1),  // background color
                                height: 400,
                                width: 350,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                              width: 150,
                        
                                              child: ElevatedButton(
                                                  onPressed: () {}, // TODO: show organized events
                                                  child: const Text(
                                                    'Organized',
                                                    style: TextStyle(fontSize: 15, fontFamily: 'DMSans'),
                                                  ))),
                                    SizedBox(width: 10),
                                    SizedBox(
                                              width: 150,
                        
                                              child: ElevatedButton(
                                                  onPressed: () {}, // TODO: show attended events
                                                  child: const Text(
                                                    'Attended',
                                                    style: TextStyle(fontSize: 15, fontFamily: 'DMSans'),
                                                  ))),
                                  ],
                                ) 
                                ),
                                const SizedBox(height: 10),
                                Container( child:
                                Row( mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  templatemkr.BackButton(
                                              'back', context),
                                          SizedBox(width: 20),
                                ]
    )
    )]))))));

  }
}
