import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../api/intra.dart';
import '../models/student.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  IntraApiService _api = new IntraApiService();
  StudentInfoModel _user = new StudentInfoModel();

  refreshUserInfo() async {
    Map<String, dynamic> jsonUser = await _api.userInfo();

    _user = StudentInfoModel.fromJson(jsonUser);
    return jsonUser;
  }

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
    return ScopedModel<StudentInfoModel>(
      model: _user,
      child: Scaffold(
          appBar: AppBar(
            elevation: 2.0,
            backgroundColor: Colors.white,
            title: Text(
              'Epiboard',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0),
            ),
            actions: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.settings, color: Colors.black54)),
            ],
          ),
          body: ScopedModelDescendant<StudentInfoModel>(
            builder: (context, child, user) {
              this._user = user;

              return FutureBuilder(
                future: refreshUserInfo(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(_user.login);
                  } else {
                    return Center(
                      child: new LinearProgressIndicator(),
                    );
                  }
                },
              );
            },
          )),
    );
  }
}
