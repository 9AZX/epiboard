import 'package:http/http.dart' as http;

class IntraApiService {
  final _baseUrl = "https://intra.epitech.eu";
  final _headers = {
    'Accept': '*/*',
    'Connection': 'keep-alive',
    'Cookie':
        'user=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpbiI6Impvbi5paGxhcy1tb3Vlc2NhQGVwaXRlY2guZXUiLCJ0eiI6bnVsbCwiZXhwIjoxNTY0NzYwMDUzfQ.aTGCQ7xtYlOKr-g91vvDBZ4o9gmqPrIvxbF6c5qtsn0'
  };

  Future<bool> autologinConnect(String link) async {
    final response = await http.get(link, headers: _headers);

    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }

  Future<bool> userInfo() async {
    final response =
        await http.get(_baseUrl + "/user/?format=json", headers: _headers);

    print(response.body);
  }
}
