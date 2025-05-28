import 'package:get/get.dart';
import 'package:telexchat_mobile/src/blocs/auth_bloc.dart';
import 'package:telexchat_mobile/src/blocs/auth_event.dart';
import 'package:telexchat_mobile/src/blocs/user_even.dart';
import 'package:telexchat_mobile/src/blocs/user_state.dart';
import 'package:telexchat_mobile/src/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<UpdateProfile>((event, emit) async {
      try {
        final user = await userRepository.updateProfile(
          event.fullName,
          event.id,
        );
        Get.find<AuthBloc>().add(UpdateUser(user));
        emit(UpdateSuccess(user));
      } catch (e) {
        emit(UpdateFailure(e.toString()));
      }
    });
  }
}
