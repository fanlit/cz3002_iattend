import 'package:cz3002_iattend/Models/attendance.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'attendance_tile.dart';

class AttendanceList extends StatefulWidget
{
  _AttendanceListState createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList>
{
  @override
  Widget build(BuildContext context)
  {
    final attendances = Provider.of<List<Attendance>>(context);

    return ListView.builder(
      itemCount: attendances.length,
      itemBuilder: (context, index) {
        return AttendanceTile(attendance: attendances[index]);
      },

    );
  }
}