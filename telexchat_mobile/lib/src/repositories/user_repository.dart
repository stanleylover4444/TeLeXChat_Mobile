import 'package:get/get.dart';
import 'package:telexchat_mobile/src/models/user_model.dart';
import 'package:telexchat_mobile/src/utils/api.dart';

class UserRepository extends GetxController {
  final ApiClient apiClient = ApiClient();

  Future<User> updateProfile(String fullName, String id) async {
    final response = await apiClient.request(
      path: '/users/${id}',
      method: 'PUT',
      body: {'fullName': fullName},
    );

    if (response.statusCode == 200) {
      print("response.dataaaaaaa , ${response.data}");
      return User.fromJson(response.data);
    } else {
      throw Exception(response.message ?? 'Register failed');
    }
  }
}
