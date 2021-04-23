import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:forrira/models/http_exception.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expriyDate;
  // ignore: unused_field
  String _userId;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expriyDate != null &&
        _expriyDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyB70WBVT2oR6ZtHz5x6FUcRIlRGkgpRYaI';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(
          {'email': email, 'password': password, 'returnSecureToken': true},
        ),
      );

      final responseData = json.decode(response.body);
      //print(responseData);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];

      print(responseData['localId']);
      print(responseData['idToken']);

      _userId = responseData['localId'];
      _expriyDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );

      notifyListeners();
      print(isAuth);
      print('2222');
    } catch (error) {
      throw error;
    }
  }

  Future<void> signUP(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
