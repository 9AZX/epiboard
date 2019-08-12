import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<bool> userInfo() async {
    final prefs = await SharedPreferences.getInstance();

    String autologin = prefs.getString('autologin') ?? false;
    var response = await http.get(autologin + "/user/?format=json");

    return true;
  }
}
