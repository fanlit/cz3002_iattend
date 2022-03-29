import 'package:cloud_firestore/cloud_firestore.dart';

class Attendance
{
  final String eventID;
  final String attendeeID;
  final DateTime signInTime;

  Attendance(this.eventID, this.attendeeID, this.signInTime);
}