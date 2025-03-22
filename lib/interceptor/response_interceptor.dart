import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ResponseInterceptor {
  static final _storage = const FlutterSecureStorage();

  static void handleResponse(http.Response response) {
    if (response.statusCode == 401 || response.statusCode == 403) {
      _logoutUser();
    } else if (response.statusCode >= 400) {
      Fluttertoast.showToast(
          msg: "Error: ${response.statusCode} - ${response.body}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
    }
  }

  static void _logoutUser() async {
    await _storage.delete(key: 'token');
    // Redirect to login screen
    // Use navigator or other navigation mechanism depending on your app setup
    // Example: Navigator.pushNamed(context, '/login');
  }
}
