import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AttendanceDataService {

  //final String attendanceID;

  AttendanceDataService();

  //Collection Reference
  final CollectionReference attendanceCollection = FirebaseFirestore.instance
      .collection('attendance');
  final CollectionReference eventCollection = FirebaseFirestore.instance
      .collection('events');

  //Create data upon signup/existing user updates data
  Future createAttendanceData(String attendeeID, String joiningCode) async
  {
    QuerySnapshot event = await eventCollection.where('joiningCode', isEqualTo: joiningCode).get();
    String eventID = event.docs[0].id;
    var toAdd = {
      'eventID': eventID,
      'attendeeID': FirebaseAuth.instance.currentUser?.uid,
      'signInTime': Timestamp.now()
    };

    attendanceCollection.add(toAdd);
  }

  Future<Map<String, Timestamp>> getUserAttendanceRecord() async {
    final QuerySnapshot results = await attendanceCollection.where('attendeeID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get();
    Map<String, Timestamp> output = {};
    for (var doc in results.docs)
    {
      DocumentReference documentReference = eventCollection.doc(doc.get('eventID').toString());
      Timestamp signInTime = doc.get('signInTime');
      documentReference.get().then((snapshot)
      {
        String eventName = snapshot.get('eventName');
        output[eventName] = signInTime;
      });
    }
     return output;
    /*
    return results.docs.map((doc) {
      DocumentReference documentReference = eventCollection.doc(doc.get('eventID').toString());
      String eventName = "";
      documentReference.get().then((snapshot) {
        eventName = snapshot.get('eventName');
      });



      return Attendance(
        doc.get('eventID').toString() ?? '',
        eventName,
        doc.get('attendeeID').toString() ?? '',
        doc.get('signInTime')
      );
    }).toList();

     */
  }

  Future<Map<String, Timestamp>> getAttendanceListByEventID(String eventID) async
  {
    final QuerySnapshot results = await attendanceCollection.where('eventID', isEqualTo: eventID).get();
    Map<String, Timestamp> output = {};
    for (var doc in results.docs)
    {
      DocumentReference documentReference = eventCollection.doc(doc.get('eventID').toString());
      Timestamp signInTime = doc.get('signInTime');
      documentReference.get().then((snapshot)
      {
        String eventName = snapshot.get('eventName');
        output[eventName] = signInTime;
      });
    }
    return output;
  }
}
