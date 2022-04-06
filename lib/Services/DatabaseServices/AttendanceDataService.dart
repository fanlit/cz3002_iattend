import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cz3002_iattend/Models/event.dart';
import 'EventDataService.dart';
import 'dart:core';

class AttendanceDataService {


  AttendanceDataService();

  //Collection Reference
  final CollectionReference attendanceCollection = FirebaseFirestore.instance
      .collection('attendance');
  final CollectionReference eventCollection = FirebaseFirestore.instance
      .collection('events');
  final CollectionReference userCollection = FirebaseFirestore.instance
      .collection('users');
  final EventDataService eventMngr = EventDataService();

  //Create data upon signup/existing user updates data
  Future<void> createAttendanceData(String attendeeID, String joiningCode) async
  {
    QuerySnapshot event = await eventCollection.where('joiningCode', isEqualTo: joiningCode).get();
    String eventID = event.docs[0].id;
    var toAdd = {
      'eventID': eventID,
      'attendeeID': FirebaseAuth.instance.currentUser?.uid,
      'signInTime': DateTime.now(),
    };
    await attendanceCollection.add(toAdd);
  }

  Future<Map<String, DateTime>> getUserAttendanceRecord(String uid) async {
    final QuerySnapshot results = await attendanceCollection.where('attendeeID', isEqualTo: uid).get();
    Map<String, DateTime> output = {};
    for (var doc in results.docs)
    {
      DateTime signInTime = DateTime.parse(doc.get('signInTime').toDate().toString());
      var documentReference = await eventCollection.doc(doc.get('eventID')).get();
      output[documentReference.get("eventName")] = signInTime;
    }
     return output;
  }

  Future<List<Event>> getUserEventsAttendanceRecord(String uid) async {
    final QuerySnapshot results = await attendanceCollection.where('attendeeID', isEqualTo: uid).get();
    List<Event> output = [];
    for (var doc in results.docs)
    {
      output.add(await eventMngr.getEventByEventID(doc.get('eventID').toString()));
    }
    return output;
  }

  // Returns a map of student email and student name.
  Future<Map<String, String>> getAttendanceListByEventID(String eventID) async
  {
    final QuerySnapshot results = await attendanceCollection.where('eventID', isEqualTo: eventID).get();
    Map<String, String> output = {};
    for (var doc in results.docs)
    {
      String uid = doc.get('attendeeID');
      var userDocRef = await userCollection.doc(uid).get();
      output[userDocRef.get('email')] = userDocRef.get('name');
    }
    return output;
  }
}
