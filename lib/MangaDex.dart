import 'dart:convert';

import 'package:http/http.dart' as http;

class MangaDexAPI {
  String baseUrl = '';
  String mangaUrl = '';
  String authUrl = '';

  MangaDexAPI() {
    this.baseUrl = 'api.mangadex.org';
    this.mangaUrl = '/manga';
    this.authUrl = '/auth/login';
  }
  Future<String> searchManga([Map<String, dynamic>? params]) async {
    Uri url = Uri.http(baseUrl, mangaUrl, params);
    var response = await http.read(url);
    print(response);
    return response;
  }

  Future<void> mangadexLogin(String username, String password) async {
    Uri url = Uri.https(baseUrl, authUrl);
    http.Response success = await http.post(url, body: {
      'username': username,
      'password': password
    });
    var jsonResponse = jsonDecode(success.body);
    print(jsonResponse['errors'][0]['status']);
  }

  void storeConfig() {
    Null;
  }
}
