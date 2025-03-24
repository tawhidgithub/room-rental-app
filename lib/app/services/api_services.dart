import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {


  // Constructor to accept URL, method, data, and headers


  // Function to make the API request
  Future<Map<String, dynamic>?> makeRequest({required url ,required method,}) async {
    try {
      final uri = Uri.parse(url);
      http.Response response;

      // Choose the HTTP method dynamically
      switch (method.toUpperCase()) {
        case 'GET':
          response = await http.get(uri,);
          break;
        case 'POST':
          response = await http.post(
            uri,
            headers:  {"Content-Type": "application/json"},

          );
          break;
        case 'PUT':
          response = await http.put(
            uri,
            headers:{"Content-Type": "application/json"},
          );
          break;
        case 'DELETE':
          response = await http.delete(uri,);
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
