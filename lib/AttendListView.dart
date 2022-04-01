import 'Models/event.dart';
import 'package:flutter/material.dart';
import 'OrganiserEventInfoPage.dart';
import 'globalenv.dart';
import 'package:cz3002_iattend/Models/event.dart';
import 'Services/DatabaseServices/AttendanceDataService.dart';


class AttendedListState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AttendedListViews',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Attended events'),
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
  AttendanceDataService attendMngr = AttendanceDataService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: attendMngr.getUserEventsAttendanceRecord(uid),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text(
            '${snapshot.error}',
            style: const TextStyle(color: Colors.red),
          );
        }
        if (snapshot.hasData) {
          List<Event> attendedList = snapshot.data;
          return ListView(
              children: attendedList.map((userone) {
            return Container(
                child: ListTile(
              leading: const Icon(Icons.circle),
              title: Text(userone.eventName),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=> OrganiserEventInfoPage(eventItem: userone,)));
              },
            ));
          }).toList());
        }
        return Container();
      },
    );
  }
}
