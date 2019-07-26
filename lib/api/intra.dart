import 'package:http/http.dart' as http;

class IntraApiService {
  final _baseUrl = "https://intra.epitech.eu";

  Future<bool> autologinConnect(String link) async {
    print(link);
    final response = await http.get(link, headers: {
      'Accept': '*/*',
    });

    if (response.statusCode == 200) {
      print("Okok");
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }
}
