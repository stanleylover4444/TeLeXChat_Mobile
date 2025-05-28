import 'package:get/get.dart';
import 'package:telexchat_mobile/src/blocs/auth_bloc.dart';
import 'package:telexchat_mobile/src/blocs/user_bloc.dart';
import 'package:telexchat_mobile/src/repositories/auth_repository.dart';
import 'package:telexchat_mobile/src/repositories/user_repository.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    // Repository
    Get.put<AuthRepository>(AuthRepository(), permanent: true);
    Get.put<UserRepository>(UserRepository(), permanent: true);

    // Bloc
    Get.put<AuthBloc>(AuthBloc(Get.find<AuthRepository>()), permanent: true);
    Get.put<UserBloc>(UserBloc(Get.find<UserRepository>()), permanent: true);
  }
}
