import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'request_interceptor.dart';
import 'response_interceptor.dart';

class ApiService {
  static const String apiUrl = String.fromEnvironment('VITE_API_URL');
  static const int timeoutDuration = 150000; // Adjust as needed
  static final _storage = const FlutterSecureStorage();

  static Future<http.Response> request(
    String endpoint, {
    String method = 'GET',
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final token = await _storage.read(key: 'token');

    // Apply request interceptor
    headers = await RequestInterceptor.modifyHeaders(headers, token);

    final Uri url = Uri.parse('$apiUrl$endpoint');

    try {
      http.Response response;

      switch (method) {
        case 'POST':
          response = await http
              .post(url, headers: headers, body: jsonEncode(body))
              .timeout(Duration(milliseconds: timeoutDuration));
          break;
        case 'PUT':
          response = await http
              .put(url, headers: headers, body: jsonEncode(body))
              .timeout(Duration(milliseconds: timeoutDuration));
          break;
        case 'DELETE':
          response = await http
              .delete(url, headers: headers)
              .timeout(Duration(milliseconds: timeoutDuration));
          break;
        default:
          response = await http
              .get(url, headers: headers)
              .timeout(Duration(milliseconds: timeoutDuration));
      }

      // Apply response interceptor
      ResponseInterceptor.handleResponse(response);

      return response;
    } catch (error) {
      throw Exception('Request failed: $error');
    }
  }
}
