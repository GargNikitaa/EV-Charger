import 'package:ev/reusable_widgets/reusable_widgets.dart';
import 'package:ev/screens/OTP_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ev/screens/signup_screen.dart';
import 'package:ev/screens/login_screen.dart';
import 'package:ev/screens/fgtpswd2_screen.dart';
import 'package:ev/main.dart';

class fgtpswdscreen extends StatefulWidget {
  const fgtpswdscreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _fgtpswdscreenState createState() => _fgtpswdscreenState();
}

class _fgtpswdscreenState extends State<fgtpswdscreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _EmailTextController = TextEditingController();
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
                    'Forgot Password?',
                    style: TextStyle(
                      fontFamily: 'Inria_Serif',
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enter your Email to get the OTP',
                    style: TextStyle(
                      fontFamily: 'Inria_Serif',
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  reusableTextField("Enter Email", Icons.email_outlined, false,
                      _EmailTextController),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Didn't get the OPT? ",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'Inria Serif')),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => fgtpswd2screen()));
                          },
                          child: const Text(
                            "Try with Phone no.",
                            style: TextStyle(
                              color: Color.fromARGB(255, 32, 134, 229),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inria Serif',
                              decoration: TextDecoration.underline,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Continuebutton(
                    context,
                    true,
                    () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => otpscreen()));
                    },
                  ),
                ]),
              ),
            )));
  }

  Row Signupoption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have a account?",
            style: TextStyle(color: Colors.black, fontFamily: 'Inria Serif')),
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => signupscreen()));
            },
            child: const Text(
              " Sign Up",
              style: TextStyle(
                color: Color.fromARGB(255, 32, 134, 229),
                fontWeight: FontWeight.bold,
                fontFamily: 'Inria Serif',
                decoration: TextDecoration.underline,
              ),
            ))
      ],
    );
  }
}
