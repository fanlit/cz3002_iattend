import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cz3002_iattend/Models/event.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:cz3002_iattend/Models/iAttendUser.dart';

class EventDataService
{

  //final String eventID;
  EventDataService();

  //Collection Reference
  final CollectionReference eventCollection = FirebaseFirestore.instance.collection('events');


  Future createEventData(String eventName, String venue, String creator, String email, String description, String joiningCode, DateTime start, DateTime end) async
  {
    return await eventCollection.add(
        {'eventName': eventName,
          'venue': venue,
          'creator': creator,
          'creatorEmail': email,
          'description': description,
          'joiningCode': joiningCode,
          'start': start,
          'end': end
        }
    );
  }

  Future<Event> getEventByJoiningCode(String joiningCode)
  async {
    QuerySnapshot doc = await eventCollection.where('joiningCode', isEqualTo: joiningCode).get();
    /*
    return Event(
        (doc.docs[0].data() as Map<String, dynamic>)['eventName'],
        (doc.docs[0].data() as Map<String, dynamic>)['creator'],
        (doc.docs[0].data() as Map<String, dynamic>)['description'],
        (doc.docs[0].data() as Map<String, dynamic>)['joiningCode'],
        (doc.docs[0].data() as Map<String, dynamic>)['start'],
        (doc.docs[0].data() as Map<String, dynamic>)['end']
    );

     */
    return _EventListFromSnapshot(doc)[0];
  }

  Future<List<Event>> getEventByCreator(String creator)
  async {
    final QuerySnapshot results = await eventCollection.where('creator', isEqualTo: creator).get();
    /*
    return results.docs.map((doc){
      return Event(
        doc.get('eventName').toString() ?? '',
        doc.get('creator').toString() ?? '',
        doc.get('description').toString() ?? '',
        doc.get('joiningCode').toString() ?? '',
        doc.get('start'),
        doc.get('end'),

      );
    }).toList();
     */
    return _EventListFromSnapshot(results);
    }

  Future<List<Event>> getEventByCreatorEmail(String creatorEmail) async {
    final QuerySnapshot results = await eventCollection.where('creatorEmail', isEqualTo: creatorEmail).get();
    /*
    return results.docs.map((doc){
      return Event(
        doc.get('eventName').toString() ?? '',
        doc.get('creator').toString() ?? '',
        doc.get('description').toString() ?? '',
        doc.get('joiningCode').toString() ?? '',
        doc.get('start'),
        doc.get('end'),
      );
    }).toList();
     */
    return _EventListFromSnapshot(results);
  }


  //Event list from snapshot
  List<Event> _EventListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.docs.map((doc){
      return Event(
        doc.get('eventName').toString(),
        doc.get('venue').toString(),
        doc.get('creator').toString(),
        doc.get('creatorEmail').toString(),
        doc.get('description').toString(),
        doc.get('joiningCode').toString(),
        doc.get('start').toDate(),
        doc.get('end').toDate(),
      );
    }).toList();
  }
}