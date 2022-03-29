import 'package:cloud_firestore/cloud_firestore.dart';

class Attendance
{
  final String eventID;
  final String eventCode;
  final String eventName;
  final String attendeeID;
  final Timestamp signInTime;

  Attendance(this.eventID, this.eventCode, this.eventName, this.attendeeID, this.signInTime);
}