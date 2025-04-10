import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/login_model.dart';

class LoginRepository {
  final String baseUrl = 'https://reqres.in/api';

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }
}
