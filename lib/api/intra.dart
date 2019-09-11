import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class IntraApiService {
  static var _baseUrl = "https://intra.epitech.eu/";

  Future<bool> autoLogin(String link) async {
    final prefs = await SharedPreferences.getInstance();
    var response = await http.get(link + "/user/?format=json");
    if (response.statusCode == 200) {
      prefs.setString('autologin', link);
      return true;
    } else {
      return false;
    }
  }

  Future<Map<String, dynamic>> userInfo() async {
    String autologin = await getAutologin();
    var response = await http.get(autologin + "/user/?format=json");

    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> generalInfo() async {
    String autologin = await getAutologin();
    var response = await http.get(autologin + "/?format=json");

    return json.decode(response.body);
  }

  Future<String> getAutologin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('autologin') ?? false;
  }
}
