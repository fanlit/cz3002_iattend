import 'package:cz3002_iattend/globalenv.dart';
import 'package:flutter/material.dart';

class AuthLoadingPage extends StatefulWidget{
  AuthLoadingPage({ Key? key }) : super(key: key);
  @override
  State<AuthLoadingPage> createState() => _AuthLoadingPageState();
}

class _AuthLoadingPageState extends State<AuthLoadingPage>{
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
                            ]))))));
  }
}