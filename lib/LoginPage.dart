import 'package:flutter/material.dart';
import 'Templates.dart';
import 'globalenv.dart';
import 'HomePage.dart';


class LoginPageState extends StatelessWidget {
  templatemaker templatemkr = templatemaker();
  TextEditingController email_controller = TextEditingController();
  TextEditingController shdw_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
        body: Container(
            child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                child: SingleChildScrollView(
                    child: Container(
                      width: width,
                      height: height,
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
                              // color: Colors.amberAccent,
                                height: 300,
                                width: 300,
                                child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      templatemkr.Textfield(
                                          "Email", "Email", email_controller),
                                      const SizedBox(height: 20),
                                      templatemkr.Textfield("Password",
                                          "Password", shdw_controller),
                                      const SizedBox(height: 50),
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
                                                  onPressed: () {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(username: 'tim',)));
                                                  }, // TODO: Implement email and password checking function and create Homepage

                                                  child: const Text(
                                                    'Login',
                                                    style: TextStyle(fontSize: 30, fontFamily: 'DMSans'),
                                                  )))
                                        ],
                                      )
                                    ]))
                          ],
                        ))))));

  }
}