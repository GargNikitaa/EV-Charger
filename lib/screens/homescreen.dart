import 'package:ev/screens/OTP_screen.dart';
import 'package:ev/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ev/reusable_widgets/reusable_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:ev/reusable_widgets/reusable_widgets.dart';
import 'package:ev/screens/fgtpswd_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ev/screens/signup_screen.dart';
import 'package:ev/main.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: Text("LogOut"),
        onPressed: () {
          FirebaseAuth.instance.signOut().then((value) {
            print("Signed Out");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => loginscreen()));
          });
        },
      )),
    );
  }
}
