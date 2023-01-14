import 'package:ev/screens/OTP_screen.dart';
import 'package:ev/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ev/reusable_widgets/reusable_widgets.dart';
import 'package:ev/main.dart';
import 'package:flutter/foundation.dart';

class signupscreen extends StatefulWidget {
  const signupscreen({Key? key}) : super(key: key);
  @override
  _signupscreenState createState() => _signupscreenState();
  // This widget is the root of your application.
}

class _signupscreenState extends State<signupscreen> {
  bool isChecked = false;
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _EmailTextController = TextEditingController();
  TextEditingController _PhoneTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
                  'Sign Up',
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
                reusableTextField("Enter Name", Icons.person_outlined, false,
                    _nameTextController),
                SizedBox(
                  height: 20,
                ),
                Phonefield("Enter Phone No.", Icons.phone, false,
                    _PhoneTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email", Icons.email_outlined, false,
                    _EmailTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Confirm Password", Icons.lock_outlined, true,
                    _passwordTextController),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        // This is where we update the state when the checkbox is tapped
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      " Accept",
                      style: TextStyle(
                        color: Color.fromARGB(255, 19, 19, 20),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inria Serif',
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => loginscreen()));
                        },
                        child: const Text(
                          " Terms and Condtions",
                          style: TextStyle(
                            color: Color.fromARGB(255, 32, 134, 229),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inria Serif',
                            decoration: TextDecoration.underline,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Signinsignupbutton(context, false, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _EmailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    print("Created New Account");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => otpscreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
                SizedBox(
                  height: 20,
                ),
                Signupoption()
              ]),
            ),
          )),
    );
  }

  Row Signupoption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have a account?",
            style: TextStyle(color: Colors.black, fontFamily: 'Inria Serif')),
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => loginscreen()));
            },
            child: const Text(
              " Login",
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
