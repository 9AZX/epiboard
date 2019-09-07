import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  Calendar({Key key}) : super(key: key);

  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
      ),
      body: Text("Yo"),
    );
  }
}
