import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String url;
  final String method;
  final Map<String, dynamic>? data;
  final Map<String, String>? headers;

  // Constructor to accept URL, method, data, and headers
  ApiService({
    required this.url,
    required this.method,
    this.data,
    this.headers,
  });

  // Function to make the API request
  Future<Map<String, dynamic>?> makeRequest() async {
    try {
      final uri = Uri.parse(url);
      http.Response response;

      // Choose the HTTP method dynamically
      switch (method.toUpperCase()) {
        case 'GET':
          response = await http.get(uri, headers: headers);
          break;
        case 'POST':
          response = await http.post(
            uri,
            headers: headers ?? {"Content-Type": "application/json"},
            body: jsonEncode(data),
          );
          break;
        case 'PUT':
          response = await http.put(
            uri,
            headers: headers ?? {"Content-Type": "application/json"},
            body: jsonEncode(data),
          );
          break;
        case 'DELETE':
          response = await http.delete(uri, headers: headers);
          break;
        default:
          throw Exception('Invalid HTTP method: $method');
      }

      return _handleResponse(response);
    } catch (e) {
      print("Request Error: $e");
      return null;
    }
  }

  // Handle API response
  Map<String, dynamic>? _handleResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      print("API Error: ${response.statusCode} - ${response.body}");
      return null;
    }
  }
}
