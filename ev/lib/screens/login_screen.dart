import 'package:ev/reusable_widgets/reusable_widgets.dart';
import 'package:ev/screens/fgtpswd_screen.dart';
import 'package:ev/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ev/screens/signup_screen.dart';
import 'package:ev/main.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  //initializing firebase

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
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Inria_Serif',
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  reusableTextField("Enter Email", Icons.email_outlined, false,
                      _EmailTextController),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outline, true,
                      _passwordTextController),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'Inria Serif')),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => fgtpswdscreen()));
                          },
                          child: const Text(
                            " Forgot password?",
                            style: TextStyle(
                              color: Color.fromARGB(255, 99, 101, 103),
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
                  Signinsignupbutton(context, true, () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _EmailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  }),
                  Signgooglebutton(
                    context,
                    true,
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signupscreen()));
                    },
                  ),
                  Row(children: [
                    googlebutton(context, true, () {}),
                    SizedBox(
                      width: 10,
                    ),
                    Facebookbutton(context, true, () {})
                  ]),
                  Signupoption()
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
