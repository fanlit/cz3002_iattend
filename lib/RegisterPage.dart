import 'package:cz3002_iattend/Services/DatabaseServices/UserDataService.dart';
import 'package:flutter/material.dart';
import 'Services/AuthenticationService.dart';
import 'Services/FileImageService.dart';
import 'Templates.dart';
import 'globalenv.dart';
import 'PhotoTakingPage.dart';
import 'dart:io';
import 'Models/iAttendUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Services/DatabaseServices/UserDataService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:camera/camera.dart';

class RegisterPageState extends StatefulWidget {
  @override
  State<RegisterPageState> createState() => _RegisterPageStateState();
}

class _RegisterPageStateState extends State<RegisterPageState> {
  final AuthenticationService _auth = AuthenticationService();
  final UserDataService _userDataService = UserDataService();
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  String repeatpassword = '';
  String error = '';
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  XFile? profilePic;
  TemplateMaker templatemkr = TemplateMaker();

  // TextEditingController email_controller = TextEditingController();
  // TextEditingController name_controller = TextEditingController();
  // TextEditingController shdw_controller = TextEditingController();
  // TextEditingController shdw2_controller = TextEditingController();

  void _navigateAndGetProfilePicture(BuildContext context) async {
    profilePic = await Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoTakingPage()));
  }


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
                            const SizedBox(height: 40), //spacing n between logo and fields
                            Container(
                                // color: Color.fromRGBO(199, 199, 199, 1),  // background color
                                // height: 600,
                                // width: 350,
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:<Widget>[
                                      // templatemkr.TextfieldwithBG("Name", "Name", name_controller,Color.fromRGBO(255, 255, 255, 1)),
                                      Text("Name",
                                          style: TextStyle(
                                              fontSize: fontregular,
                                              color: Colors.deepOrange,
                                              fontFamily: 'DMSans'
                                          )),
                                      TextFormField(
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(), hintText: "Name"
                                          ),
                                          validator: (val) => val!.isEmpty ? 'Please enter name' : null,
                                          onChanged: (val) {
                                            setState(() => name = val);
                                          }
                                      ),
                                      const SizedBox(height:20),
                                      // templatemkr.TextfieldwithBG("Email", "Email", email_controller,Color.fromRGBO(255, 255, 255, 1)),
                                      Text("Email",
                                          style: TextStyle(
                                              fontSize: fontregular,
                                              color: Colors.deepOrange,
                                              fontFamily: 'DMSans'
                                          )),
                                      TextFormField(
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(), hintText: "Email"
                                          ),
                                          validator: (val) => validateEmail(val),
                                          onChanged: (val) {
                                            setState(() => email = val);
                                          }
                                      ),
                                      const SizedBox(height:20),
                                      // templatemkr.TextfieldwithBG("Password", "Password", shdw_controller,Color.fromRGBO(255, 255, 255, 1)),
                                      Text("Password",
                                          style: TextStyle(
                                              fontSize: fontregular,
                                              color: Colors.deepOrange,
                                              fontFamily: 'DMSans'
                                          )),
                                      TextFormField(
                                          obscureText: true,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(), hintText: "Password"
                                          ),
                                          validator: (val) => validatePassword(val),
                                          onChanged: (val) {
                                            setState(() => password = val);
                                          }
                                      ),
                                      const SizedBox(height:20),
                                      // templatemkr.TextfieldwithBG("Repeat Password", "Password", shdw2_controller,Color.fromRGBO(255, 255, 255, 1)),
                                      Text("Repeat Password",
                                          style: TextStyle(
                                              fontSize: fontregular,
                                              color: Colors.deepOrange,
                                              fontFamily: 'DMSans'
                                          )),
                                      TextFormField(
                                          obscureText: true,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(), hintText: "Password"
                                          ),
                                          validator: (val) {
                                            if (val == null || val.isEmpty) {
                                              return 'Please enter password again';
                                            }
                                            if (val != password) {
                                              return 'Passwords do not match';
                                            }
                                            return null;
                                          },
                                          onChanged: (val) {
                                            setState(() => repeatpassword = val);
                                          }
                                      ),
                                      const SizedBox(height:20),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            const SizedBox(
                                                width: 200.0,
                                                height: 60.0,
                                                child:
                                                Center(child: Text("Please take a photo of yourself"))
                                                    ),
                                                    SizedBox(width:50), // spacing in between upload and camera
                                                    SizedBox( //camera logo
                                                      width: 60.0,
                                                      height: 60.0,
                                                      child: ElevatedButton.icon(
                                                          onPressed: () {
                                                            _navigateAndGetProfilePicture(context);
                                                          },
                                                          icon: const Icon(Icons.camera_alt, size: 24),
                                                          label: const Text("")),
                                                              )
                                          ]
                                    ),
                                      const SizedBox(height:20)
                                    ]),
                                )),
                            const SizedBox(height:20),
                            Container(
                              height:100,
                              width:300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: 300.0,
                                    height: 52.0,
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          if (_formKey.currentState!.validate()) {
                                            if (userFaceArray.isEmpty) {
                                              await showDialog(context: context, builder:(context)=> AlertDialog(content: Text("Please take a photo of yourself first!")));
                                            } else {
                                              dynamic result = await _auth.registerWithEmailAndPassword(email, password, name);
                                              if (result == null) {
                                                setState(() => error = 'Registration unsuccessful, please try again');
                                              }
                                              else {
                                                final uid = FirebaseAuth.instance.currentUser!.uid;
                                                _userDataService.createUserData(uid, email, name, userFaceArray);
                                                saveImage(File(profilePic!.path), uid);
                                                setState(() => error = '');
                                                Navigator.pop(context, false);
                                              }
                                            }
                                          }
                                        },
                                        child: const Text(
                                          'Register',
                                          style: TextStyle(fontSize: 30, fontFamily: 'DMSans'),
                                        ))),
                                  SizedBox(height: 12.0),
                                  Text(
                                    error,
                                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                                  )
                                ]
                              )
    )]))))));
  }

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    RegExp regex =
    // RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter a valid password';
      } else {
        return null;
      }
    }
  }
}