import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cz3002_iattend/Models/event.dart';
import 'dart:core';

class EventDataService
{

  //final String eventID;
  EventDataService();

  //Collection Reference
  final CollectionReference eventCollection = FirebaseFirestore.instance.collection('events');


  Future createEventData(String eventName, String venue, String creator, String email, String description, String joiningCode, DateTime start, DateTime end) async
  {

    var newEvent = await eventCollection.add({'eventName': eventName,});
    newEvent.set({
      'eventName': eventName,
      'eventID': newEvent.id.toString(),
      'venue': venue,
      'creator': creator,
      'creatorEmail': email,
      'description': description,
      'joiningCode': joiningCode,
      'start': start,
      'end': end
      });
  }

  Future<Event> getEventByJoiningCode(String joiningCode)
  async {
    QuerySnapshot doc = await eventCollection.where('joiningCode', isEqualTo: joiningCode).get();
    return _EventListFromSnapshot(doc)[0];
  }

  Future<List<Event>> getEventByCreator(String creator)
  async {
    QuerySnapshot results = await eventCollection.where('creator', isEqualTo: creator).get();
    return _EventListFromSnapshot(results);
    }

  Future<List<Event>> getEventByCreatorEmail(String creatorEmail) async {
    QuerySnapshot results = await eventCollection.where('creatorEmail', isEqualTo: creatorEmail).get();
    // print(creatorEmail);
    return _EventListFromSnapshot(results);
  }


  //Event list from snapshot
  List<Event> _EventListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.docs.map((doc){
      return Event(
        doc.get('eventID').toString(),
        doc.get('eventName').toString(),
        doc.get('venue').toString(),
        doc.get('creator').toString(),
        doc.get('creatorEmail').toString(),
        doc.get('description').toString(),
        doc.get('joiningCode').toString(),
        doc.get('start').toDate(),
        doc.get('end').toDate(),
        // '123',
        // 'eventname',
        //  'venue',
        // 'creator',
        // 'creatorEmail',
        // 'description',
        // 'joining code',
        // DateTime.now(),
        // DateTime.now(),
      );
    }).toList();
  }
}