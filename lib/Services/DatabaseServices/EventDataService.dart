import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cz3002_iattend/Models/event.dart';
import 'package:flutter/cupertino.dart';

import '../../Models/user.dart';

class EventDataService
{

  final String eventID;
  EventDataService(this.eventID);

  //Collection Reference
  final CollectionReference eventCollection = FirebaseFirestore.instance.collection('events');

  //Create data upon signup/existing user updates data
  Future updateEventData(String eventName, String creator, DateTime start, DateTime end) async
  {
    return await eventCollection.doc(eventID).set(
        {'eventName': eventName,
          'creator': creator,
          'start': start,
          'end': end
        }
    );
  }

  Future<Event> getEventById(String id)
  async {
    DocumentSnapshot doc = await eventCollection.doc(id).get();
    return Event(
      doc.get('eventName').toString() ?? '', doc.get("creator").toString(), doc.get("start"), doc.get("end")
    );
  }

  Future<List<Event>> getEventByCreator(String creator)
  async {
    final QuerySnapshot results = await eventCollection.where('creator', isEqualTo: creator).get();
    List<Event> listOfEvents;
    return results.docs.map((doc){
      return Event(
        doc.get('eventName').toString() ?? '',
        doc.get('creator').toString() ?? '',
        doc.get('start'),
        doc.get('end'),
      );
    }).toList();
    }

  //Event list from snapshot
  List<Event> _EventListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.docs.map((doc){
      return Event(
        doc.get('eventName').toString() ?? '',
        doc.get('creator').toString() ?? '',
        doc.get('start'),
        doc.get('end'),
      );
    }).toList();
  }
}