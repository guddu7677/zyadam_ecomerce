import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // URL of your API endpoint for registration
  static const String registerUrl = 'https://yourapi.com/api/register';
  static const String loginUrl = 'https://yourapi.com/api/login';

  // Function to register a user with email, password, and mobile number
  Future<bool> register(String firstname, String lastname, String email,
      String password, String mobile) async {
    final response = await http.post(
      Uri.parse(registerUrl),
      body: {
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'password': password,
        'mobile': mobile,
      },
    );

    if (response.statusCode == 201) {
      // Assuming 201 is the status code for success
      final data = jsonDecode(response.body);
      final token = data['token']; // Assuming the token is returned in 'token'

      // Save the token to shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt_token', token);

      return true;
    } else {
      // If registration fails, return false
      return false;
    }
  }

  // Function to authenticate the user and store the JWT token
  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token =
          data['token']; // Assuming the token is in the 'token' field.

      // Save the token to shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt_token', token);

      return true;
    } else {
      return false;
    }
  }

  // Function to get the stored JWT token
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt_token');
  }

  // Function to make an authenticated request with the JWT token
  Future<http.Response> getAuthenticatedData() async {
    final token = await getToken();
    if (token == null) {
      throw Exception('User not authenticated');
    }

    final response = await http.get(
      Uri.parse('https://yourapi.com/api/protected'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    return response;
  }

  // Function to logout the user by removing the token
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt_token');
  }
}
