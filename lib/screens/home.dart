import 'package:flutter/material.dart';

import '../api/intra.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  IntraApiService _api = new IntraApiService();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _api.userInfo();
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        title: Text(
          'Epiboard',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 30.0),
        ),
        actions: <Widget>[
          Container(
              margin: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.settings, color: Colors.black54)),
        ],
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
