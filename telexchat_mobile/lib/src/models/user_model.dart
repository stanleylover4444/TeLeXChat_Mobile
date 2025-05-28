class User {
  final String id;
  final String phoneNumber;
  final String fullName;
  final bool isActive;
  final String token;

  User({
    required this.id,
    required this.phoneNumber,
    required this.fullName,
    required this.isActive,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json, [String? token]) {
    return User(
      id: json['id'],
      phoneNumber: json['phoneNumber'],
      fullName: json['fullName'],
      isActive: json['isActive'],
      token: token ?? '',
    );
  }

  @override
  String toString() {
    return '{id: $id, phoneNumber: $phoneNumber, fullName: $fullName, isActive: $isActive, token: $token}';
  }
}
