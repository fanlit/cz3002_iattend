import 'package:flutter/material.dart';
import 'Services/DatabaseServices/EventDataService.dart';
import 'FacialAuthenticationPage.dart';
import 'Models/event.dart';
import 'Templates.dart';
import 'globalenv.dart';
//
class AttendEventPage extends StatefulWidget {
  const AttendEventPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AttendEventPageState();
}

class _AttendEventPageState extends State<AttendEventPage> {
  TextEditingController eventcode_controller = TextEditingController();
  TemplateMaker templatemkr = TemplateMaker();
  EventDataService eventMngr = EventDataService();

  // TODO: set to true/false based on whether user has previous attendance with the event or not.
  late Future eventItem;
  Event eventDetails = Event("", "", "", "", "", "", "", DateTime.now(), DateTime.now());
  bool _isAttended = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
            child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                child: SingleChildScrollView(
                    child: Container(
                        // color: Colors.green,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                          const SizedBox(height: 50),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("iAttend",
                                    style: TextStyle(
                                        fontSize: fonttitle,
                                        color: Colors.deepOrange,
                                        fontFamily: 'DMSans',
                                        fontWeight: FontWeight.bold))
                              ]),
                          const SizedBox(
                              height: 40), //spacing n between logo and fields
                          Container(
                              color: const Color.fromARGB(
                                  255, 255, 255, 255), // background color
                              height: 100,
                              width: 350,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        child: Text("Please enter the event code below",
                                            style: TextStyle(
                                                fontSize: fontregular,
                                                color: Colors.deepOrange,
                                                fontFamily: 'DMSans'))),
                                    const SizedBox(height: 10),
                                    Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              color: const Color.fromARGB(255, 179, 112, 112),
                                              height: 30,
                                              width: 230,
                                              child: TextField(
                                                  textAlignVertical: TextAlignVertical.bottom,
                                                  controller: eventcode_controller,
                                                  decoration: const InputDecoration(
                                                      border: OutlineInputBorder(),
                                                      hintText: "Event Code",
                                                      hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)))),
                                          ),
                                          const SizedBox(width: 10),
                                          SizedBox(
                                              width: 100.0,
                                              height: 30.0,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      onSurface: Colors.deepOrange),
                                                  onPressed: () {
                                                    eventItem = eventMngr.getEventByJoiningCode(eventcode_controller.text);
                                                    eventItem.then((value) {
                                                      eventDetails = value;
                                                      setState(() {});
                                                    },
                                                    onError: (e){print(e);});
                                                  },
                                                  child: const Text(
                                                    'Search',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold,
                                                        fontFamily: 'DMSans'),
                                                  )))
                                        ]),
                                    const SizedBox(height: 20),
                                  ]),

                              // Pass the event ID/Name to this function

                      ),

                          templatemkr.EventDetailsContainer(eventDetails),

                          Container(
                              child: Column(children: <Widget>[
                                const SizedBox(height: 20),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(width: 30),
                                      templatemkr.BackButton('back', context),
                                      const SizedBox(
                                          width:
                                          60), // spacing in between back and attend button
                                      SizedBox(
                                          width: 150.0,
                                          height: 52.0,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  onSurface: Colors.deepOrange),
                                              onPressed: () {_isAttended ? null : _NavigateToFacialAuthAndReturnResult(context);
                                              },
                                              child: const Text(
                                                'ATTEND',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'DMSans'),
                                              )))
                                    ])
                              ]))]))))));
  }

  void _NavigateToFacialAuthAndReturnResult(BuildContext context) async {
    if (eventDetails.eventID.isEmpty) {
      showDialog(context: context, builder:(context)=> const AlertDialog(title: Text("ERROR") ,content: Text("Please enter an event code!")));
    }
    else {
      _isAttended = await Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => FacialAuthenticationPage(
                  joiningCode: eventDetails.joiningCode)));
    }
  }
}
