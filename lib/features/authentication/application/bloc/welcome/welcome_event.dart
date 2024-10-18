part of 'welcome_bloc.dart';

sealed class WelcomeEvent {
  const WelcomeEvent();
}

final class LoginUserEvent extends WelcomeEvent {
  const LoginUserEvent();
}

final class GetUserEvent extends WelcomeEvent {
  const GetUserEvent({
    required this.email,
    required this.phone
});

  final String email;
  final String phone;
}