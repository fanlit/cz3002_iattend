import 'package:cz3002_iattend/Models/event.dart';
import 'package:flutter/material.dart';
import 'Services/DatabaseServices/UserDataService.dart';
import 'Services/DatabaseServices/EventDataService.dart';
import 'Services/DatabaseServices/AttendanceDataService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Models/iAttendUser.dart';
import 'dart:core';

class TestDBPage extends StatelessWidget {
  TestDBPage({Key? key}) : super(key: key);
  final UserDataService _userDataService = UserDataService();
  final EventDataService _eventDataService = EventDataService();
  final AttendanceDataService _attendanceDataService = AttendanceDataService();
  final uid = FirebaseAuth.instance.currentUser!.uid;

  // User data.
  iAttendUser? currUser;

  // Events.
  List<Event> eventsCreatedByMe = [];
  Event? eventOfJoiningCode;

  // Attendance.
  Map<String, String> attendanceList = {};
  Map<String, DateTime> eventsAttendedByMe = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test DB"),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await _userDataService.getUser(uid).then((value) {currUser = value;});
                  showDialog(context: context, builder:(context)=> AlertDialog(content: Text("${currUser!.name} ${currUser!.email} ${currUser!.userFaceArray[0]}")));
                },
                child: const Text("Get current user data")),
            ElevatedButton(
                onPressed: () async {
                  await _userDataService.getUser(uid).then((value) {
                    currUser = value;
                    _eventDataService.createEventData("lec1", "LT1", uid, currUser!.email, "lec1", "123456", DateTime.now(), DateTime.now());
                  });
                },
                child: const Text("Create an event")),
            ElevatedButton(
                onPressed: () async {
                  await _eventDataService.getEventByCreator(uid).then((events) {
                    eventsCreatedByMe = events;
                  });
                  showDialog(context: context, builder:(context)=> AlertDialog(content: Text("${eventsCreatedByMe[0].eventName} ${eventsCreatedByMe[0].description} ${eventsCreatedByMe[0].start}")));
                },
                child: const Text("Get events created by me")),
            ElevatedButton(
                onPressed: () async {
                  await _eventDataService.getEventByJoiningCode("123456").then((event) {
                    eventOfJoiningCode = event;
                  });
                  showDialog(context: context, builder:(context)=> AlertDialog(content: Text("${eventOfJoiningCode!.eventName} ${eventOfJoiningCode!.description} ${eventOfJoiningCode!.start}")));
                },
                child: const Text("Get the event of joining code 123456")),
            ElevatedButton(
                onPressed: () async {
                  await _attendanceDataService.createAttendanceData(uid, "123456");
                },
                child: const Text("Sign attendance")),
            ElevatedButton(
                onPressed: () async {
                  await _attendanceDataService.getAttendanceListByEventID("db2NonocV1UIT6pXkPmv").then((value){
                    attendanceList = value;
                  });
                  showDialog(context: context, builder:(context)=> AlertDialog(content: Text("${attendanceList.keys.first} ${attendanceList.values.first}")));
                },
                child: const Text("Get attendance list by eventID")),
            ElevatedButton(
                onPressed: () async {
                  await _attendanceDataService.getUserAttendanceRecord(uid).then((value){
                    eventsAttendedByMe = value;
                  });
                  showDialog(context: context, builder:(context)=> AlertDialog(content: Text("${eventsAttendedByMe.keys.first} ${eventsAttendedByMe.values.first}")));
                },
                child: const Text("Events attended by me")),
          ],
        ),
      ),
    );
  }
}
