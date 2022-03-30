import 'Models/event.dart';
import 'package:flutter/material.dart';
import 'OrganiserEventInfoPage.dart';
import 'Services/DatabaseServices/EventDataService.dart';
import 'globalenv.dart';
import 'package:cz3002_iattend/Models/event.dart';
//

class ListExampleClick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OrganisedListViews',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Organised events'),
        ),
        body: ListLayout(),
      ),
    );
  }
}

class ListLayout extends StatefulWidget {
  _ListViewClickListenerState createState() => _ListViewClickListenerState();
}

class _ListViewClickListenerState extends State<ListLayout> {
  EventDataService eventMngr = EventDataService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: eventMngr.getEventByCreatorEmail(email),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }
          if(snapshot.hasError){
            return Text(
              '${snapshot.error}',
              style: const TextStyle(color: Colors.red),
            );
          }
          if(snapshot.hasData){
            List<Event> _myDataList = snapshot.data;
            // print(snapshot.data.eventName);
            return ListView(
              children: _myDataList
                  .map((data) => ListTile(
                  leading: const Icon(Icons.circle),
                  title: Text(data.eventName),
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> OrganiserEventInfoPage(eventItem: data,)
                  ));
                  }
              )).toList(),
            );
          }
          return Container();
        },);
  }
}