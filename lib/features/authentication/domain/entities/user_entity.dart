class UserEntity {
  const UserEntity({
    required this.email,
    this.name,
    required this.birthdate,
    required this.phone
  });

  final String email;
  final String? name;
  final DateTime birthdate;
  final String phone;
}