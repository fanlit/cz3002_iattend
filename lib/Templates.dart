import 'package:flutter/material.dart';
import 'globalenv.dart';
import 'Models/event.dart';

class TemplateMaker {


  Column Textfield(
      String fieldname, String hint, TextEditingController controller) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              child: Text(fieldname,
                  style: TextStyle(
                      fontSize: fontregular,
                      color: Colors.deepOrange,
                      fontFamily: 'DMSans'))),
          Container(
            height: 40,
            child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(), hintText: hint)),
          )
        ]);
  }

  Column TextfieldwithBG(String fieldname, String hint,
      TextEditingController controller, Color BGcolor) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              child: Text(fieldname,
                  style: TextStyle(
                      fontSize: fontregular,
                      color: Colors.deepOrange,
                      fontFamily: 'DMSans'))),
          Container(
            color: BGcolor,
            height: 40,
            child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(), hintText: hint)),
          )
        ]);
  }

  Column HintfieldwithBG(String fieldname, String hint,
      TextEditingController controller, Color BGcolor, Color HintTextcolor) {
    return Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              child: Text(fieldname,
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: fontregular,
                      color: Colors.deepOrange,
                      fontFamily: 'DMSans'))),
          Container(
            color: BGcolor,
            height: 40,
            child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: hint,
                    hintStyle: TextStyle(color: HintTextcolor))),
          )
        ]);
  }

  // BACK BUTTON
  // Back Buttons are the buttons users press to go back to the previous page. More useful for iOS devices

  SizedBox BackButton(String name, BuildContext context) {
    return SizedBox(
      width: 60.0,
      height: 52.0,
      child: ElevatedButton.icon(
          onPressed: () {
            Navigator.pop(context, false);
          },
          icon: const Icon(Icons.arrow_back, size: 24),
          label: const Text("")),
    );
  }

  Container Attendee(String username, String email) {
    print("2");
    print(email);
    print(username);
    return Container(
      constraints: const BoxConstraints(maxHeight: double.infinity),
      color: Colors.deepOrange,
      width: double.infinity,
      height: 70,
      child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                "Name: " + username,
                softWrap: true,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                "Email: " + email,
                softWrap: true,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ))),
    );
  }

  Column attendeeModule(String email, String username) {
    print("1");
    print(email);
    print(username);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Attendee(username, email),
          const SizedBox(height: 10)
        ]);
  }

  // Container PopulateEventAttendees (String eventID) {
  //   print(eventID);
  //   late Future attendanceList;
  //   Map<String, String> attendees = {};
  //   AttendanceDataService attendanceMngr = AttendanceDataService();
  //   attendanceList = attendanceMngr.getAttendanceListByEventID(eventID);
  //   attendanceList.then((value){
  //     attendees = value;
  //     if(value == null){
  //       print("here");
  //       return const CircularProgressIndicator();
  //     }
  //     else{
  //       print("here2");
  //       print(attendees.keys);
  //       return Container(
  //         color: Colors.amberAccent,
  //           height: 380,
  //           width: 325,
  //           child: SingleChildScrollView(
  //               child: Column(
  //                   crossAxisAlignment:  CrossAxisAlignment.center,
  //                   children: <Widget>[
  //                     for(var attendee in attendees.entries)
  //                       attendeeModule(attendee.key, attendee.value)
  //                   ])));
  //     }
  //   });
  //   return Container(child: const Text("oh no!"));
  // }

  Container EventDetailsContainer(Event eventItem) {

    return Container(
        color: const Color.fromARGB(255, 182, 182, 182), // background color
        height: 450,
        width: 350,
        child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 5),
            child: SingleChildScrollView(
                child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          // Row to display event name text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width: 120, child:Text("Name: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.deepOrange,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.bold))),

                              // Display event name here!
                              Expanded(child: Text(eventItem.eventName,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.deepOrange,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.bold))),
                            ],
                          ),

                          const SizedBox(height: 10),

                          // Row to display event code
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width: 120, child: Text("Code: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.deepOrange,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.bold))),

                              // Display Venue name here!
                              Expanded(child: Text(eventItem.joiningCode,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.deepOrange,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.bold))),
                            ],
                          ),

                          const SizedBox(height: 10),

                          //Row to display Venue
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width: 120, child: Text("Venue:",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.deepOrange,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.bold))),

                              // Display Venue name here!
                              Expanded(child: Text(eventItem.venue,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.deepOrange,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.bold))),
                            ],
                          ),

                          const SizedBox(height: 10),

                          //Row to display event start date
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width:120 ,child: Text("Start: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.deepOrange,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.bold))),

                              // Display event date here!
                              Expanded(child: Text(eventItem.start.toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.deepOrange,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.bold))),
                            ],
                          ),

                          const SizedBox(height: 10),

                          // Row to display event end date
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width:120 ,child: Text("End: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.deepOrange,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.bold))),

                              // Display event date here!
                              Expanded(child: Text(eventItem.end.toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.deepOrange,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.bold))),
                            ],
                          ),

                          // Row to display event description
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width: 120, child:Text("Description: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.deepOrange,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.bold))),

                              // Display Description here!
                              Expanded(child: Text(eventItem.description,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.deepOrange,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.bold))),
                            ],
                          ),
                ])))));
  }

  Future<void> registeredDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registered Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Thank you for registering an Event!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
