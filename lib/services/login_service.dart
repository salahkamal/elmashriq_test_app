import 'package:elmashriqtestapp/models/user_data.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService extends ChangeNotifier {
  AuthData _authData;

  AuthData get authData => _authData;

  Future<void> userLogin(String email, String password) async {
    final apiUrl = 'http://rest.roayasoft.com/api/login';
    final response =
        await http.post(apiUrl, body: {"email": email, "password": password});
    _authData = AuthData.fromJson(json.decode(response.body));
    notifyListeners();
  }
}
