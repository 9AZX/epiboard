import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../api/intra.dart';
import '../models/student.dart';
import '../models/general.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  IntraApiService _api = new IntraApiService();
  StudentInfoModel _user = new StudentInfoModel();
  GeneralInfoModel _general = new GeneralInfoModel();

  refreshInfo() async {
    Map<String, dynamic> jsonUser = await _api.userInfo();
    Map<String, dynamic> jsonEvent = await _api.generalInfo();

    _user = StudentInfoModel.fromJson(jsonUser);
    _user.picture = await _api.getAutologin() + _user.picture;
    _general = GeneralInfoModel.fromJson(jsonEvent);

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
      child: ScopedModel<GeneralInfoModel>(
        model: _general,
        child: Scaffold(
          appBar: AppBar(
            elevation: 2.0,
            title: Text(
              'Epiboard',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.0),
            ),
            actions: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    icon: Icon(Icons.settings),
                    tooltip: "Settings",
                    onPressed: () => Navigator.pushNamed(context, '/settings'),
                  )),
            ],
          ),
          body: ScopedModelDescendant<StudentInfoModel>(
            builder: (context, child, user) {
              this._user = user;
              return ScopedModelDescendant<GeneralInfoModel>(
                  builder: (context, child, general) {
                this._general = general;
                return FutureBuilder(
                  future: refreshInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _dashboard(context);
                    } else {
                      return Center(
                        child: new LinearProgressIndicator(),
                      );
                    }
                  },
                );
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _dashboard(BuildContext context) {
    return StaggeredGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      children: <Widget>[
        _buildTile(
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(_user.title,
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        )),
                    Text(
                      "Semester ${_user.semester}",
                    )
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: Image.network(
                    _user.picture,
                  ),
                )
              ],
            ),
          ),
        ),
        _buildTile(
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                Text(
                  '${_user.credits} credits',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 34.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        _buildTile(
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                Text(
                  '${_user.gpa.single.gpa} GPA',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 34.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        _buildTile(
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Next activity',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                        ),
                        Text(
                          _general.board.getNextEvent().title,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          _general.board.getNextEvent().salle,
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          "${_general.board.getNextEvent().timelineStart} - ${_general.board.getNextEvent().getEndHour()}",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
      staggeredTiles: [
        StaggeredTile.extent(2, 110.0),
        StaggeredTile.extent(1, 180.0),
        StaggeredTile.extent(1, 180.0),
        StaggeredTile.extent(2, 150.0),
      ],
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      child: InkWell(
          onTap: onTap != null
              ? () => onTap()
              : () {
                  print('Not set yet');
                },
          child: child),
    );
  }
}
