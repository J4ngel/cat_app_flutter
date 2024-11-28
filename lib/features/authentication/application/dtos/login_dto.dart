final class LoginDto {
  const LoginDto({
    required this.email,
    required this.password
  });

  const LoginDto.empty() : this(
    email: '',
    password: ''
  );

  final String email;
  final String password;

  LoginDto copyWith ({
    String? email,
    String? password
}) =>
      LoginDto(
          email: email ?? this.email,
          password: password ?? this.password
      );
}