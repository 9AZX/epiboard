import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
    _user.picture = await _api.getAutologin() + _user.picture;

    print(_user.picture);
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
                color: Colors.blueGrey,
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
                  return _dashboard(context);
                } else {
                  return Center(
                    child: new LinearProgressIndicator(),
                  );
                }
              },
            );
          },
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
                          fontWeight: FontWeight.w700,
                        )),
                    Text("Semester ${_user.semester}",
                        style: TextStyle(
                          color: Colors.black,
                        ))
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
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 34.0),
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
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 34.0),
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
                        Text('Upcoming Events',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 24.0)),
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
        StaggeredTile.extent(2, 220.0),
      ],
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: Color(0x802196F3),
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
