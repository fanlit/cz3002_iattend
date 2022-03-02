import 'package:flutter/material.dart';
import 'globalenv.dart';

class templatemaker {
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
                    border: OutlineInputBorder(), hintText: hint)),
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
                    border: OutlineInputBorder(), hintText: hint)),
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
                    border: OutlineInputBorder(),
                    hintText: hint,
                    hintStyle: TextStyle(color: HintTextcolor))),
          )
        ]);
  }

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

  Container Attendee(String username, String email, String regdate) {
    return Container(
      constraints: BoxConstraints(maxHeight: double.infinity),
      color: Colors.deepOrange,
      width: double.infinity,
      height: 90,
      child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Name: " + username,
                softWrap: true,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                "Email: " + email,
                softWrap: true,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                "Reg. Date: " + regdate,
                softWrap: true,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ))),
    );
  }

  Column attendeeModule(String username, String email, String regdate) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Attendee(username, email, regdate),
          SizedBox(height: 10)
        ]);
  }

  Container PopulateAttendance() {
    // Dummy data
    var attendees = [
      ['Jim', 'Jim@gmail.com', '2/3/2022'],
      ['Jane1', 'Jane@gmail.com', '2/3/2022'],
      ['Jane2', 'Jane@gmail.com', '2/3/2022'],
      ['Jane3', 'Jane@gmail.com', '2/3/2022'],
      ['Jane4', 'Jane@gmail.com', '2/3/2022'],
      ['Jane5', 'Jane@gmail.com', '2/3/2022']
    ]; // TODO: implement JSON data acquisition to populate with actual attendees
    return Container(
        // color: Colors.amberAccent,
        height: 380,
        width: 325,
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              // Participant module here!
              for (var i = 0; i < 6; i++)
                attendeeModule(
                    attendees[i][0], attendees[i][1], attendees[i][2])
            ])));
  }
}
