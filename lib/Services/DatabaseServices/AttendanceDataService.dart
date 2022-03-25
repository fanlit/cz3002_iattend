import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cz3002_iattend/Models/attendance.dart';
import 'package:cz3002_iattend/Models/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:cz3002_iattend/Models/iAttendUser.dart';

class AttendanceDataService {

  final String attendanceID;

  AttendanceDataService(this.attendanceID);

  //Collection Reference
  final CollectionReference attendanceCollection = FirebaseFirestore.instance
      .collection('attendance');
  final CollectionReference eventCollection = FirebaseFirestore.instance
      .collection('events');

  //Create data upon signup/existing user updates data
  Future createAttendanceData(String eventID, String attendeeID,
      DateTime signInTime, DateTime signOutTime) async
  {
    var toAdd = {
      'eventID': eventID,
      'attendeeID': attendeeID,
      'signInTime': signInTime,
      'signOutTime': signOutTime
    };

    attendanceCollection.add(toAdd);
  }

  Future<List<Attendance>> getUserAttendanceRecord(String attendeeID) async {
    final QuerySnapshot results = await attendanceCollection.where(
        'attendeeID', isEqualTo: attendeeID).get();
    return results.docs.map((doc) {
      DocumentReference documentReference = eventCollection.doc(
          doc.get('eventID').toString());
      String eventName = "";
      documentReference.get().then((snapshot) {
        eventName = snapshot.get('eventName');
      });

      return Attendance(
        doc.get('eventID').toString() ?? '',
        eventName,
        doc.get('attendeeID').toString() ?? '',
        doc.get('signInTime'),
        doc.get('signOutTime'),
      );
    }).toList();
  }
}
