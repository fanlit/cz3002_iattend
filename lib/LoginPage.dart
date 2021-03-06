import 'package:cz3002_iattend/Services/AuthenticationService.dart';
import 'package:flutter/material.dart';
import 'Templates.dart';
import 'globalenv.dart';


class LoginPageState extends StatefulWidget {
  @override
  State<LoginPageState> createState() => _LoginPageStateState();
}

class _LoginPageStateState extends State<LoginPageState> {
  final AuthenticationService _auth = AuthenticationService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  TemplateMaker templatemkr = TemplateMaker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                child: SingleChildScrollView(
                    child: Container(
                      // width: width,
                      // height: height,
                      // color: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(height: 110),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      height: iconsize[0],
                                      width: iconsize[1],
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/iAttendIcon.png')))),
                                  Text("iAttend",
                                      style: TextStyle(
                                          fontSize: fonttitle,
                                          color: Colors.deepOrange,
                                          fontFamily: 'DMSans',
                                          fontWeight: FontWeight.bold))
                                ]),
                            const SizedBox(height: 70),
                            Container(
                                child: Form(
                                    key: _formKey,
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Email",
                                          style: TextStyle(
                                              fontSize: fontregular,
                                              color: Colors.deepOrange,
                                              fontFamily: 'DMSans'
                                          )),
                                          TextFormField(
                                              validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(), hintText: "Email"
                                              ),
                                              onChanged: (val) {
                                                setState(() => email = val);
                                              }
                                          ),
                                          const SizedBox(height: 20),
                                          // templatemkr.Textfield("Password",
                                          //     "Password", shdw_controller),
                                          Text("Password",
                                              style: TextStyle(
                                                  fontSize: fontregular,
                                                  color: Colors.deepOrange,
                                                  fontFamily: 'DMSans'
                                              )),
                                          TextFormField(
                                              obscureText: true,
                                              validator: (val) => val!.length < 8 ? 'Password should be at least 8 chars long' : null,
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(), hintText: "Password"
                                              ),
                                              onChanged: (val) {
                                                setState(() => password = val);
                                              }
                                          ),
                                          const SizedBox(height: 50),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              templatemkr.BackButton(
                                                  'back', context),
                                              const SizedBox(width: 20),
                                              SizedBox(
                                                  width: 200.0,
                                                  height: 52.0,
                                                  child: ElevatedButton(
                                                      onPressed: () async {
                                                        if (_formKey.currentState!.validate()) {
                                                          dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                                          if (result == null) {
                                                            setState(() => error = 'Log in unsuccessful, please try again');
                                                          }
                                                          else {
                                                            setState(() => error = '');
                                                            Navigator.pop(context, false);
                                                          }
                                                        }
                                                      },
                                                      child: const Text(
                                                        'Login',
                                                        style: TextStyle(fontSize: 30, fontFamily: 'DMSans'),
                                                      ))),
                                            ],
                                          ),
                                          const SizedBox(height: 12.0),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                error,
                                                style: const TextStyle(color: Colors.red, fontSize: 14.0),
                                              ),
                                            ],
                                          )
                                        ])
                                )
                                )
                          ],
                        ))))));
  }
}