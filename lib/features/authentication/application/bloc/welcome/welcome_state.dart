part of 'welcome_bloc.dart';

sealed class WelcomeState extends Equatable{
  const WelcomeState();

  @override
  List<Object?> get props => [];
}

final class InitialState extends WelcomeState {
  const InitialState();
}

final class AuthenticationSuccessState  extends WelcomeState {
  const AuthenticationSuccessState({required this.contentNotification});

  final String contentNotification;
}

final class LoadingState extends WelcomeState{
  const LoadingState({required this.load});

  final bool load;
}

final class GetUserState extends WelcomeState{
  const GetUserState();
}

final class FailureGetUserState extends WelcomeState{
  const FailureGetUserState({required this.failure});

  final Failure failure;
}