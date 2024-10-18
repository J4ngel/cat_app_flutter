import 'dart:async';

import 'package:cat_app_flutter/core/exceptions/failure.dart';
import 'package:cat_app_flutter/features/authentication/domain/use_cases/get_user_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc({
    required this.getUserUseCase
}): super(const InitialState()){
    on<LoginUserEvent>(_onLoginUserEvent);
    on<GetUserEvent>(_onGetUserEvent);
  }

  final GetUserUseCase getUserUseCase;

  FutureOr<void> _onLoginUserEvent(LoginUserEvent event, Emitter<WelcomeState> emit) {
    emit(const AuthenticationSuccessState(contentNotification: 'El usuario ha iniciado sesión'));
  }

  FutureOr<void> _onGetUserEvent(GetUserEvent event, Emitter<WelcomeState> emit) async {
    emit(const LoadingState(load: true));
    final response = await getUserUseCase(event.email, event.phone);
    response.fold((success) => emit(AuthenticationSuccessState(contentNotification: 'A iniciado sesión ${success.name} con el email: ${success.email}')), (failure) => emit(FailureGetUserState(failure: failure)));
  }
}