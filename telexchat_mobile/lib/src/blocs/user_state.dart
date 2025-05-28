import 'package:telexchat_mobile/src/models/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UpdateSuccess extends UserState {
  final User user;
  UpdateSuccess(this.user);
}

class UpdateFailure extends UserState {
  final String error;
  UpdateFailure(this.error);
}
