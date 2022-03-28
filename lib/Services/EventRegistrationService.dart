import 'package:cz3002_iattend/globalenv.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:cz3002_iattend/Templates.dart';
import 'DatabaseServices/EventDataService.dart';

class EventRegistrationService{
  EventDataService eventMngr = EventDataService();
  TemplateMaker templatemkr = TemplateMaker();

  String GenerateRandomCode() {
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890!@#%^&*_+/';
    Random _rnd = Random.secure();
    String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    return(getRandomString(6));
  }

  void registerEvent(BuildContext context, String eventName, String venue, String descp, DateTime eventStartDate, DateTime eventEndDate) {
    String joiningCode = GenerateRandomCode();
    eventMngr.createEventData(eventName, venue, username, email, descp, joiningCode, eventStartDate, eventEndDate);
    templatemkr.registeredDialog(context);
  }
}