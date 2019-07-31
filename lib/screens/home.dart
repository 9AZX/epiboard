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
    //_api.userInfo();
    return Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
