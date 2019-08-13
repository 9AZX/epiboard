import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/login.dart';
import './screens/office365.dart';
import './screens/home.dart';
import './screens/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Epiboard',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/office': (context) => Office365(),
        '/home': (context) => Home(),
        '/settings': (context) => Settings(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
