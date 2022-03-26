import 'package:flutter/material.dart';
import 'Models/attendance.dart';

class AttendanceTile extends StatelessWidget
{
  final Attendance attendance;
  AttendanceTile({required this.attendance});

  Widget build(BuildContext context)
  {
      return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.brown,
            ),
            title: Text(attendance.eventName),
            subtitle: Text("Test"),
          ),
        ),
      );
  }
}