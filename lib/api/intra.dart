import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';

class IntraApiService {
  final _baseUrl = "https://intra.epitech.eu";
  var _headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  var dio = new Dio();

  Future<bool> autologinConnect(String link) async {
    dio.interceptors.add(CookieManager(CookieJar()));
    print(_headers);
    try {
      Response response = await Dio().get(link);
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> userInfo() async {
    final response = await Dio().get(_baseUrl + "/user/?format=json");

    print(response.data);
  }
}
