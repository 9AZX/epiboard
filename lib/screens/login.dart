import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: <Widget>[
        Center(
          child: new Image.asset(
            'assets/fond.jpg',
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
          ),
        ),
        Center(
            child: TextField(
          autocorrect: false,
          decoration: InputDecoration(
            labelText: 'Enter your autologin link',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        )),
      ],
    ));
  }
}
