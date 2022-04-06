// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cz3002_iattend/AttendEventPage.dart';
import 'Services/DatabaseServices/UserDataService.dart';
import 'package:cz3002_iattend/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'OrganiseEvent.dart';
import 'Services/AuthenticationService.dart';
import 'Widget/ProfilePictureWidget.dart';
import 'Models/iAttendUser.dart';
import 'globalenv.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final AuthenticationService _auth = AuthenticationService();
  final UserDataService userDataMngr = UserDataService();
  late Future user;
  iAttendUser appUser = iAttendUser("", "", "", userFaceArray);

  @override
  Widget build(BuildContext context) {

    // initialize user variables in globalenv.dart after logging in.
    uid = FirebaseAuth.instance.currentUser!.uid;
    username = _auth.getCurrentDisplayName().toString();
    email = _auth.getCurrentDisplayEmail().toString();
    user = userDataMngr.getUser(uid);
    user.then((value){
      appUser = value;
      userFaceArray = appUser.userFaceArray;
      setState(() {});
      },);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsetsDirectional.fromSTEB(30, 50, 30, 30),
            child: Center(
                child: Text("Welcome " + username,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold))),
            decoration: BoxDecoration(color: Colors.deepOrange),
          ),

          SizedBox(
            height: 30,
          ),
          ProfilePicture(),
          SizedBox(
            height: 30,
          ),

          //attend and organise buttons
          Center(
              child: Column(children: <Widget>[
            SizedBox(
                width: 262.0,
                height: 52.0,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AttendEventPage()));
                    },
                    child: Text("Attend"))
                ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                width: 262.0,
                height: 52.0,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrganizeEventPage()));
                    },
                    child: Text("Organise"))),
          ])),

          Spacer(),

          Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        await _auth.signOut();
                        userFaceArray = [];
                        username = "";
                        email = "";
                        uid = "";
                      },
                      icon: Icon(
                        Icons.logout,
                        size: 30,
                        color: Colors.white,
                      ),
                      label: Text("Log Out",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    )),
                Spacer(),
                Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePageState()));
                      },
                      icon: Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.white,
                      ),
                      label: Text("View Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    )),
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
