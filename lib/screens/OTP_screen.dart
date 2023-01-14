import 'package:ev/reusable_widgets/reusable_widgets.dart';
import 'package:ev/screens/fgtpswd_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ev/screens/signup_screen.dart';
import 'package:ev/screens/login_screen.dart';
import 'package:ev/screens/fgtpswd2_screen.dart';
import 'package:ev/screens/OTP_screen.dart';

class otpscreen extends StatefulWidget {
  const otpscreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _otpscreenState createState() => _otpscreenState();
}

class _otpscreenState extends State<otpscreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _EmailTextController = TextEditingController();
  TextEditingController _PhoneTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    20, MediaQuery.of(context).size.height * 0.15, 20, 0),
                child: Column(children: <Widget>[
                  Text(
                    'Enter your OTP',
                    style: TextStyle(
                      fontFamily: 'Inria_Serif',
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Enter the code sent to your phone/gmail',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Continuebutton(
                    context,
                    true,
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signupscreen()));
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Didn't get the OTP?",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'Inria Serif')),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signupscreen()));
                          },
                          child: const Text(
                            " Resend",
                            style: TextStyle(
                              color: Color.fromARGB(255, 32, 134, 229),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inria Serif',
                              decoration: TextDecoration.underline,
                            ),
                          ))
                    ],
                  ),
                ]),
              ),
            )));
  }
}
