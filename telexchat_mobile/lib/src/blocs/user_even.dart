abstract class UserEvent {}

class UpdateProfile extends UserEvent {
  final String fullName;
  final String id;
  UpdateProfile({required this.fullName, required this.id});
}
