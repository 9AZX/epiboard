import 'package:flutter/material.dart';
import '../api/intra.dart';
import 'package:validators/validators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  bool _callIntra(String autolog) {
    var connectionResult = false;
    IntraApiService().autoLogin(autolog).then((value) {
      if (value) {
        connectionResult = true;
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
    return connectionResult;
  }

  _isLogin() async {
    final prefs = await SharedPreferences.getInstance();
    String autologin = prefs.getString('autologin') ?? null;
    if (autologin != null) {
      _callIntra(autologin);
    }
  }

  @override
  void initState() {
    super.initState();
    _isLogin();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
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
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      autovalidate: false,
                      decoration: const InputDecoration(
                        hintText: 'Enter your autologin link',
                        hintStyle: TextStyle(color: Colors.white70),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      onSaved: (String link) {
                        _callIntra(link);
                      },
                      validator: (value) {
                        if (value.isEmpty || !isURL(value, requireTld: true)) {
                          return 'Please enter a autologin link';
                        }
                        if (!_callIntra(value)) {
                          return 'Invalid autologin link';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pushNamed(context, '/home');
                          }
                        },
                        child: Text('Connect'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
