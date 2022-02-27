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
  Column TextfieldwithBG(String fieldname, String hint, TextEditingController controller, Color BGcolor){
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
}
