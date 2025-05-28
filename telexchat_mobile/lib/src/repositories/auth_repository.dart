import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telexchat_mobile/src/models/user_model.dart';
import 'package:telexchat_mobile/src/utils/api.dart';

class AuthRepository extends GetxController {
  final ApiClient apiClient = ApiClient();

  Future<User> login(String phone, String password) async {
    final response = await apiClient.request(
      path: '/auth/login',
      method: 'POST',
      body: {
        'phoneNumber': phone,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final token = response.data['token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);

      return User.fromJson(response.data['user'], token);
    } else {
      throw Exception(response.message ?? 'Login failed');
    }
  }

  Future<User> register(String phone, String password, String fullName) async {
    final response = await apiClient.request(
      path: '/auth/register',
      method: 'POST',
      body: {
        'phoneNumber': phone,
        'password': password,
        'fullName': fullName,
      },
    );

    if (response.statusCode == 201) {
      return User.fromJson(response.data['user']);
    } else {
      throw Exception(response.message ?? 'Register failed');
    }
  }

  Future<User?> getUserFromToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token == null) return null;

    final response = await apiClient.request(
      path: '/auth/accessToken',
      method: 'POST',
      body: {'token': token},
    );

    if (response.statusCode == 200) {
      return User.fromJson(response.data, token);
    } else {
      return null;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }
}
