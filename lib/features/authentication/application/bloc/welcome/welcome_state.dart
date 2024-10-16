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
  const AuthenticationSuccessState();
}