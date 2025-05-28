import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiResponse {
  final int statusCode;
  final dynamic data;
  final String? message;

  ApiResponse({
    required this.statusCode,
    this.data,
    this.message,
  });
}

class ApiClient {
  final String baseUrl = dotenv.env['API_BASE_URL']!;

  Future<ApiResponse> request({
    required String path,
    required String method,
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.parse('$baseUrl$path');
    final headers = {'Content-Type': 'application/json'};
    http.Response response;

    try {
      switch (method.toUpperCase()) {
        case 'POST':
          response = await http.post(uri, body: jsonEncode(body), headers: headers);
          break;
        case 'GET':
          response = await http.get(uri, headers: headers);
          break;
        case 'PUT':
          response = await http.put(uri, body: jsonEncode(body), headers: headers);
          break;
        case 'DELETE':
          response = await http.delete(uri, headers: headers);
          break;
        default:
          throw Exception('Unsupported HTTP method: $method');
      }

      final decoded = jsonDecode(response.body);
      return ApiResponse(
        statusCode: response.statusCode,
        data: decoded,
        message: decoded['message'] ?? null,
      );
    } catch (e) {
      return ApiResponse(
        statusCode: 500,
        message: 'Unexpected error: $e',
      );
    }
  }
}
