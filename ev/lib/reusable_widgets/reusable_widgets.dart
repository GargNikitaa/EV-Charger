import 'package:flutter/material.dart';
import 'package:ev/main.dart';
import 'package:ev/reusable_widgets/reusable_widgets.dart';
import 'package:ev/screens/fgtpswd_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ev/screens/signup_screen.dart';
import 'package:ev/screens/home.dart';

Image logowidth(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    height: 240,
    width: 240,
    color: Color.fromARGB(255, 39, 38, 38),
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Color.fromARGB(255, 32, 31, 31),
    style: TextStyle(color: Color.fromARGB(255, 47, 46, 46)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Color.fromARGB(255, 47, 46, 46),
      ),
      labelText: text,
      labelStyle: TextStyle(
          color: Color.fromARGB(255, 52, 52, 52), fontFamily: 'Inria_Serif'),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
              width: 2, style: BorderStyle.none, color: Colors.black)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

TextField Phonefield(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Color.fromARGB(255, 32, 31, 31),
    style: TextStyle(color: Color.fromARGB(255, 47, 46, 46)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Color.fromARGB(255, 47, 46, 46),
      ),
      labelText: text,
      labelStyle: TextStyle(
          color: Color.fromARGB(255, 52, 52, 52), fontFamily: 'Inria_Serif'),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
              width: 2, style: BorderStyle.none, color: Colors.black)),
    ),
    keyboardType: isPasswordType ? TextInputType.number : TextInputType.number,
  );
}

Container Signinsignupbutton(
    BuildContext context, bool islogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        islogin ? 'Login' : 'Sign Up',
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'Inria_Serif'),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Color.fromARGB(208, 21, 204, 106);
            }
            return Color.fromARGB(255, 13, 126, 86);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),
    ),
  );
}

Container Signgooglebutton(BuildContext context, bool islogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        islogin ? 'Or Sign In With' : 'Sign Up',
        style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'Inria_Serif'),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Color.fromARGB(184, 213, 226, 214);
            }
            return Color.fromARGB(246, 213, 226, 214);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),
    ),
  );
}

Container googlebutton(BuildContext context, bool islogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width / 2.4,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 5, 0, 30),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Row(
        children: <Widget>[
          new Image.asset(
            'images/google.png',
            height: 30.0,
          ),
          SizedBox(
            width: 10,
          ),
          new Expanded(
            child: Text(
              islogin ? 'Google' : 'Google',
              style: const TextStyle(
                  color: Color.fromARGB(255, 57, 57, 57),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'Inria_Serif'),
            ),
          ),
        ],
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Color.fromARGB(184, 213, 226, 214);
            }
            return Color.fromARGB(246, 213, 226, 214);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),
    ),
  );
}

Container Facebookbutton(BuildContext context, bool islogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width / 2.2,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 5, 0, 30),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: new Row(
        children: <Widget>[
          Image.asset(
            'images/fb.png',
            height: 30.0,
          ),
          SizedBox(
            width: 10,
          ),
          new Expanded(
            child: Text(
              islogin ? 'Facebook' : 'Facebook',
              style: const TextStyle(
                  color: Color.fromARGB(255, 57, 57, 57),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'Inria_Serif'),
            ),
          ),
        ],
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Color.fromARGB(184, 213, 226, 214);
            }
            return Color.fromARGB(246, 213, 226, 214);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),
    ),
  );
}

Container Continuebutton(BuildContext context, bool iscont, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        iscont ? 'Continue' : 'Continue',
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'Inria_Serif'),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Color.fromARGB(208, 21, 204, 106);
            }
            return Color.fromARGB(255, 13, 126, 86);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),
    ),
  );
}
