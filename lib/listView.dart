// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'OrganiserEventInfoPage.dart';
// import 'Services/DatabaseServices/EventDataService.dart';
// import 'globalenv.dart';
// import 'package:cz3002_iattend/Models/event.dart';


class ListExampleClick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // This time instead of using a Container we are using the MaterialApp
    // widget, which is setup to make our app have the Material theme.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListViews',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      // The Scaffold widget lays out our home page for us
      home: Scaffold(
        // We will pass an AppBar widget to the appBar property of Scaffold

        // The AppBar property takes a Text widget for its title property

        appBar: AppBar(
          title: Text('Attended events'),
        ),

        // The body property of the Scaffold widget is the main content of
        // our screen. Instead of directly giving it a widget we are going
        // to break it out into another method so that things don't get
        // too messy here.
        body: ListLayout(),
      ),
    );
  }
}

class ListLayout extends StatefulWidget {
  _ListViewClickListenerState createState() => _ListViewClickListenerState();
}

class _ListViewClickListenerState extends State<ListLayout> {

  final List<String> _myDataList=['event1','event2','event 3','event 4'];
  // EventDataService eventMngr = EventDataService();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ListView(

      children: _myDataList
          .map((data) => ListTile(
        leading: Icon(Icons.circle),
        title: Text(data),
        onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context)=> OrganiserEventInfoPageState()
        )
        );
        }
      ))
          .toList(),

    );
  }

  // Initialize eventList by retrieving all the required event data
  // List<Event> initializeItems() async{
  //   Future<List<Event>> _eventList = eventMngr.getEventByCreatorEmail(email);
  //   List<Event> eventList = await _eventList;
  //   return eventList;
  // }

}