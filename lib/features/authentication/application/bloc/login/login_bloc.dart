import 'dart:async';

import 'package:cat_app_flutter/features/authentication/application/dtos/login_dto.dart';
import 'package:cat_app_flutter/shared/domain/value_objects/email_value_object.dart';
import 'package:cat_app_flutter/shared/domain/value_objects/password_value_object.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState> {
  LoginBloc(): super(InitialState()){
    _setUp();
  }

  void _setUp() {
    on<ChangeEmailEvent>(_onChangeEmailEvent);
    on<ChangePasswordEvent>(_onChangePasswordEvent);
  }

  FutureOr<void> _onChangeEmailEvent(ChangeEmailEvent event, Emitter<LoginState> emit) {
    final newData = state.data.copyWith(email: EmailValueObject(event.newEmail));
    final newState = DataLoginUpdated(data: newData);
    emit(newState);
  }

  FutureOr<void> _onChangePasswordEvent(ChangePasswordEvent event, Emitter<LoginState> emit) {
    final newData = state.data.copyWith(password: PasswordValueObject(event.newPassword));
    final newState = DataLoginUpdated(data: newData);
    emit(newState);
  }
}