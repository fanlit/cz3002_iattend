// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cz3002_iattend/AttendEventPage.dart';
import 'package:cz3002_iattend/ProfilePage.dart';
import 'package:cz3002_iattend/globalenv.dart';
import 'package:flutter/material.dart';
import 'OrganiseEvent.dart';

import 'Services/AuthenticationService.dart';
import 'Widget/ProfilePictureWidget.dart';


class HomePage extends StatelessWidget {
  // HomePage({Key? key, required String this.username}) : super(key: key);
  HomePage({Key? key}) : super(key: key);
  final AuthenticationService _auth = AuthenticationService();
  String username = '';
  

  @override
  Widget build(BuildContext context) {
    username = _auth.getCurrentDisplayName().toString();
    return Scaffold(
      body: Column(
        children: <Widget>[

          Container(
            padding: EdgeInsetsDirectional.fromSTEB(30, 50, 30, 30),
            child: Center(child: Text("Welcome "+username, style:TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold))),
            decoration: BoxDecoration(color: Colors.deepOrange),
          ),

          SizedBox(height: 30,),
          ProfilePicture(), 
          SizedBox(height: 30,),       

          //attend and organise buttons
          Center(child:
            Column(children: <Widget>[
              SizedBox(
              width: 262.0,
              height: 52.0,
              child:ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AttendEventPageState()));}, child: Text("Attend")) //TODO go to page
              ),
              SizedBox(height: 30,),
              SizedBox(
                width: 262.0,
                height: 52.0,
                child:ElevatedButton(onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrganizeEventPage()));
                }, child: Text("Organise")) //TODO go to page
              ),
            ])),
      
          Spacer(),

          Container(
              height: 70,
              child: Row(
                children: <Widget>[

                  Padding(padding: EdgeInsets.only(left: 40),child:ElevatedButton.icon(onPressed: () async {
                    await _auth.signOut();
                  }, icon: Icon(Icons.logout, size: 30, color: Colors.white,), label: Text("Log Out", style:TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),)),
                  Spacer(),

                  Padding(padding: EdgeInsets.only(right: 40),child:ElevatedButton.icon(onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> ProfilePageState()));
                  }, icon: Icon(Icons.menu, size: 30, color: Colors.white,), label: Text("View Profile", style:TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),)),

                ],
              ),
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.red[100]),
          )
        ],
      ),
    );
  }
}


