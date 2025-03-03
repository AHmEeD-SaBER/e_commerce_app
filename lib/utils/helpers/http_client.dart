import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpClient {
  static final String _baseUrl = 'https://api.example.com';

  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return handleResponse(response);
  }

  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic body) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    return handleResponse(response);
  }

  static Future<Map<String, dynamic>> put(String endpoint, dynamic body) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    return handleResponse(response);
  }

  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return handleResponse(response);
  }

  static Map<String, dynamic> handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
