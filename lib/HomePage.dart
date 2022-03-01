// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'OrganiseEvent.dart';


class HomePage extends StatelessWidget {
  HomePage({ Key? key, required String this.username}) : super(key: key);
  String username;
  String imagePath = 'assets/images/tim.jpg'; //todo change file path

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[

          Container(
            padding: EdgeInsetsDirectional.fromSTEB(30, 50, 30, 30),
            child: Center(child: Text("Welcome "+username, style:TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold))),
            decoration: BoxDecoration(color: Colors.deepOrange),
          ),

          Container(//Image
            margin: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 100),
            child: Center(child: 
              ClipOval(
                child: Image.asset(imagePath)
              )
            ),          
          ),        

          Center(child:
            Column(children: <Widget>[
              SizedBox(
              width: 262.0,
              height: 52.0,
              child:ElevatedButton(onPressed: () {}, child: Text("Attend")) //TODO go to page
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
                  //TODO go to page
                  Padding(padding: EdgeInsets.only(left: 40),child:ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.settings, size: 30, color: Colors.white,), label: Text("Setting", style:TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),)),
                  Spacer(),
                  Padding(padding: EdgeInsets.only(right: 40),child:ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.menu, size: 30, color: Colors.white,), label: Text("View Profile", style:TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),)),
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


