import 'package:flutter/material.dart';
import '';
import 'Templates.dart';
import 'globalenv.dart';

class OrganizeEventPage extends StatefulWidget {
  @override
  State<OrganizeEventPage> createState() => _OrganizeEventPageState();
}

class _OrganizeEventPageState extends State<OrganizeEventPage> {
  TemplateMaker templatemkr = TemplateMaker();
  TextEditingController eventName_controller = TextEditingController();
  TextEditingController venue_controller = TextEditingController();
  TextEditingController des_controller = TextEditingController();

  //TODO: Save event date and time!
  DateTime eventStartDate = DateTime.now();
  TimeOfDay eventStartTime = TimeOfDay.now();
  DateTime eventEndDate = DateTime.now();
  TimeOfDay eventEndTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
            child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
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
                                  height:
                                      40), //spacing n between logo and fields
                              Container(
                                  color: Color.fromRGBO(
                                      199, 199, 199, 1), // background color
                                  height: 470,
                                  width: 350,
                                  child: SingleChildScrollView(
                                      child: Container(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                        templatemkr.TextfieldwithBG(
                                            "Event Name",
                                            "Event Name",
                                            eventName_controller,
                                            Color.fromRGBO(255, 255, 255, 1)),
                                        const SizedBox(height: 30),
                                        templatemkr.TextfieldwithBG(
                                            "Venue",
                                            "Venue",
                                            venue_controller,
                                            Color.fromRGBO(255, 255, 255, 1)),
                                        const SizedBox(height: 30),

                                        // Configure event start and end DateTime
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            ListTile(
                                              title: Text(
                                                  "Event Start Date: ${eventStartDate.day}, ${eventStartDate.month}, ${eventStartDate.year}",
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontFamily: 'DMSans',
                                                      color:
                                                          Colors.deepOrange)),
                                              trailing: Icon(
                                                  Icons.keyboard_arrow_down),
                                              onTap: pickEventDate,
                                            ),
                                            ListTile(
                                                title: Text(
                                                    "Event Start Time: ${eventStartTime.hour}:${eventStartTime.minute}",
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: 'DMSans',
                                                        color:
                                                            Colors.deepOrange)),
                                                trailing: Icon(
                                                    Icons.keyboard_arrow_down),
                                                onTap: pickEventTime),
                                          ],
                                        ),
                                        const SizedBox(height: 10),

                                        // Configure event end DateTime
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            ListTile(
                                              title: Text(
                                                  "Event End Date: ${eventEndDate.day}, ${eventEndDate.month}, ${eventEndDate.year}",
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontFamily: 'DMSans',
                                                      color:
                                                          Colors.deepOrange)),
                                              trailing: Icon(
                                                  Icons.keyboard_arrow_down),
                                              onTap: pickEventDate,
                                            ),
                                            ListTile(
                                                title: Text(
                                                    "Event End Time: ${eventEndTime.hour}:${eventEndTime.minute}",
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: 'DMSans',
                                                        color:
                                                            Colors.deepOrange)),
                                                trailing: Icon(
                                                    Icons.keyboard_arrow_down),
                                                onTap: pickEventTime),
                                          ],
                                        ),

                                        const SizedBox(height: 10),
                                        Text("Description",
                                            style: TextStyle(
                                                fontSize: fontregular,
                                                color: Colors.deepOrange,
                                                fontFamily: 'DMSans')),
                                        Container(
                                            height: 120,
                                            width: 350,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                            child: TextField(
                                              controller: des_controller,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: 'Description'),
                                              maxLines: 4,
                                              minLines: 4,
                                            )),

                                        const SizedBox(height: 10),
                                      ])))),

                              Container(
                                  height: 100,
                                  width: 300,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            templatemkr.BackButton(
                                                'back', context),
                                            SizedBox(width: 20),
                                            SizedBox(
                                                width: 200.0,
                                                height: 52.0,
                                                child: ElevatedButton(
                                                    onPressed:
                                                        () {

                                                        }, // TODO: Create event logic: eventcode generator and save event to backend
                                                    child: const Text(
                                                      'Create Event',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontFamily: 'DMSans'),
                                                    )))
                                          ],
                                        )
                                      ]))
                            ]))))));
  }

  pickEventDate() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: eventStartDate,
        firstDate: DateTime(DateTime.now().year - 10),
        lastDate: DateTime(DateTime.now().year + 10));

    if (date != null) {
      setState(() {
        eventStartDate = date;
      });
    }
  }

  pickEventTime() async {
    TimeOfDay? t =
        await showTimePicker(context: context, initialTime: eventStartTime);
    if (t != null) {
      setState(() {
        eventStartTime = t;
      });
    }
  }
}
