import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  // Function to make the API request
  Future<dynamic> makeRequest({required String url, required String method}) async {
    try {
      final uri = Uri.parse(url);
      http.Response response;

      // Choose the HTTP method dynamically
      switch (method.toUpperCase()) {
        case 'GET':
          response = await http.get(uri);
          break;
        case 'POST':
          response = await http.post(
            uri,
            headers: {"Content-Type": "application/json"},
          );
          break;
        case 'PUT':
          response = await http.put(
            uri,
            headers: {"Content-Type": "application/json"},
          );
          break;
        case 'DELETE':
          response = await http.delete(uri);
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
  dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      try {
        return jsonDecode(response.body);
      } catch (e) {
        print("Failed to parse response: $e");
        return null;
      }
    } else {
      print("API Error: ${response.statusCode} - ${response.body}");
      return null;
    }
  }
}