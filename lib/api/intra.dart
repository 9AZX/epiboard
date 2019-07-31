import 'package:dio/dio.dart';

class IntraApiService {
  static var _baseUrl = "https://intra.epitech.eu";
  static var dio = new Dio();

  Future<bool> userInfo() async {
    var response = await Dio().get(_baseUrl + "/user/?format=json");

    print(response.data);

    return true;
  }
}
