import 'package:cz3002_iattend/globalenv.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:cz3002_iattend/Templates.dart';
import 'package:flutter/material.dart';
import 'DatabaseServices/EventDataService.dart';

class EventRegistrationService {
  EventDataService eventMngr = EventDataService();
  TemplateMaker templatemkr = TemplateMaker();

  String GenerateRandomCode() {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890!@#%^&*_+/';
    Random _rnd = Random.secure();
    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    return (getRandomString(6));
  }

  void registerEvent (
      BuildContext context,
      String eventName,
      String venue,
      String descp,
      DateTime eventStartDate,
      DateTime eventEndDate,
      TimeOfDay eventStartTime,
      TimeOfDay eventEndTime) {
        String joiningCode = GenerateRandomCode();
        final startDateTime = DateTime(eventStartDate.year, eventStartDate.month,
            eventStartDate.day, eventStartTime.hour, eventStartTime.minute);
        final endDateTime = DateTime(eventEndDate.year, eventEndDate.month,
            eventEndDate.day, eventEndTime.hour, eventEndTime.minute);
        eventMngr.createEventData(eventName, venue, username, email, descp,
            joiningCode, startDateTime, endDateTime);


        templatemkr.registeredDialog(context);
  }
}
