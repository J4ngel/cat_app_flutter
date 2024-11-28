part of 'login_bloc.dart';

final class LoginEvent {
  const LoginEvent();
}

final class ChangeEmailEvent extends LoginEvent{
  const ChangeEmailEvent({required this.newEmail});

  final String newEmail;
}

final class ChangePasswordEvent extends LoginEvent{
  const ChangePasswordEvent({required this.newPassword});

  final String newPassword;
}