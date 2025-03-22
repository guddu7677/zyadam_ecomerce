class RequestInterceptor {
  static Future<Map<String, String>> modifyHeaders(
      Map<String, String>? headers, String? token) async {
    headers ??= {};
    headers['content-type'] = 'multipart/form-data';

    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'JWT $token';
    }

    return headers;
  }
}
