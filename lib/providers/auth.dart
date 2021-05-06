import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:forrira/models/http_exception.dart';
import 'package:forrira/screens/auth_screen.dart';

import 'package:http/http.dart' as http;
import 'package:no_context_navigation/no_context_navigation.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expriyDate;

  String _userId;
  Timer _authTimer;

  String get userId {
    return _userId;
  }

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
    String email,
    String password,
    String urlSegment,
  ) async {
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

      // print(responseData['localId']);
      // print(responseData['idToken']);

      _userId = responseData['localId'];
      _expriyDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      autoLogout();
      notifyListeners();
      // print(isAuth);
      //print('2222');
    } catch (error) {
      throw error;
    }
  }

  Future<void> signUP(
    String email,
    String password,
  ) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(
    String email,
    String password,
  ) async {
    return _authenticate(
      email,
      password,
      'signInWithPassword',
    );
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _expriyDate = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    print('55555555555555555555555');

    //  Navigator.of(ctx).pushReplacementNamed(AuthScreen.routeName);

//  Navigator.pushNamedAndRemoveUntil(
//             context, HomeyScreen.routeName, (_) => false);
//     // final prefs = await SharedPreferences.getInstance();
    // //prefs.remove('userData);
    // prefs.clear();
  }

  void autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    final timeExpiry = _expriyDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: 10), () {
      logout();
      //Navigator.pushNamedAndRemoveUntil(ctx, AuthScreen.routeName, (_) => false);

      navService.pushNamedAndRemoveUntil(AuthScreen.routeName);
    });
  }
}
