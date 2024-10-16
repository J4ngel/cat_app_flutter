part of 'welcome_bloc.dart';

sealed class WelcomeEvent {
  const WelcomeEvent();
}

final class LoginUserEvent extends WelcomeEvent {
  const LoginUserEvent();
}