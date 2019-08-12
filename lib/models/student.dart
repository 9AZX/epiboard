import 'package:scoped_model/scoped_model.dart';

class StudentModel extends Model {
  String login;
  String lastname;
  String firstname;
  String picture = "https://intra.epitech.eu";
  int semester;
  int credits;
  String gpa;
}
