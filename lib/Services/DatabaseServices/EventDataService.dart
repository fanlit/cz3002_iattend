import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cz3002_iattend/Models/event.dart';
import 'dart:core';

import 'package:flutter/material.dart';

class EventDataService
{

  EventDataService();

  //Collection Reference
  final CollectionReference eventCollection = FirebaseFirestore.instance.collection('events');


  Future<void> createEventData(String eventName, String venue, String creator, String email, String description, String joiningCode, DateTime start, DateTime end) async
  {
    var newEventDoc =  eventCollection.doc();
    await newEventDoc.set({
      'eventID': newEventDoc.id,
      'eventName': eventName,
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
    final QuerySnapshot results = await eventCollection.where('creator', isEqualTo: creator).get();
    return _EventListFromSnapshot(results);
    }

  //Event list from snapshot
  List<Event> _EventListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.docs.map((doc){
      return Event(
        doc.get('eventID'),
        doc.get('eventName'),
        doc.get('venue'),
        doc.get('creator'),
        doc.get('creatorEmail'),
        doc.get('description'),
        doc.get('joiningCode'),
        DateTime.parse(doc.get('start').toDate().toString()),
        DateTime.parse(doc.get('end').toDate().toString()),
      );
    }).toList();
  }
}