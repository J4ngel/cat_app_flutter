import 'dart:async';

import 'package:cat_app_flutter/features/authentication/application/dtos/login_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState> {
  LoginBloc(): super(const InitialState()){
    _setUp();
  }

  void _setUp() {
    on<ChangeEmailEvent>(_onChangeEmailEvent);
    on<ChangePasswordEvent>(_onChangePasswordEvent);
  }

  FutureOr<void> _onChangeEmailEvent(ChangeEmailEvent event, Emitter<LoginState> emit) {
    final newData = state.data.copyWith(email: event.newEmail);
    final newState = DataLoginUpdated(data: newData);
    emit(newState);
  }

  FutureOr<void> _onChangePasswordEvent(ChangePasswordEvent event, Emitter<LoginState> emit) {
    final newData = state.data.copyWith(password: event.newPassword);
    final newState = DataLoginUpdated(data: newData);
    emit(newState);
  }
}