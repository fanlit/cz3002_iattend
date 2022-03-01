import 'package:flutter/material.dart';
import 'Templates.dart';
import 'globalenv.dart';

class OrganizeEventPage extends StatefulWidget {
  @override
  State<OrganizeEventPage> createState() => _OrganizeEventPageState();
}

class _OrganizeEventPageState extends State<OrganizeEventPage> {
  templatemaker templatemkr = templatemaker();
  TextEditingController eventName_controller = TextEditingController();
  TextEditingController venue_controller = TextEditingController();
  DateTime eventDate = DateTime.now();
  TimeOfDay eventTime = TimeOfDay.now();
  TextEditingController des_controller = TextEditingController();

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
                                  height:
                                      40), //spacing n between logo and fields
                              Container(
                                  color: Color.fromRGBO(
                                      199, 199, 199, 1), // background color
                                  height: 470,
                                  width: 350,
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
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            ListTile(
                                              title: Text(
                                                  "Event Date: ${eventDate.day}, ${eventDate.month}, ${eventDate.year}",
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
                                                    "Event Time: ${eventTime.hour}:${eventTime.minute}",
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
                                      ])),
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
                                                        () {}, // TODO: Create event logic
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
        initialDate: eventDate,
        firstDate: DateTime(DateTime.now().year - 10),
        lastDate: DateTime(DateTime.now().year + 10));

    if (date != null) {
      setState(() {
        eventDate = date;
      });
    }
  }

  pickEventTime() async {
    TimeOfDay? t =
        await showTimePicker(context: context, initialTime: eventTime);
    if (t != null) {
      setState(() {
        eventTime = t;
      });
    }
  }
}
