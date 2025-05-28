import 'package:telexchat_mobile/src/models/user_model.dart';

abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class LoginRequested extends AuthEvent {
  final String phone;
  final String password;

  LoginRequested(this.phone, this.password);
}

class RegisterRequested extends AuthEvent {
  final String phone;
  final String password;
  final String fullName;

  RegisterRequested(this.phone, this.password, this.fullName);
}

class UpdateUser extends AuthEvent {
  final User user;
  UpdateUser(this.user);
}

class LogoutRequested extends AuthEvent {}
