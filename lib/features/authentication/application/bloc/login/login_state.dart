part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState({required this.data});

  final LoginDto data;

  @override
  List<Object?> get props => [data];
}

final class InitialState extends LoginState{
   InitialState(): super(
      data: LoginDto.empty()
  );

}

final class DataLoginUpdated extends LoginState {
  const DataLoginUpdated({required super.data});
}